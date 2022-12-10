using System.Reflection;

namespace Matches.Presentation;

/// <summary>
/// Class for getting the Assembly.
/// </summary>
public static class AssemblyReference {
    /// <summary>
    /// Field for getting the Assembly.
    /// </summary>
    public static readonly Assembly Assembly = typeof(AssemblyReference).Assembly;
}