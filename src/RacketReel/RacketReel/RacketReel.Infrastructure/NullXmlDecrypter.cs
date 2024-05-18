using Microsoft.AspNetCore.DataProtection.XmlEncryption;
using System.Xml.Linq;

namespace RacketReel.Infrastructure;

public class NullXmlDecryptor : IXmlDecryptor
{
    public XElement Decrypt(XElement encryptedElement)
    {
        return encryptedElement;
    }
}
