require "json"
require "uri"
require "uri/json"

require "./lsprotocol/uri"
require "./lsprotocol/types"
require "./lsprotocol/util"

module LSProtocol
  VERSION = "0.1.0"

  class ParseError < Exception
  end

  def self.parse_message(data : String, method : String? = nil, *, as obj_type = nil) : LSProtocol::Message
    json = JSON.parse(data)
    json_h = json.as_h

    if method.nil?
      method = json_h["method"]?.try(&.as_s) || nil
    end

    if obj_type
      # already have type
    elsif json_h["result"]?.try(&.as_h?) || json_h["result"]?.try(&.as_a?)
      raise ParseError.new("Method cannot be nil (found result)") if method.nil?

      obj_type = LSProtocol::METHOD_TO_TYPES[method][1]
    elsif json_h["error"]?.try(&.as_h?)
      obj_type = LSProtocol::ResponseErrorMessage
    else
      raise ParseError.new("Method cannot be nil") if method.nil?

      obj_type = LSProtocol::METHOD_TO_TYPES[method][0]
    end

    obj_type.from_json(data).as(LSProtocol::Message)
  end
end
