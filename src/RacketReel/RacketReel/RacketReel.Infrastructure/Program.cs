using Microsoft.AspNetCore.Server.Kestrel.Core;
using Microsoft.EntityFrameworkCore;
using RacketReel.Domain.Users;
using RacketReel.Infrastructure;
using RacketReel.Infrastructure.Options;
using RacketReel.Infrastructure.Outbox;
using RacketReel.Infrastructure.Users;

var builder = WebApplication.CreateBuilder(args);

builder.WebHost.ConfigureKestrel(options =>
{
    // Setup a HTTP/2 endpoint without TLS.
    options.ListenLocalhost(5000, o => o.Protocols = HttpProtocols.Http2);
});

var services = builder.Services;

var applicationAssembly = typeof(RacketReel.Application.AssemblyReference).Assembly;

services.AddMediatR(cfg => cfg.RegisterServicesFromAssemblies(applicationAssembly));

var postgresConfig = builder.Configuration.GetSection(nameof(Postgres)).Get<Postgres>()!;

services.AddSingleton<UpdateOutboxInterceptor>();

services.AddDbContext<ApplicationDbContext>((sp, options) =>
{
    var interceptor = sp.GetService<UpdateOutboxInterceptor>();
    options.UseNpgsql(postgresConfig.GetConnectionString()).AddInterceptors(interceptor!);
});

services.AddScoped<IUserInfoRepository, UserInfoRepository>();
services.AddScoped<IFollowerRepository, FollowerRepository>();

var authConfig = builder.Configuration.GetSection(nameof(OAuth)).Get<OAuth>()!;

services.AddAuthentication().AddJwtBearer(options =>
{
    options.Authority = authConfig.Authority;
    options.Audience = authConfig.Audience;
});

services.AddAuthorizationBuilder().AddPolicy(Constants.Policies.Users, policy => policy.RequireClaim("user_id"));

services.AddGrpc();

var app = builder.Build();

app.MapGrpcService<UsersRpcService>();

app.Run();