require "json"

require "./lsprotocol/enum"
require "./lsprotocol/types"
require "./lsprotocol/util"

module LSProtocol
  VERSION = "0.1.0"

  def self.parse_message(data : String, method : String? = nil) : LSProtocol::Message
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

    obj_type.from_json(data).as(LSProtocol::Message)
  end
end
