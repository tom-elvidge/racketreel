namespace Matches.Application.Models;

public record Paginated<T>(
    int PageSize,
    int PageNumber,
    int PageCount,
    List<T> Page)
{
    public Paginated() : this(0, 0, 0, new List<T>())
    {
    }
}