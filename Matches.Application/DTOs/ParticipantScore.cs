using System.ComponentModel.DataAnnotations;
using System.Runtime.Serialization;

namespace Matches.Application.DTOs;

/// <summary>
/// The score for a participant at a certain state.
/// </summary>
[DataContract]
public class ParticipantScore
{
    /// <summary>
    /// The number of points this participant has. Represented as an integer such as 0, 1, 2 etc rather than 0, 15, 30 etc.
    /// </summary>
    /// <value>The number of points this participant has. Represented as an integer such as 0, 1, 2 etc rather than 0, 15, 30 etc.</value>
    [Required]
    [DataMember(Name="points", EmitDefaultValue=true)]
    public int Points { get; private set; }

    /// <summary>
    /// The number of games this participant has.
    /// </summary>
    /// <value>The number of games this participant has.</value>
    [Required]
    [DataMember(Name="games", EmitDefaultValue=true)]
    public int Games { get; private set; }

    /// <summary>
    /// The number of games this participant has.
    /// </summary>
    /// <value>The number of games this participant has.</value>
    [Required]
    [DataMember(Name="sets", EmitDefaultValue=true)]
    public int Sets { get; private set; }

    public ParticipantScore(int points, int games, int sets)
    {
        Points = points;
        Games = games;
        Sets = sets;
    }
}