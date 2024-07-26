require "./spec_helper"

describe LSProtocol do
  test_dir = Path.new(__DIR__, "..", "..", "..", "testdata").normalize
  test_files = Dir.glob(test_dir / "*.json")

  test_files.each do |test|
    lsp_type, result_type = Path.new(test).basename.split("-")[0..1]
    type = LSProtocol::STRING_TO_TYPES[lsp_type]

    it "testing serialization of #{test}" do
      begin
        object = LSProtocol.parse_message(File.read(test), as: type)
        object.class.to_s.should eq("LSProtocol::#{lsp_type}")

        raise "Expected error, but succeeded deserializing" if result_type == "False"
      rescue ex # : LSProtocol::ParseError | JSON::SerializableError
        raise "Expected success, but failed deserializing: #{ex}\n  #{ex.backtrace.join("\n  ")}" if result_type == "True"
      end
    end
  end
end
