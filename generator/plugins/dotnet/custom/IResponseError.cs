public interface IResponseError
{

    int Code { get; }

    string Message { get; }

    LSPObject? Data { get; }
}