using System.Runtime.CompilerServices;
using Grpc.Core;
using Grpc.Net.Client;
using Matches.Presentation;
using Microsoft.Extensions.Options;
using RacketReel.Web.Options;

namespace RacketReel.Web.Domain;

public record MatchState(
    int MatchId,
    string TeamOneName,
    string TeamTwoName,
    bool TeamOneIsServing,
    string TeamOnePoints,
    string TeamOneGames,
    string TeamOneSets,
    string TeamTwoPoints,
    string TeamTwoGames,
    string TeamTwoSets,
    string Format,
    DateTimeOffset StateCreatedAtUtc,
    DateTimeOffset MatchStartedAtUtc,
    bool IsCompleted);

public interface IMatchesProvider
{
    public IAsyncEnumerable<MatchState> GetMatchStateStream(
        int matchId,
        CancellationToken ct = default);
}

public class MatchesProvider : IMatchesProvider
{
    private GrpcChannel Channel { get; set; }
    private Matches.Presentation.Matches.MatchesClient Client { get; set; }
    
    public MatchesProvider(IOptions<MatchesServiceOptions> options)
    {
        Channel = GrpcChannel.ForAddress(options.Value.Uri);
        Client = new Matches.Presentation.Matches.MatchesClient(Channel);
    }

    public async IAsyncEnumerable<MatchState> GetMatchStateStream(
        int matchId,
        [EnumeratorCancellation] CancellationToken ct = default)
    {
        // ReSharper disable once RedundantNameQualifier
        var request = new Matches.Presentation.GetStateStreamRequest { MatchId = matchId };
        
        var stream = Client.GetStateStream(request, cancellationToken: ct);

        await foreach (var state in stream.ResponseStream.ReadAllAsync(ct))
        {
            yield return CreateMatchState(matchId, state);
            
            if (state.Completed) yield break;
        }
        
        stream.Dispose();
    }

    private MatchState CreateMatchState(int matchId, State state) => new MatchState(
        matchId,
        state.TeamOneName,
        state.TeamTwoName,
        state.Serving == Team.One,
        state.TeamOnePoints,
        state.TeamOneGames,
        state.TeamOneSets,
        state.TeamTwoPoints,
        state.TeamTwoGames,
        state.TeamTwoSets,
        state.Format switch
        {
            Format.BestOfOne => "Best of one set",
            Format.TiebreakToTen => "Tiebreak to ten",
            Format.BestOfThree => "Best of three sets",
            Format.BestOfThreeFst => "Best of three sets with a final set tiebreak",
            Format.BestOfFive => "Best of five sets",
            Format.BestOfFiveFst => "Best of five sets with a final set tiebreak",
            Format.Fast4 => "FAST4",
            _ => throw new ArgumentOutOfRangeException()
        },
        state.CreatedAtUtc.ToDateTimeOffset(),
        state.StartedAtUtc.ToDateTimeOffset(),
        state.Completed);
}