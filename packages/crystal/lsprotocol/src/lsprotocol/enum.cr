# :nodoc:
# https://github.com/elbywan/crystal-lsp/blob/main/src/ext/enum.cr
struct Enum
  # An JSON fiendly string enum.
  macro string(name, *, downcase = true, mappings = nil, &block)
    enum {{ name.id }}
      {{ block.body }}

      def self.parse(string : String) : self
        {% if mappings %}
        	{% for key, value in mappings %}
	          return self.new({{ key }}) if string == {{ value }}
          {% end %}
        {% end %}
        super
      end

      def self.new(pull : JSON::PullParser) : self
        self.from_json(pull)
      end

      def self.from_json(pull : JSON::PullParser) : self
        case pull.kind
        when .int?
          from_value(pull.read_int)
        when .string?
          parse(pull.read_string)
        else
          {% if @type.annotation(Flags) %}
            raise "Expecting int, string or array in JSON for #{self.class}, not #{pull.kind}"
          {% else %}
            raise "Expecting int or string in JSON for #{self.class}, not #{pull.kind}"
          {% end %}
        end
      end

      def to_json(builder : JSON::Builder)
        builder.string self.to_s{% if downcase %}.downcase{% end %}
      end

	    def to_s(io : IO) : Nil
      	io << self.to_s
    	end

      def to_s : String
        {% if mappings %}
          {% for key, value in mappings %}
      			return {{ value }} if self == {{ key }}
          {% end %}
        {% end %}
      	super{% if downcase %}.downcase{% end %}
      end
    end
  end

  # An enum that can be serialized to and from JSON based on its intrinsic value (i.e. a number).
  # :nodoc:
  macro number(name, *, mappings = nil, &block)
    enum {{ name.id }}
      {{ block.body }}

      def self.new(pull : JSON::PullParser) : self
        self.from_json(pull)
      end

      def self.from_json(pull : JSON::PullParser) : self
        self.from_value?(pull.read_int) || pull.raise "Unknown enum #{self} value: #{pull.int_value}"
      end

      def to_json(json : JSON::Builder)
        json.number(value)
      end
    end
  end
end
