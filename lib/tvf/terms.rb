module TVF
  class Terms
    attr_reader :vocabs
    private :vocabs

    def initialize(args)
      @vocabs = init_vocabularies(args)
    end

    def vocabularies
      vocabs.keys
    end

    private

    def init_vocabularies(arg)
      hash = {}
      arg.each_pair do |k, v|
        hash[k] = Vocabulary.new(v)
      end
      hash
    end
  end
end
