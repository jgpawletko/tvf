module TVF
  class Field

    #    ATTRIBUTES = [ :data_type, :facetable, :indexed, :mandatory, :multiple, :searchable, :stored ]
    #    attr_reader *ATTRIBUTES
    attr_reader :data_type, :facetable, :indexed, :mandatory, :multiple, :searchable, :stored

    def initialize(args)
      # stupid implementation for now.
      @data_type = args[:data_type]
      @facetable = args[:facetable]
      @indexed = args[:indexed]
      @mandatory = args[:mandatory]
      @multiple  = args[:multiple]
      @searchable = args[:searchable]
      @stored = args[:stored]
    end

    # this can be cleaned up
    # again, starting with naive implementation
    def valid?
      result = true
      result &&= %w(text integer).include? data_type
      [:facetable, :indexed, :mandatory, :multiple, :searchable, :stored].each do |k|
        result &&= ([true, false].include? self.send(k))
      end
      result
    end
  end
end
