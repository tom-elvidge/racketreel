using Matches.Application.Abstractions.Messaging;
using Matches.Application.Errors;
using Matches.Domain.AggregatesModel.MatchAggregate;
using Matches.Domain.SeedWork;

namespace Matches.Application.Commands.ToggleHighlight;

public class ToggleHighlightCommandHandler : ICommandHandler<ToggleHighlightCommand>
{
    private readonly IMatchRepository _matchRepository;

    public ToggleHighlightCommandHandler(IMatchRepository matchRepository)
    {
        _matchRepository = matchRepository ?? throw new ArgumentNullException(nameof(matchRepository));
    }

    public async Task<Result> Handle(ToggleHighlightCommand command, CancellationToken cancellationToken)
    {
        var matchEntity = await _matchRepository.GetAsync(command.MatchId, true);
        
        if (matchEntity == null)
        {
            return Result.Failure(ApplicationErrors.NotFound);
        }

        StateEntity stateEntity;
        try
        {
            if (command.Version == null)
                stateEntity = matchEntity.States
                    .OrderBy(s => s.CreatedAtDateTime)
                    .Last();
            else
                stateEntity = matchEntity.States
                    .OrderBy(s => s.CreatedAtDateTime)
                    .Skip(command.Version.Value)
                    .First();
        }
        catch (Exception)
        {
            return Result.Failure(ApplicationErrors.NotFound);
        }
        
        stateEntity.Highlight = !stateEntity.Highlight;
        await _matchRepository.UnitOfWork.SaveEntitiesAsync(cancellationToken);

        return Result.Success();
    }
}