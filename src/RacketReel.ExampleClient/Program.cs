using Grpc.Net.Client;
using RacketReel.Presentation;

using var channel = GrpcChannel.ForAddress("https://localhost:7192");
var client = new Matches.MatchesClient(channel);

var configureRequest = new ConfigureRequest
{
    Format = Format.TiebreakToTen,
    ServingFirst = Team.One,
    TeamOneName = "Tom Elvidge",
    TeamTwoName = "Joe Bloggs"
};
Console.Write($"Configuring new match {configureRequest}");

var configureReply = await client.ConfigureAsync(configureRequest);
Console.WriteLine($"Configured id: {configureReply.MatchId}");

var getState = await client.GetStateAsync(
    new GetStateRequest
    {
        MatchId = configureReply.MatchId
    });
Console.WriteLine($"State of match {getState.State}");

await client.AddPointAsync(
    new AddPointRequest
    {
        MatchId = configureReply.MatchId,
        Team = Team.One
    });
Console.WriteLine("Added point to team one");

var getStateAgain = await client.GetStateAsync(
    new GetStateRequest
    {
        MatchId = configureReply.MatchId
    });
Console.WriteLine($"State of match {getStateAgain.State}");

await client.UndoPointAsync(
    new UndoPointRequest
    {
        MatchId = configureReply.MatchId
    });
Console.WriteLine($"Undo the last point");

var getStateAgainAgain = await client.GetStateAsync(
    new GetStateRequest
    {
        MatchId = configureReply.MatchId
    });
Console.WriteLine($"State of match {getStateAgainAgain.State}");

var summariesPageOne = await client.GetSummariesAsync(
    new GetSummariesRequest
    {
        PageSize = 10,
        PageNumber = 1
    });
Console.WriteLine($"First page of match summaries {summariesPageOne.Summaries}");