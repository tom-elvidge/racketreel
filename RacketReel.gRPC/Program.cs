using RacketReel.gRPC.Services;

var builder = WebApplication.CreateBuilder(args);
builder.Services.AddGrpc();

var app = builder.Build();
app.MapGrpcService<MatchesService>();
app.MapGet("/", () => "Communication with gRPC endpoints must be made through the client.");
app.Run();