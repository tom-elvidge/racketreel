using Matches.Application.DTOs;
using Matches.Application.Abstractions.Messaging;
using MediatR;
using Microsoft.Extensions.Logging;
using Matches.Domain.AggregatesModel.MatchAggregate;
using Matches.Domain.SeedWork;
using Matches.Application.Errors;
using Matches.Domain.Exceptions;
using Matches.Domain;

namespace Matches.Application.Commands.CreateState;

public class CreateStateCommandHandler : ICommandHandler<CreateStateCommand, Tuple<State, int>>
{
    private readonly IMediator _mediator;
    private readonly ILogger<CreateStateCommandHandler> _logger;
    private readonly IMatchRepository _matchRepository;

    public CreateStateCommandHandler(
        IMediator mediator,
        ILogger<CreateStateCommandHandler> logger,
        IMatchRepository matchRepository)
    {
        _mediator = mediator ?? throw new ArgumentNullException(nameof(mediator));
        _logger = logger ?? throw new ArgumentNullException(nameof(logger));
        _matchRepository = matchRepository ?? throw new ArgumentNullException(nameof(matchRepository));
    }

    public async Task<Result<Tuple<State, int>>> Handle(CreateStateCommand command, CancellationToken cancellationToken)
    {
        var matchEntity = await _matchRepository.GetAsync(command.MatchId, true);

        if (matchEntity == null)
            return Result.Failure<Tuple<State, int>>(ApplicationErrors.NotFound);

        if (command.Participant != matchEntity.ParticipantOne.Name
            && command.Participant != matchEntity.ParticipantTwo.Name)
            return ValidationResult<Tuple<State, int>>.WithErrors(new Error[] {
                new Error(
                    "Participant",
                    $"Participant must be one of the participants in the match.")});
        
        ParticipantEnum participant = command.Participant == matchEntity.ParticipantOne.Name
            ? ParticipantEnum.One
            : ParticipantEnum.Two;

        try
        {
            matchEntity.Update(participant);
        }
        catch (CannotUpdateACompletedMatchDomainException)
        {
            return Result.Failure<Tuple<State, int>>(ApplicationErrors.UpdateCompletedMatch);
        }

        await _matchRepository.UnitOfWork.SaveEntitiesAsync(cancellationToken);

        var stateEntity = matchEntity.States
            .OrderBy(s => s.CreatedAtDateTime)
            .LastOrDefault();
        var index = matchEntity.States.Count();
        
        return Result.Success<Tuple<State, int>>(new Tuple<State, int>(
            State.Create(
                matchEntity,
                stateEntity,
                Scorer.IsTiebreak(matchEntity.Format, stateEntity)),
            index));
    }
}