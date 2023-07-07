public interface IResponse<TResponse> : IMessage
{

    OrType<int, string> Id { get; }

    TResponse Result { get; }

    IResponseError? Error { get; }
}