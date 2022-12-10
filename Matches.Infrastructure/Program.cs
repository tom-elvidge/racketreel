using Microsoft.OpenApi.Models;
using Newtonsoft.Json.Converters;
using Newtonsoft.Json.Serialization;

var builder = WebApplication.CreateBuilder(args);
var services = builder.Services;

// Separate project for Presentation so it cannot access infrastructure directly
var presentationAssembly = typeof(Matches.Presentation.AssemblyReference).Assembly;

services
    .AddControllers()
    .AddApplicationPart(presentationAssembly)
    .AddNewtonsoftJson(opts =>
    {
        opts.SerializerSettings.ContractResolver = new CamelCasePropertyNamesContractResolver();
        opts.SerializerSettings.Converters.Add(new StringEnumConverter
        {
            NamingStrategy = new CamelCaseNamingStrategy()
        });
    });

services.AddSwaggerGen(c =>
{
    c.SwaggerDoc("0.2.2", new OpenApiInfo
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

    // adds documentation from the C# generated documentation file
    // this must be enabled in the csproj
    c.IncludeXmlComments($"{AppContext.BaseDirectory}{Path.DirectorySeparatorChar}{presentationAssembly.GetName().Name}.xml");
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

if (app.Environment.IsDevelopment())
{
    {
        app.UseDeveloperExceptionPage();
        app.UseSwagger(c =>
            {
                c.RouteTemplate = "openapi/{documentName}/openapi.json";
            })
            .UseSwaggerUI(c =>
            {
                // set route prefix to openapi, e.g. http://localhost:8080/openapi/index.html
                c.RoutePrefix = "openapi";
                c.SwaggerEndpoint("/openapi/0.2.2/openapi.json", "Matches Service");
            });
    }
}

app.UseRouting();
app.UseEndpoints(endpoints =>
{
    endpoints.MapControllers();
});

// Use the $PORT environment variable if set otherwise default to 8080
var port = Environment.GetEnvironmentVariable("PORT") ?? "8080";
var url = $"http://0.0.0.0:{port}";
app.Run(url);
