module TVF
  # class stores vocabulary information and associated fields
  # lib/nyu/vocabulary.rb
  # interface:
  #   #namespace  - returns vocabulary's namespace
  #   #uri        - returns vocabulary's URI
  #   #terms      - returns vocabulary's terms
  #
  class Vocabulary # forgot that Ichabod::Vocabulary is already defined...
    # so we may want to name this class something else
    # using NYU parent module to avoid namespace clash

    attr_reader :namespace, :uri, :fields
    def initialize(v)
      @namespace = v[:info][:namespace]
      @uri = v[:info][:uri]
      @fields = init_fields(v[:fields])
    end

    private

    def init_fields(arg)
      hash = {}
      arg.each_pair do |k, v|
        hash[k] = Field.new(v)
      end
      hash
    end
  end
end