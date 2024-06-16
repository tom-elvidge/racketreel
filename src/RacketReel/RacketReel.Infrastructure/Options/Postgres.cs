namespace RacketReel.Infrastructure.Options;

public sealed class Postgres
{
    public string Host { get; init; } = null!;
    
    public string Port { get; init; } = null!;
    
    public string Username { get; init; } = null!;
    
    public string Password { get; init; } = null!;
    
    public string Database { get; init; } = null!;
    
    public string GetConnectionString()
    {
        return $"Host={Host};Port={Port};Username={Username};Password={Password};Database={Database}";
    }
}