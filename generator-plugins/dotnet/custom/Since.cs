using System;

[AttributeUsage(AttributeTargets.Class | AttributeTargets.Property | AttributeTargets.Enum)]
public class SinceAttribute : Attribute
{
    public SinceAttribute()
    {
        Version = null;
    }

    public SinceAttribute(string version)
    {
        Version = version;
    }

    public string? Version { get; }
}