using System.Text;

namespace RacketReel.Domain.SeedWork;

public class Error
{
    public string Code { get; private set; }

    public string Message { get; private set; }

    public Error(string code, string message)
    {
        Code = code;
        Message = message;
    }

    public static Error None()
    {
        return new Error("", ""); 
    }

    public override string ToString()
    {
        var sb = new StringBuilder();
        sb.Append("class Error {\n");
        sb.Append("  Code: ").Append(Code).Append("\n");
        sb.Append("  Message: ").Append(Message).Append("\n");
        sb.Append("}\n");
        return sb.ToString();
    }
}