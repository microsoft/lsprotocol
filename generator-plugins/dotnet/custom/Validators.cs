
using System;

public static class Validators
{
    public static bool HasType(Type[] types, Type type)
    {
        return types.Contains(type);
    }

    public static bool InIntegerRange(long value)
    {
        return value >= int.MinValue && value <= int.MaxValue;
    }

    public static bool InUIntegerRange(long value)
    {
        return value >= uint.MinValue && value <= uint.MaxValue;
    }
}