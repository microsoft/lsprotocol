public interface ILSPResponseError
{

    int Code { get; }

    string Message { get; }

    LSPObject? Data { get; }
}