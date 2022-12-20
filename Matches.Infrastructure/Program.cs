using System.Reflection;
using System.Text;
using Microsoft.OpenApi.Models;
using Newtonsoft.Json.Converters;
using Newtonsoft.Json.Serialization;
using MediatR;
using Microsoft.EntityFrameworkCore;
using Matches.Infrastructure.Configuration;
using Matches.Infrastructure;
using Matches.Domain.AggregatesModel.MatchAggregate;
using Matches.Infrastructure.Repositories;

string XmlCommentsPath(Assembly assembly)
{
    var sb = new StringBuilder();
    sb.Append(AppContext.BaseDirectory);
    sb.Append(Path.DirectorySeparatorChar);
    sb.Append(assembly.GetName().Name);
    sb.Append(".xml");
    return sb.ToString();
}

var builder = WebApplication.CreateBuilder(args);
var services = builder.Services;

var postgres = builder.Configuration.GetSection(nameof(Postgres)).Get<Postgres>();
var connectionString = postgres.GetConnectionString();
services.AddDbContext<MatchesContext>(
    c => c.UseNpgsql(connectionString)
);

services.AddScoped<IMatchRepository, MatchRepository>();

var applicationAssembly = typeof(Matches.Application.AssemblyReference).Assembly;
services.AddMediatR(applicationAssembly);

// Separate project for Presentation so it cannot access infrastructure directly
var presentationAssembly = typeof(Matches.Presentation.AssemblyReference).Assembly;
services
    .AddControllers()
    .AddApplicationPart(presentationAssembly)
    .AddNewtonsoftJson(opts =>
    {
        // Use camelCase for properties
        opts.SerializerSettings.ContractResolver = new CamelCasePropertyNamesContractResolver();
        // Use PascalCase for enum string conversions
        opts.SerializerSettings.Converters.Add(new StringEnumConverter());
    });

services.AddSwaggerGen(c =>
{
    c.SwaggerDoc("v1", new OpenApiInfo
    {
        Title = "Racket Reel Matches",
        Description = "A web services for configuring and scoring tennis matches.",
        TermsOfService = new Uri("https://github.com/tom-elvidge/racketreel-matches"),
        Contact = new OpenApiContact
        {
            Name = "Tom Elvidge",
            Url = new Uri("https://github.com/tom-elvidge"),
            Email = "tom@racketreel.com"
        },
        License = new OpenApiLicense
        {
            Name = "NoLicense",
            Url = new Uri("http://localhost")
        },
        Version = "0.2.2",
    });

    // adds documentation for the controllers and DTOs
    // documentation generation must be enabled in the csproj files
    c.IncludeXmlComments(XmlCommentsPath(presentationAssembly));
    c.IncludeXmlComments(XmlCommentsPath(applicationAssembly));
});
services.AddSwaggerGenNewtonsoftSupport();

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
app.UseHttpsRedirection();
app.UseDefaultFiles();
app.UseStaticFiles();
app.UseHsts();
app.UseRouting();
app.UseEndpoints(endpoints =>
{
    endpoints.MapControllers();
});

if (app.Environment.IsDevelopment())
{
    app.UseDeveloperExceptionPage();
    app.UseSwagger(c =>
    {
        c.RouteTemplate = "openapi/{documentName}/openapi.json";
    });
    app.UseSwaggerUI(c =>
    {
        // http://localhost:8080/openapi/index.html
        c.RoutePrefix = "openapi";
        c.SwaggerEndpoint("/openapi/v1/openapi.json", "v1");
    });
}

// Need to create a scope as cannot get scoped service from root provider
using (var scope = app.Services.CreateScope())
{
    var db = scope.ServiceProvider.GetRequiredService<MatchesContext>();
    db.Database.EnsureCreated();
}

app.Run();