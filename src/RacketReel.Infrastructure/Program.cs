using MediatR;
using FluentValidation;
using Microsoft.EntityFrameworkCore;
using RacketReel.Infrastructure.Configuration;
using RacketReel.Infrastructure;
using RacketReel.Domain.AggregatesModel.MatchAggregate;
using RacketReel.Infrastructure.Repositories;
using RacketReel.Application.Behaviors;
using RacketReel.Presentation.Services;

var builder = WebApplication.CreateBuilder(args);
var services = builder.Services;

var pgsqlConnectionString = builder.Configuration.GetSection(nameof(Postgres)).Get<Postgres>().GetConnectionString();
var applicationAssembly = typeof(RacketReel.Application.AssemblyReference).Assembly;

services.AddDbContext<MatchesContext>(c => c.UseNpgsql(pgsqlConnectionString));
services.AddScoped<IMatchRepository, MatchRepository>();
services.AddMediatR(applicationAssembly);
services.AddScoped(typeof(IPipelineBehavior<,>), typeof(ValidationPipelineBehavior<,>));
services.AddValidatorsFromAssembly(applicationAssembly, includeInternalTypes: true);
services.AddGrpc();

var app = builder.Build();

app.MapGrpcService<MatchesService>();
app.MapGet("/", () => "Communication with gRPC endpoints must be made through the client.");

// Need to create a scope as cannot get scoped service from root provider
using (var scope = app.Services.CreateScope())
{
    var db = scope.ServiceProvider.GetRequiredService<MatchesContext>();
    db.Database.EnsureCreated();
}

app.Run();