using Matches.Application.Abstractions.Messaging;
using Matches.Application.Errors;
using Matches.Domain.AggregatesModel.MatchAggregate;
using Matches.Domain.SeedWork;

namespace Matches.Application.Commands.DeleteMatch;

public class DeleteMatchCommandHandler : ICommandHandler<DeleteMatchCommand>
{
    private readonly IMatchRepository _matchRepository;

    public DeleteMatchCommandHandler(IMatchRepository matchRepository)
    {
        _matchRepository = matchRepository ?? throw new ArgumentNullException(nameof(matchRepository));
    }

    public async Task<Result> Handle(DeleteMatchCommand command, CancellationToken cancellationToken)
    {
        var matchEntity = await _matchRepository.GetAsync(command.MatchId, false);
        
        if (matchEntity == null)
        {
            return Result.Failure(ApplicationErrors.NotFound);
        }

        if (matchEntity.UserId != command.UserId)
        {
            return Result.Failure(ApplicationErrors.Unauthorized);
        }
        
        try
        {
            var success = _matchRepository.Delete(command.MatchId);
            
            success = success && await _matchRepository.UnitOfWork.SaveEntitiesAsync(cancellationToken);
            
            return success ? Result.Success() : Result.Failure(ApplicationErrors.Unknown);
        }
        catch (Exception)
        {
            return Result.Failure(ApplicationErrors.Unknown);
        }
    }
}