namespace RacketReel.Application.Common;

public record Error(string Code, string Message)
{
    public static Error None()
    {
        return new Error("", ""); 
    }
}