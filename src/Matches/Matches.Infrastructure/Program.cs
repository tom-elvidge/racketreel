using MediatR;
using FluentValidation;
using Microsoft.EntityFrameworkCore;
using Matches.Infrastructure.Configuration;
using Matches.Infrastructure;
using Matches.Domain.AggregatesModel.MatchAggregate;
using Matches.Infrastructure.Repositories;
using Matches.Application.Behaviors;
using Matches.Infrastructure.Options;
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

var authConfig = builder.Configuration.GetSection(nameof(OAuth)).Get<OAuth>()!;

services.AddAuthentication().AddJwtBearer(options =>
{
    options.Authority = authConfig.Authority;
    options.Audience = authConfig.Audience;
});

services.AddAuthorization(options =>
{
    options.AddPolicy("UsersOnly", policy => policy.RequireClaim("user_id"));
});

var app = builder.Build();

app.MapGrpcService<MatchesRpcService>();

app.Run();