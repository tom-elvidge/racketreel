#nullable enable

namespace RacketReel.Services.Matches.API.Application.Dtos;

public class Response<T> where T : class
{
    public T? Data { get; set; }
    public string[]? Errors { get; set; }

    public Response()
    {
    }

    public Response(T data)
    {
        Errors = null;
        Data = data;
    }

    public Response(string[] errors)
    {
        Errors = errors;
        Data = null;
    }
}