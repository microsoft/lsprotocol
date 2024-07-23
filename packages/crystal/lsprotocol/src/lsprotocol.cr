require "json"

require "./lsprotocol/enum"
require "./lsprotocol/types"
require "./lsprotocol/util"

module LSProtocol
  VERSION = "0.1.0"

  def self.parse_message(data : String, method : String? = nil)
    json = JSON.parse(data)
    json_h = json.as_h

    if method.nil?
      method = json_h["method"]?.try(&.as_s) || nil
    end

    if json_h["result"]?
      raise "method cannot be nil" if method.nil?

      obj_type = LSProtocol::METHOD_TO_TYPES[method][1]
    elsif json_h["error"]?
      obj_type = LSProtocol::ResponseErrorMessage
    else
      raise "method cannot be nil" if method.nil?

      obj_type = LSProtocol::METHOD_TO_TYPES[method][0]
    end

    puts "Parsing message as #{obj_type}"

    obj_type.from_json(data)
  end
end

puts LSProtocol::InitializeRequest.new(
  id: "0",
  params: LSProtocol::InitializeParams.new(
    capabilities: LSProtocol::ClientCapabilities.new(
      workspace: LSProtocol::WorkspaceClientCapabilities.new(
        inlay_hint: LSProtocol::InlayHintWorkspaceClientCapabilities.new
      )
    ),
    process_id: 1,
    root_uri: "/",
  )
).to_json
