using Microsoft.AspNetCore.Components;
using Microsoft.AspNetCore.Components.Rendering;
using RacketReel.Web.Domain;

namespace RacketReel.Web.Components;

public sealed class LocalTime : ComponentBase, IDisposable
{
    [Inject]
    public BrowserTimeProvider BrowserTimeProvider { get; set; } = default!;

    [Parameter]
    public DateTimeOffset? DateTimeOffset { get; set; }
    
    [Parameter]
    public string? Format { get; set; }

    protected override void OnInitialized()
    {
        BrowserTimeProvider.LocalTimeZoneChanged += LocalTimeZoneChanged;
    }

    protected override void BuildRenderTree(RenderTreeBuilder builder)
    {
        if (DateTimeOffset != null)
        {
            builder.AddContent(0, BrowserTimeProvider.ToLocalDateTime(DateTimeOffset.Value).ToString(Format));
        }
    }

    public void Dispose()
    {
        BrowserTimeProvider.LocalTimeZoneChanged -= LocalTimeZoneChanged;
    }

    private void LocalTimeZoneChanged(object? sender, EventArgs e)
    {
        _ = InvokeAsync(StateHasChanged);
    }
}