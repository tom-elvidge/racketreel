namespace RacketReel.Services.Matches.API.Application.Configuration;

public class DatabaseConfig
{
    public string Host { get; set; }
    public string Port { get; set; }
    public string Username { get; set; }
    public string Password { get; set; }
    public string Database { get; set; }

    public string GetConnectionString()
    {
        return $"Host={Host};Port={Port};Username={Username};Password={Password};Database={Database}";
    }
}
