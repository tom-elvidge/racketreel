using Microsoft.AspNetCore.DataProtection.XmlEncryption;
using System.Xml.Linq;

namespace RacketReel.Infrastructure;

public class NullXmlEncryptor : IXmlEncryptor
{
    public EncryptedXmlInfo Encrypt(XElement plaintextElement)
    {
        return new EncryptedXmlInfo(plaintextElement, typeof(NullXmlDecryptor));
    }
}
