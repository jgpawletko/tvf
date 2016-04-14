module TVF
  class Field

    VALID_DATA_TYPES = %w(text integer).freeze
    DATA_TYPE_ATTRIBUTES = [:data_type].freeze
    BOOLEAN_ATTRIBUTES = [:facetable, :indexed, :mandatory, :multiple,
                          :searchable, :stored].freeze
    ALL_ATTRIBUTES = DATA_TYPE_ATTRIBUTES + BOOLEAN_ATTRIBUTES

    attr_reader *ALL_ATTRIBUTES

    def initialize(args)
      ALL_ATTRIBUTES.each { |attr| instance_variable_set("@#{attr}", args[attr]) }
    end

    def valid?
      result = true
      DATA_TYPE_ATTRIBUTES.each { |attr| result &&= VALID_DATA_TYPES.include? self.send(attr) }
      BOOLEAN_ATTRIBUTES.each { |attr| result &&= [true, false].include? self.send(attr) }
      result
    end
  end
end
