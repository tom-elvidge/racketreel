using MediatR;
using FluentValidation;
using Microsoft.AspNetCore.Server.Kestrel.Core;
using Microsoft.EntityFrameworkCore;
using Matches.Infrastructure.Configuration;
using Matches.Infrastructure;
using Matches.Domain.AggregatesModel.MatchAggregate;
using Matches.Infrastructure.Repositories;
using Matches.Application.Behaviors;
using Matches.Presentation.Services;

var builder = WebApplication.CreateBuilder(args);
var services = builder.Services;

var pgsqlConnectionString = builder.Configuration.GetSection(nameof(Postgres)).Get<Postgres>().GetConnectionString();
var applicationAssembly = typeof(Matches.Application.AssemblyReference).Assembly;

services.AddDbContext<MatchesContext>(c => c.UseNpgsql(pgsqlConnectionString));
services.AddScoped<IMatchRepository, MatchRepository>();
services.AddMediatR(applicationAssembly);
services.AddScoped(typeof(IPipelineBehavior<,>), typeof(ValidationPipelineBehavior<,>));
services.AddValidatorsFromAssembly(applicationAssembly, includeInternalTypes: true);
services.AddGrpc();

// todo move to config with options
services.AddAuthentication().AddJwtBearer(options =>
{
    options.Authority = "https://securetoken.google.com/racketreel-6453d";
    options.Audience = "racketreel-6453d";
});

services.AddAuthorization(options =>
{
    options.AddPolicy("UsersOnly", policy => policy.RequireClaim("user_id"));
});

// TODO: ONLY IN DEV: HTTP/2 endpoint without TLS 
builder.WebHost.ConfigureKestrel(options =>
{
    options.ListenLocalhost(7192, o => o.Protocols = HttpProtocols.Http2);
});

var app = builder.Build();

app.MapGet("/", () => "Communication with gRPC endpoints must be made through the client.");

app.MapGrpcService<MatchesRpcService>();
// Need to create a scope as cannot get scoped service from root provider
using (var scope = app.Services.CreateScope())
{
    var matchesDb = scope.ServiceProvider.GetRequiredService<MatchesContext>();
    matchesDb.Database.EnsureCreated();
}

app.Run();