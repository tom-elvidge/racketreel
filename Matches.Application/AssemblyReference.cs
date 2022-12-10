using System.Reflection;

namespace Matches.Application;

/// <summary>
/// Class for getting the Assembly.
/// </summary>
public static class AssemblyReference {
    /// <summary>
    /// Field for getting the Assembly.
    /// </summary>
    public static readonly Assembly Assembly = typeof(AssemblyReference).Assembly;
}