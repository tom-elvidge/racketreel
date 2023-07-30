using RacketReel.Application.Abstractions.Messaging;
using RacketReel.Application.Models;
using RacketReel.Application.Services;
using RacketReel.Domain.AggregatesModel.MatchAggregate;
using RacketReel.Domain.AggregatesModel.MatchAggregate.Formats;
using RacketReel.Domain.AggregatesModel.MatchAggregate.Participants;
using RacketReel.Domain.SeedWork;
using ApplicationFormat = RacketReel.Application.Models.Format;
using DomainFormat = RacketReel.Domain.AggregatesModel.MatchAggregate.Formats.Format;

namespace RacketReel.Application.Commands.CreateMatch;

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
            new NoUserParticipant(command.TeamOneName),
            new NoUserParticipant(command.TeamTwoName),
            command.ServingFirst == Team.TeamOne ? ParticipantEnum.One : ParticipantEnum.Two,
            CreateFormat(command.Format));

        _matchRepository.Add(matchEntity);
        await _matchRepository.UnitOfWork.SaveEntitiesAsync(cancellationToken);
        
        return Result.Success(StateCreator.CreateState(matchEntity, matchEntity.States.First()));
    }

    private DomainFormat CreateFormat(ApplicationFormat format) => format switch
    {
        ApplicationFormat.TiebreakToTen => TiebreakToTen.Create(),
        ApplicationFormat.BestOfOne => BestOfOne.Create(),
        ApplicationFormat.BestOfThree => BestOfThree.Create(),
        ApplicationFormat.BestOfThreeFinalSetTiebreak => BestOfThreeFinalSetTiebreak.Create(),
        ApplicationFormat.BestOfFive => BestOfFive.Create(),
        ApplicationFormat.BestOfFiveFinalSetTiebreak => BestOfThreeFinalSetTiebreak.Create(),
        ApplicationFormat.FastFour => FastFour.Create(),
        _ => throw new ArgumentException($"Format {format} is not supported by domain")
    };
}