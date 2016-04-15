module TVF
  # class stores vocabulary information and associated fields
  class Vocabulary
    attr_reader :namespace, :uri, :fields
    def initialize(v)
      @namespace = v[:info][:namespace]
      @uri = v[:info][:uri]
      @fields = init_fields(v[:fields])
      add_field_methods
    end

    def valid?
      result = true
      result &&= fields_valid?
      result &&= namespace_valid?
      result && uri_valid?
    end

    def all
      fields.keys
    end

    def multiple
      fields.keys.select { |k| fields[k].multiple }
    end

    private

    def init_fields(arg)
      hash = {}
      arg.each_pair do |k, v|
        hash[k] = Field.new(v)
      end
      hash
    end

    def add_field_methods
      fields.each_key do |k|
        define_singleton_method(k) do
          fields[k]
        end
      end
    end

    def fields_valid?
      fields.values.inject(true) { |a, e| a && e.valid? }
    end

    def namespace_valid?
      !namespace.nil?
    end

    def uri_valid?
      !uri.nil?
    end
  end
end
