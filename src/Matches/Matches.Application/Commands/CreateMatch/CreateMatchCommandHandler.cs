using Matches.Application.Models;
using Matches.Application.Abstractions.Messaging;
using Matches.Application.Models.Match;
using Matches.Application.Services;
using Matches.Domain.AggregatesModel.MatchAggregate;
using Matches.Domain.AggregatesModel.MatchAggregate.Formats;
using Matches.Domain.AggregatesModel.MatchAggregate.Participants;
using Matches.Domain.SeedWork;
using ApplicationFormat = Matches.Application.Models.Match.Format;
using DomainFormat = Matches.Domain.AggregatesModel.MatchAggregate.Formats.Format;
using Format = Matches.Application.Models.Match.Format;
using Match_Format = Matches.Application.Models.Match.Format;

namespace Matches.Application.Commands.CreateMatch;

public class CreateMatchCommandHandler : ICommandHandler<CreateMatchCommand, State>
{
    private readonly IMatchRepository _matchRepository;

    public CreateMatchCommandHandler(IMatchRepository matchRepository)
    {
        _matchRepository = matchRepository ?? throw new ArgumentNullException(nameof(matchRepository));
    }

    public async Task<Result<State>> Handle(CreateMatchCommand command, CancellationToken cancellationToken)
    {
        var matchEntity = MatchEntity.Create(
            command.UserId,
            new NoUserParticipant(command.TeamOneName),
            new NoUserParticipant(command.TeamTwoName),
            command.ServingFirst == Team.TeamOne ? ParticipantEnum.One : ParticipantEnum.Two,
            CreateFormat(command.Format));

        _matchRepository.Add(matchEntity);
        await _matchRepository.UnitOfWork.SaveEntitiesAsync(cancellationToken);
        
        return Result.Success(StateCreator.CreateState(matchEntity, matchEntity.States.First()));
    }

    private DomainFormat CreateFormat(Match_Format format) => format switch
    {
        Match_Format.TiebreakToTen => TiebreakToTen.Create(),
        Match_Format.BestOfOne => BestOfOne.Create(),
        Match_Format.BestOfThree => BestOfThree.Create(),
        Match_Format.BestOfThreeFinalSetTiebreak => BestOfThreeFinalSetTiebreak.Create(),
        Match_Format.BestOfFive => BestOfFive.Create(),
        Match_Format.BestOfFiveFinalSetTiebreak => BestOfThreeFinalSetTiebreak.Create(),
        Match_Format.FastFour => FastFour.Create(),
        Match_Format.LtaCambridgeDoublesLeague => LtaCambridgeDoublesLeague.Create(),
        _ => throw new ArgumentException($"Format {format} is not supported by domain")
    };
}