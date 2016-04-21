module TVF
  class Terms
    attr_reader :vocabs
    private :vocabs

    def initialize(args)
      @vocabs = init_vocabularies(args)
      add_vocabulary_methods
    end

    def vocabularies
      vocabs.keys
    end

    def all
      vocabs.values.inject([]) { |a, e| a.push(*e.all) }
    end

    def multiple
      vocabs.values.inject([]) { |a, e| a.push(*e.multiple) }
    end

    def single
      vocabs.values.inject([]) { |a, e| a.push(*e.single) }
    end

    def facetable
      vocabs.values.inject([]) { |a, e| a.push(*e.facetable) }
    end

    private

    def init_vocabularies(arg)
      hash = {}
      arg.each_pair do |k, v|
        hash[k] = Vocabulary.new(v)
      end
      hash
    end

    def add_vocabulary_methods
      vocabs.each_key do |k|
        define_singleton_method(k) do
          vocabs[k]
        end
      end
    end
  end
end
