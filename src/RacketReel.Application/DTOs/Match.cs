using System.Text;
using System.ComponentModel.DataAnnotations;
using System.Runtime.Serialization;
using Newtonsoft.Json;
using RacketReel.Domain.AggregatesModel.MatchAggregate;
using RacketReel.Domain.AggregatesModel.MatchAggregate.Formats;
using RacketReel.Domain;

namespace RacketReel.Application.DTOs;

/// <summary>
/// Data Transfer Object for describing a match.
/// </summary>
[DataContract]
public class Match
{
    /// <summary>
    /// A unique identifier for this match.
    /// </summary>
    /// <value>A unique identifier for this match.</value>
    [Required]
    [DataMember(Name="id", EmitDefaultValue=true)]
    public int Id { get; set; }

    /// <summary>
    /// The date and time at which this match was created. String formatted as an ISO 8601 date and time in UTC.
    /// </summary>
    /// <value>The date and time at which this match was created. String formatted as an ISO 8601 date and time in UTC.</value>
    [Required]
    [DataMember(Name="createdAt", EmitDefaultValue=false)]
    public string CreatedAt { get; set; } = string.Empty;

    /// <summary>
    /// The date and time at which this match was completed. String formatted as an ISO 8601 date and time in UTC. Only included if the match has been completed.
    /// </summary>
    /// <value>The date and time at which this match was completed. String formatted as an ISO 8601 date and time in UTC. Only included if the match has been completed.</value>
    [DataMember(Name="completedAt", EmitDefaultValue=false)]
    public string CompletedAt { get; set; } = string.Empty;

    /// <summary>
    /// The list of participants in this match.
    /// </summary>
    /// <value>The list of participants in this match.</value>
    [Required]
    [DataMember(Name="participants", EmitDefaultValue=false)]
    public List<string> Participants { get; set; } = new List<string>();

    /// <summary>
    /// The participant who is serving first.
    /// </summary>
    /// <value>The participant who is serving first.</value>
    [Required]
    [DataMember(Name="servingFirst", EmitDefaultValue=false)]
    public string ServingFirst { get; set; } = string.Empty;

    /// <summary>
    /// The format of the match. This controls the rules and scoring.
    /// </summary>
    /// <value>The format of the match. This controls the rules and scoring.</value>
    [Required]
    [DataMember(Name="format", EmitDefaultValue=false)]
    [JsonProperty]
    public MatchFormatEnum Format { get; set; }

    /// <summary>
    /// The list of all the states in the match ordered by the created date and time.
    /// </summary>
    /// <value>The list of all the states in the match ordered by the created date and time.</value>
    [DataMember(Name="states", EmitDefaultValue=false)]
    [JsonProperty]
    public IList<State> States { get; set; }

    /// <summary>
    /// The summary of a completed match. Only included if the match has been completed.
    /// </summary>
    /// <value>The summary of a completed match. Only included if the match has been completed.</value>
    [DataMember(Name="summary", EmitDefaultValue=false)]
    public MatchSummary Summary { get; set; } = new MatchSummary();


    /// <summary>
    /// Returns the string presentation of the object
    /// </summary>
    /// <returns>String presentation of the object</returns>
    public override string ToString()
    {
        var sb = new StringBuilder();
        sb.Append("class Match {\n");
        sb.Append("  Id: ").Append(Id).Append("\n");
        sb.Append("  CreatedAt: ").Append(CreatedAt).Append("\n");
        sb.Append("  CompletedAt: ").Append(CompletedAt).Append("\n");
        sb.Append("  Players: ").Append(Participants).Append("\n");
        sb.Append("  ServingFirst: ").Append(ServingFirst).Append("\n");
        sb.Append("  Format: ").Append(Format).Append("\n");
        sb.Append("  States: ").Append(States).Append("\n");
        sb.Append("  Summary: ").Append(Summary).Append("\n");
        sb.Append("}\n");
        return sb.ToString();
    }

    /// <summary>
    /// Returns the JSON string presentation of the object
    /// </summary>
    /// <returns>JSON string presentation of the object</returns>
    public string ToJson()
    {
        return Newtonsoft.Json.JsonConvert.SerializeObject(this, Newtonsoft.Json.Formatting.Indented);
    }

    public static Match Create(MatchEntity matchEntity)
    {
        return new Match
        {
            Id = matchEntity.Id,
            CreatedAt = matchEntity.CreatedAtDateTime.ToUniversalTime().ToString("o"),
            CompletedAt = matchEntity.CompletedAtDateTime == DateTime.MaxValue
                ? null // not yet completed
                : matchEntity.CompletedAtDateTime.ToUniversalTime().ToString("o"),
            Participants = new List<string>() {
                matchEntity.ParticipantOne.Name,
                matchEntity.ParticipantTwo.Name
            },
            ServingFirst = matchEntity.ServingFirst == ParticipantEnum.One
                ? matchEntity.ParticipantOne.Name
                : matchEntity.ParticipantTwo.Name,
            Format = GetMatchFormatEnum(matchEntity.Format),
            States = matchEntity.States.Count() == 0
                ? null
                : matchEntity.States
                    .OrderBy(s => s.CreatedAtDateTime)
                    .Select(s => State.Create(
                        matchEntity,
                        s,
                        Scorer.IsTiebreak(matchEntity.Format, s)))
                    .ToList(),
            Summary = null
        };
    }

    private static MatchFormatEnum GetMatchFormatEnum(Format format)
    {
        if (format.Equals(TiebreakToTen.Create()))
        {
            return MatchFormatEnum.TiebreakToTen;
        }
        if (format.Equals(BestOfThreeSevenPointTiebreaker.Create()))
        {
            return MatchFormatEnum.BestOfThreeSevenPointTiebreaker;
        }
        if (format.Equals(BestOfFiveSevenPointTiebreaker.Create()))
        {
            return MatchFormatEnum.BestOfFiveSevenPointTiebreaker;
        }
        if (format.Equals(FastFour.Create()))
        {
            return MatchFormatEnum.FastFour;
        }
        throw new ApplicationException($"format {format} is not recognized as an option");
    }
}