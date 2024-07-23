namespace Matches.Application.Models.Match;

public record Metadata(
    int Id, 
    DateTime CreatedAt,
    string CreateByUserId,
    Format Format,
    string TeamOneName,
    string TeamTwoName)
{
    public Metadata() : this(0, DateTime.MinValue, "", Format.TiebreakToTen, "", "")
    {
    }
}