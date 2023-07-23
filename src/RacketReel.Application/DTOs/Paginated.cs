using System.Text;
using System.ComponentModel.DataAnnotations;
using System.Runtime.Serialization;
using Newtonsoft.Json;

namespace RacketReel.Application.DTOs;

/// <summary>
/// Data Transfer Object for describing a single page from a collection of data.
/// </summary>
[DataContract]
public class Paginated<T>
{
    /// <summary>
    /// Gets or Sets PageSize
    /// </summary>
    [Required]
    [DataMember(Name="pageSize", EmitDefaultValue=true)]
    public int PageSize { get; set; }

    /// <summary>
    /// Gets or Sets PageNumber
    /// </summary>
    [Required]
    [DataMember(Name="pageNumber", EmitDefaultValue=true)]
    public int PageNumber { get; set; }

    /// <summary>
    /// Gets or Sets PageCount
    /// </summary>
    [Required]
    [DataMember(Name="pageCount", EmitDefaultValue=true)]
    public int PageCount { get; set; }

    /// <summary>
    /// Gets or Sets Data
    /// </summary>
    [Required]
    [DataMember(Name="data", EmitDefaultValue=false)]
    public List<T> Data { get; set; } = new List<T>();

    /// <summary>
    /// Returns the string presentation of the object
    /// </summary>
    /// <returns>String presentation of the object</returns>
    public override string ToString()
    {
        var sb = new StringBuilder();
        sb.Append("class PaginatedResponse {\n");
        sb.Append("  PageSize: ").Append(PageSize).Append("\n");
        sb.Append("  PageNumber: ").Append(PageNumber).Append("\n");
        sb.Append("  PageCount: ").Append(PageCount).Append("\n");
        sb.Append("  Data: ").Append(Data).Append("\n");
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