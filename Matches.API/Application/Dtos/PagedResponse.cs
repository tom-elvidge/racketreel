using System;

namespace RacketReel.Services.Matches.API.Application.Dtos;

public class PagedResponse<T> : Response<T> where T : class
{
    public int PageNumber { get; set; }
    public int PageSize { get; set; }
    public int PageCount { get; set; }
    
    public PagedResponse(T data, int pageNumber, int pageSize, int pageCount)
    {
        this.PageNumber = pageNumber;
        this.PageSize = pageSize;
        this.PageCount = pageCount;
        this.Data = data;
        this.Errors = null;
    }
}