using Microsoft.AspNetCore.Builder;
using Microsoft.Data.Sqlite;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.DependencyInjection;
using RacketReel.Services.Matches.Infrastructure;
using RacketReel.Services.Matches.Infrastructure.Repositories;
using RacketReel.Services.Matches.Domain.AggregatesModel.MatchAggregate;
using MediatR;
using FluentValidation;
using RacketReel.Services.Matches.API.Application.PipelineBehaviours;
using Microsoft.Extensions.Hosting;
using System.Reflection;
using System;

var builder = WebApplication.CreateBuilder(args);
var services = builder.Services;

// var connection = new SqliteConnection("DataSource=:memory:");
// connection.Open();

services.AddDbContext<MatchesContext>(c =>
    // c.UseSqlite(connection),
    // ServiceLifetime.Scoped
    c.UseSqlServer(builder.Configuration["ConnectionString"],
    sqlServerOptionsAction: sqlOptions =>
    {
        sqlOptions.MigrationsAssembly(typeof(Program).GetTypeInfo().Assembly.GetName().Name);
        // Configuring Connection Resiliency: https://docs.microsoft.com/en-us/ef/core/miscellaneous/connection-resiliency 
        sqlOptions.EnableRetryOnFailure(maxRetryCount: 15, maxRetryDelay: TimeSpan.FromSeconds(30), errorNumbersToAdd: null);
    })
);

services.AddMvc();

services.AddScoped<IMatchRepository, MatchRepository>();

services.AddMediatR(typeof(Program));
services.AddValidatorsFromAssembly(typeof(Program).Assembly);
services.AddTransient(typeof(IPipelineBehavior<,>), typeof(ValidationBehaviour<,>));
// Todo: Add logging to the pipeline

services.AddControllers();

var app = builder.Build();

if (app.Environment.IsDevelopment())
{
    app.UseDeveloperExceptionPage();

    // Automatically create database tables when developing
    // Need this as cannot get scoped service from root provider
    using (var scope = app.Services.CreateScope())
    {
        var db = scope.ServiceProvider.GetRequiredService<MatchesContext>();
        db.Database.EnsureCreated();
    }
}

app.UseHttpsRedirection();
app.MapControllers();

app.Run();
