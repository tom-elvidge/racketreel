using System.Collections.Generic;

namespace RacketReel.Services.Matches.API.Application.Dtos;

public class ErrorsDto
{
    public IEnumerable<string> Errors { get; set; }
}