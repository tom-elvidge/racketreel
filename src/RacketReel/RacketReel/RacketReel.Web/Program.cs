using RacketReel.Web.Components;
using MudBlazor.Services;
using RacketReel.Web.Domain;
using RacketReel.Web.Options;

var builder = WebApplication.CreateBuilder(args);

builder.Services.AddRazorComponents()
    .AddInteractiveServerComponents();

builder.Services.AddMudServices();

builder.Services.Configure<MatchesServiceOptions>(
    builder.Configuration.GetSection(key: MatchesServiceOptions.Key));

builder.Services.AddScoped<IMatchesProvider, MatchesProvider>();
builder.Services.AddScoped<BrowserTimeProvider, BrowserTimeProvider>();
builder.Services.AddSingleton(TimeProvider.System);

var app = builder.Build();

if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/Error", createScopeForErrors: true);
app.UseHsts();
}

app.UseHttpsRedirection();

app.UseStaticFiles();
app.UseAntiforgery();

app.MapRazorComponents<App>()
    .AddInteractiveServerRenderMode();

app.Run();