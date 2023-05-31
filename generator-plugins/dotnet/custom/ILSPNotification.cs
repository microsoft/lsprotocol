public interface ILSPNotification<TParams> : ILSPMessage
{
    string Method { get; }

    TParams? Params { get; }
}