namespace Matches.Infrastructure.Configuration;

/// <summary>
/// Configuration for connecting to a Postgres database
/// </summary>
public sealed class Postgres
{
    /// <summary>
    /// Host
    /// </summary>
    public string? Host { get; init; }

    /// <summary>
    /// Port
    /// </summary>
    public string? Port { get; init; }

    /// <summary>
    /// Username
    /// </summary>
    public string? Username { get; init; }

    /// <summary>
    /// Password
    /// </summary>
    public string? Password { get; init; }

    /// <summary>
    /// Database
    /// </summary>
    public string? Database { get; init; }

    /// <summary>
    /// Return the connection string for this database
    /// </summary>
    public string GetConnectionString()
    {
        return $"Host={Host};Port={Port};Username={Username};Password={Password};Database={Database}";
    }
}