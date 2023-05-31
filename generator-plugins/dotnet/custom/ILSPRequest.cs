public interface ILSPRequest<TParams> : ILSPMessage
{

    OrType<int, string> Id { get; }

    string Method { get; }

    TParams Params { get; }
}