class URI
  def self.from_json_object_key?(key : String) : URI?
    parse key
  rescue URI::Error
    nil
  end

  # :nodoc:
  def to_json_object_key : String
    to_s
  end
end
