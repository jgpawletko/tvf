require 'spec_helper'
module TVF
  describe Vocabulary do
    let(:valid_args) do
      { info:
        { namespace: "RDF::DC",
          uri: "http://purl.org/dc/terms/"
        },
        # Mandatory Fields
        fields: {
          title: {
            data_type: 'text',
            facetable: false,
            indexed: true,
            mandatory: true,
            multiple: true,
            searchable: true,
            stored: true
          },
          identifier: {
            data_type: 'text',
            facetable: false,
            indexed: true,
            mandatory: true,
            multiple: false,
            searchable: true,
            stored: true
          },

          # Optional Fields
          contributor: {
            data_type: 'text',
            facetable: true,
            indexed: true,
            mandatory: false,
            multiple: true,
            searchable: true,
            stored: true,
          },
          creator: {
            data_type: 'text',
            facetable: true,
            indexed: true,
            mandatory: false,
            multiple: true,
            searchable: true,
            stored: true
          },
          date: {
            data_type: 'integer',
            facetable: true,
            indexed: true,
            mandatory: true,
            multiple: false,
            searchable: false,
            stored: true
          }
        }
      }
    end

    describe '#namespace' do
      subject { Vocabulary.new(valid_args).namespace }
      it { should == 'RDF::DC' }
    end
  end
end

#     describe '#valid' do
#       context 'with valid arguments' do
#         subject { Field.new(valid_args) }
#         it { should be_valid }
#       end

#       context 'with invalid arguments' do
#         subject { Field.new(invalid_args) }
#         it { should_not be_valid }
#       end
#     end
#   end
# end
