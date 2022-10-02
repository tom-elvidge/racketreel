#nullable disable

using System;
using System.Text.Json.Serialization;
using Microsoft.AspNetCore.Builder;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Configuration;
using RacketReel.Matches.Presentation.Configuration;
using RacketReel.Services.Matches.Infrastructure;
using RacketReel.Services.Matches.Infrastructure.Repositories;
using RacketReel.Services.Matches.Domain.AggregatesModel.MatchAggregate;

var builder = WebApplication.CreateBuilder(args);
var services = builder.Services;

var databaseSection = builder.Configuration.GetSection(nameof(DatabaseConfiguration));
var databaseConfiguration = databaseSection.Get<DatabaseConfiguration>();
var connectionString = databaseConfiguration.GetConnectionString();

services.AddDbContext<MatchesContext>(
    c => c.UseNpgsql(connectionString)
);

services.AddScoped<IMatchRepository, MatchRepository>();

services.AddControllers();

services.AddMvc().AddJsonOptions(options =>
{
    options.JsonSerializerOptions.DefaultIgnoreCondition = JsonIgnoreCondition.WhenWritingNull;
});

var AllOrigins = "_allOrigins";

services.AddCors(options =>
{
    options.AddPolicy(name: AllOrigins, policy  =>
    {
        policy.WithOrigins("*");
    });
});

var app = builder.Build();

app.UseCors(AllOrigins);

if (app.Environment.IsDevelopment())
{
    app.UseDeveloperExceptionPage();
}

// Need to create a scope as cannot get scoped service from root provider
using (var scope = app.Services.CreateScope())
{
    var db = scope.ServiceProvider.GetRequiredService<MatchesContext>();
    db.Database.EnsureCreated();
}

app.UseHttpsRedirection();
app.MapControllers();

// Use the $PORT environment variable if set otherwise default to 8080
var port = Environment.GetEnvironmentVariable("PORT") ?? "8080";
var url = $"http://0.0.0.0:{port}";
app.Run(url);
