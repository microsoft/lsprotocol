public interface IRequest<TParams> : IMessage
{

    OrType<int, string> Id { get; }

    string Method { get; }

    TParams Params { get; }
}