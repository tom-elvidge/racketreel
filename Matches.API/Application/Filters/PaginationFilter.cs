namespace RacketReel.Services.Matches.API.Application.Filters;

public class PaginationFilter
{
    public int PageNumber { get; set; }
    public int PageSize { get; set; }

    public PaginationFilter()
    {
        this.PageNumber = 1;
        this.PageSize = 10;
    }

    public PaginationFilter(int pageNumber, int pageSize)
    {
        // todo: throw exceptions when pageNumber or pageSize are not valid
        this.PageNumber = pageNumber < 1 ? 1 : pageNumber;
        this.PageSize = pageSize > 10 ? 10 : pageSize;
    }
}