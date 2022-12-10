using System.Text;
using System.ComponentModel.DataAnnotations;
using System.Runtime.Serialization;
using Newtonsoft.Json;

namespace Matches.Presentation.Models
{ 
    /// <summary>
    /// The summary of the score for a single player in a set.
    /// </summary>
    [DataContract]
    public class PlayerSetSummary
    {
        /// <summary>
        /// The number of games won by the player in this set.
        /// </summary>
        /// <value>The number of games won by the player in this set.</value>
        [Required]
        [DataMember(Name="games", EmitDefaultValue=true)]
        public int Games { get; set; }

        /// <summary>
        /// The number of points won in the set tiebreak. Only used when the set goes to a tiebreak.
        /// </summary>
        /// <value>The number of points won in the set tiebreak. Only used when the set goes to a tiebreak.</value>
        [DataMember(Name="tiebreakPoints", EmitDefaultValue=true)]
        public int? TiebreakPoints { get; set; }

        /// <summary>
        /// Returns the string presentation of the object
        /// </summary>
        /// <returns>String presentation of the object</returns>
        public override string ToString()
        {
            var sb = new StringBuilder();
            sb.Append("class PlayerSetSummary {\n");
            sb.Append("  Games: ").Append(Games).Append("\n");
            sb.Append("  TiebreakPoints: ").Append(TiebreakPoints).Append("\n");
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
    }
}