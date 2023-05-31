public interface ILSPREsponse<TResponse> : ILSPMessage
{

    OrType<int, string> Id { get; }

    TResponse Result { get; }

    ILSPResponseError? Error { get; }
}