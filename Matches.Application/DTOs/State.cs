using System.ComponentModel.DataAnnotations;
using System.Runtime.Serialization;
using Matches.Domain.AggregatesModel.MatchAggregate;

namespace Matches.Application.DTOs;

/// <summary>
/// Data Transfer Object for describing a match.
/// </summary>
[DataContract]
public class State
{
    /// <summary>
    /// The date and time at which this state was created. String formatted as an ISO 8601 date and time in UTC.
    /// </summary>
    /// <value>The date and time at which this state was created. String formatted as an ISO 8601 date and time in UTC.</value>
    [Required]
    [DataMember(Name="createdAt", EmitDefaultValue=true)]
    public string CreatedAt { get; private set; }

    /// <summary>
    /// The participant who is serving.
    /// </summary>
    /// <value>The participant who is serving.</value>
    [Required]
    [DataMember(Name="serving", EmitDefaultValue=true)]
    public string Serving { get; private set; }

    /// <summary>
    /// A mapping from the name of each participant as a string to their score.
    /// </summary>
    /// <value>A mapping from the name of each participant as a string to their score.</value>
    [Required]
    [DataMember(Name="score", EmitDefaultValue=true)]
    public IDictionary<string, ParticipantScore> Score { get; private set; }

    /// <summary>
    /// A flag to mark the time from the previous state until this state as in a tiebreak.
    /// </summary>
    /// <value>A flag to mark the time from the previous state until this state as in a tiebreak.</value>
    [Required]
    [DataMember(Name="tiebreak", EmitDefaultValue=true)]
    public bool Tiebreak { get; private set; }

    /// <summary>
    /// A flag to mark the time from the previous state until this state as a highlight.
    /// </summary>
    /// <value>A flag to mark the time from the previous state until this state as a highlight.</value>
    [Required]
    [DataMember(Name="highlight", EmitDefaultValue=true)]
    public bool Highlight { get; private set; }

    public static State Create(MatchEntity matchEntity, StateEntity stateEntity, bool tiebreak)
    {
        return new State
        {
            CreatedAt = stateEntity.CreatedAtDateTime.ToUniversalTime().ToString("o"),
            Serving = stateEntity.Serving == ParticipantEnum.One ? matchEntity.ParticipantOne.Name : matchEntity.ParticipantTwo.Name,
            Score = new Dictionary<string, ParticipantScore>()
            {
                { matchEntity.ParticipantOne.Name, new ParticipantScore(stateEntity.Score.P1Points, stateEntity.Score.P1Games, stateEntity.Score.P1Sets) },
                { matchEntity.ParticipantTwo.Name, new ParticipantScore(stateEntity.Score.P2Points, stateEntity.Score.P2Games, stateEntity.Score.P2Sets) },
            },
            Tiebreak = tiebreak,
            Highlight = stateEntity.Highlight
        };
    }
}