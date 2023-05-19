using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using System;

public class DocumentUriConverter : JsonConverter<Uri>
{
    public override Uri? ReadJson(JsonReader reader, Type objectType, Uri? existingValue, bool hasExistingValue, JsonSerializer serializer)
    {
        if (reader.TokenType == JsonToken.String && reader.Value is string uriString)
        {
            return new Uri(uriString);
        }
        else if (reader.TokenType == JsonToken.Null)
        {
            return null;
        }

        throw new JsonSerializationException();
    }

    public override void WriteJson(JsonWriter writer, Uri? value, JsonSerializer serializer)
    {
        if (value is Uri uri)
        {
            writer.WriteValue(uri.AbsoluteUri);
        }
        else
        {
            throw new ArgumentException($"{nameof(value)} must be of type {nameof(Uri)}");
        }
    }
}
