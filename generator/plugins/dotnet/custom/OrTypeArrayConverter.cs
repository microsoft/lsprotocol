using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using System;


public class OrTypeArrayConverter<T, U, V, W> : JsonConverter<OrType<T, U, V, W>[]>
{
    private OrTypeConverter<T, U, V, W> _converter;

    public OrTypeArrayConverter()
    {
        _converter = new OrTypeConverter<T, U, V, W>();
    }

    public override OrType<T, U, V, W>[] ReadJson(JsonReader reader, Type objectType, OrType<T, U, V, W>[]? existingValue, bool hasExistingValue, JsonSerializer serializer)
    {
        if (reader.TokenType == JsonToken.Null)
        {
            return null;
        }

        JArray array = JArray.Load(reader);
        var result = new OrType<T, U, V, W>[array.Count];

        for (int i = 0; i < array.Count; i++)
        {
            result[i] = (OrType<T, U, V, W>)_converter.ReadJson(array[i].CreateReader(), typeof(OrType<T, U, V, W>), null, serializer);
        }

        return result;
    }

    public override void WriteJson(JsonWriter writer, OrType<T, U, V, W>[] value, JsonSerializer serializer)
    {
        if (value is null)
        {
            writer.WriteNull();
        }
        else
        {
            writer.WriteStartArray();

            foreach (var item in value)
            {
                _converter.WriteJson(writer, item, serializer);
            }

            writer.WriteEndArray();
        }
    }
}
public class OrTypeArrayConverter<T, U> : JsonConverter<OrType<T, U>[]>
{
    private OrTypeConverter<T, U> _converter;

    public OrTypeArrayConverter()
    {
        _converter = new OrTypeConverter<T, U>();
    }

    public override OrType<T, U>[] ReadJson(JsonReader reader, Type objectType, OrType<T, U>[]? existingValue, bool hasExistingValue, JsonSerializer serializer)
    {
        if (reader.TokenType == JsonToken.Null)
        {
            return null;
        }

        JArray array = JArray.Load(reader);
        var result = new OrType<T, U>[array.Count];

        for (int i = 0; i < array.Count; i++)
        {
            result[i] = (OrType<T, U>)_converter.ReadJson(array[i].CreateReader(), typeof(OrType<T, U>), null, serializer);
        }

        return result;
    }

    public override void WriteJson(JsonWriter writer, OrType<T, U>[] value, JsonSerializer serializer)
    {
        if (value is null)
        {
            writer.WriteNull();
        }
        else
        {
            writer.WriteStartArray();

            foreach (var item in value)
            {
                _converter.WriteJson(writer, item, serializer);
            }

            writer.WriteEndArray();
        }
    }
}
public class OrTypeArrayConverter<T, U, V> : JsonConverter<OrType<T, U, V>[]>
{
    private OrTypeConverter<T, U, V> _converter;

    public OrTypeArrayConverter()
    {
        _converter = new OrTypeConverter<T, U, V>();
    }

    public override OrType<T, U, V>[] ReadJson(JsonReader reader, Type objectType, OrType<T, U, V>[]? existingValue, bool hasExistingValue, JsonSerializer serializer)
    {
        if (reader.TokenType == JsonToken.Null)
        {
            return null;
        }

        JArray array = JArray.Load(reader);
        var result = new OrType<T, U, V>[array.Count];

        for (int i = 0; i < array.Count; i++)
        {
            result[i] = (OrType<T, U, V>)_converter.ReadJson(array[i].CreateReader(), typeof(OrType<T, U, V>), null, serializer);
        }

        return result;
    }

    public override void WriteJson(JsonWriter writer, OrType<T, U, V>[] value, JsonSerializer serializer)
    {
        if (value is null)
        {
            writer.WriteNull();
        }
        else
        {
            writer.WriteStartArray();

            foreach (var item in value)
            {
                _converter.WriteJson(writer, item, serializer);
            }

            writer.WriteEndArray();
        }
    }
}