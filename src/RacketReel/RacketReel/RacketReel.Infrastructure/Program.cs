using Microsoft.AspNetCore.DataProtection;
using Microsoft.AspNetCore.DataProtection.KeyManagement;
using Microsoft.AspNetCore.DataProtection.Repositories;
using Microsoft.EntityFrameworkCore;
using RacketReel.Domain.Users;
using RacketReel.Infrastructure;
using RacketReel.Infrastructure.Options;
using RacketReel.Infrastructure.Outbox;
using RacketReel.Infrastructure.Users;

var builder = WebApplication.CreateBuilder(args);

var services = builder.Services;

var keysDirectory = new DirectoryInfo("./.aspnet/DataProtection-Keys");

services.AddDataProtection()
    .PersistKeysToFileSystem(keysDirectory)
    .SetApplicationName("Racket Reel")
    .UseCryptographicAlgorithms(new Microsoft.AspNetCore.DataProtection.AuthenticatedEncryption.ConfigurationModel.AuthenticatedEncryptorConfiguration()
    {
        EncryptionAlgorithm = Microsoft.AspNetCore.DataProtection.AuthenticatedEncryption.EncryptionAlgorithm.AES_256_CBC,
        ValidationAlgorithm = Microsoft.AspNetCore.DataProtection.AuthenticatedEncryption.ValidationAlgorithm.HMACSHA256
    });

// Explicitly configure the XML repository with NullXmlEncryptor
services.Configure<KeyManagementOptions>(options =>
{
#pragma warning disable ASP0000
    options.XmlRepository = new FileSystemXmlRepository(keysDirectory, services.BuildServiceProvider().GetService<ILoggerFactory>()!);
#pragma warning restore ASP0000
    options.XmlEncryptor = new NullXmlEncryptor();
});

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