using System;
using System.Reflection;
using Microsoft.AspNetCore.Builder;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using MediatR;
using FluentValidation;
using RacketReel.Services.Matches.Infrastructure;
using RacketReel.Services.Matches.Infrastructure.Repositories;
using RacketReel.Services.Matches.Domain.AggregatesModel.MatchAggregate;
using RacketReel.Services.Matches.API.Application.PipelineBehaviours;
using System.Text.Json.Serialization;

var builder = WebApplication.CreateBuilder(args);
var services = builder.Services;

services.AddDbContext<MatchesContext>(c =>
    c.UseNpgsql(builder.Configuration["ConnectionString"])
);

services.AddMvc().AddJsonOptions(options =>
{
    options.JsonSerializerOptions.DefaultIgnoreCondition = JsonIgnoreCondition.WhenWritingNull;
});

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
