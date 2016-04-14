module TVF
  class Field

    VALID_DATA_TYPES = %w(text integer).freeze
    DATA_TYPE_ATTRIBUTES = [:data_type].freeze
    BOOLEAN_ATTRIBUTES = [:facetable, :indexed, :mandatory, :multiple,
                          :searchable, :stored].freeze
    ALL_ATTRIBUTES = DATA_TYPE_ATTRIBUTES + BOOLEAN_ATTRIBUTES

    attr_reader *ALL_ATTRIBUTES

    def initialize(args)
      ALL_ATTRIBUTES.each { |k| instance_variable_set("@#{k}", args[k]) }
    end

    def valid?
      result = true
      DATA_TYPE_ATTRIBUTES.each { |k| result &&= VALID_DATA_TYPES.include? self.send(k) }
      BOOLEAN_ATTRIBUTES.each { |k| result &&= [true, false].include? self.send(k) }
      result
    end
  end
end
