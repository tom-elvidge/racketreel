namespace RacketReel.Infrastructure.Options;

public sealed class OAuth
{
    public string Audience { get; init; } = null!;
    
    public string Authority { get; init; } = null!;
}