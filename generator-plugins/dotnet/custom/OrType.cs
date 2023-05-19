using System;

public class OrType<T, U> : IOrType
{
    public OrType(T t)
    {
        Value = t ?? throw new ArgumentNullException(nameof(t));
    }

    public OrType(U u)
    {
        Value = u ?? throw new ArgumentNullException(nameof(u));
    }

    public static explicit operator U?(OrType<T, U> obj)
    {
        return obj.Value is U x ? x : default;
    }

    public static explicit operator T?(OrType<T, U> obj)
    {
        return obj.Value is T x ? x : default;
    }

    public static explicit operator OrType<T, U>(U obj) => obj is null ? null : new OrType<T, U>(obj);
    public static explicit operator OrType<T, U>(T obj) => obj is null ? null : new OrType<T, U>(obj);

    public override string ToString()
    {
        return Value?.ToString();
    }
}

public class OrType<T, U, V> : IOrType
{
    public OrType(T t)
    {
        Value = t ?? throw new ArgumentNullException(nameof(t));
    }

    public OrType(U u)
    {
        Value = u ?? throw new ArgumentNullException(nameof(u));
    }

    public OrType(V v)
    {
        Value = v ?? throw new ArgumentNullException(nameof(v));
    }

    public static explicit operator T?(OrType<T, U, V> obj) => obj.Value as T;
    public static explicit operator U?(OrType<T, U, V> obj) => obj.Value as U;
    public static explicit operator V?(OrType<T, U, V> obj) => obj.Value as V;

    public override string ToString()
    {
        return Value?.ToString();
    }

    public object Value { get; }
}