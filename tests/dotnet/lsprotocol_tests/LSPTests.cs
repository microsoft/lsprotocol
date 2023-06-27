
namespace lsprotocol_tests;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;


public class LSPTests
{
    public static IEnumerable<object[]> JsonTestData()
    {
        string folderPath = "C:\\GIT\\LSP\\lsprotocol\\packages\\testdata";

        string[] jsonFiles = Directory.GetFiles(folderPath, "*.json");
        foreach (string filePath in jsonFiles)
        {
            yield return new object[] { filePath };
        }
    }

    [Theory]
    [MemberData(nameof(JsonTestData))]
    public void ValidateLSPTypes(string filePath)
    {
        string original = File.ReadAllText(filePath);

        // Get the class name from the file name
        // format: <class-name>-<valid>-<test-id>.json
        // classname => Class name of the type to deserialize to
        // valid => true if the file is valid, false if it is invalid
        // test-id => unique id for the test
        string fileName = Path.GetFileNameWithoutExtension(filePath);
        string[] nameParts = fileName.Split('-');
        string className = nameParts[0];
        bool valid = nameParts[1] == "True";

        Type type = Type.GetType($"Microsoft.LanguageServer.Protocol.{className}, lsprotocol") ?? throw new Exception($"Type {className} not found");
        RunTest(valid, original, type);
    }

    private static void RunTest(bool valid, string data, Type type)
    {
        if (valid)
        {
            object? deserializedObject = JsonConvert.DeserializeObject(data, type);
            string newJson = JsonConvert.SerializeObject(deserializedObject);

            JToken token1 = JToken.Parse(data);
            JToken token2 = JToken.Parse(newJson);
            Assert.True(JToken.DeepEquals(token1, token2));
        }
        else
        {
            Assert.Throws<Exception>(() => JsonConvert.DeserializeObject(data, type));
        }
    }
}