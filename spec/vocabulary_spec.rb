require 'spec_helper'
module TVF
  describe Vocabulary do
    let(:valid_args) do
      { info:
        { namespace: 'RDF::DC',
          uri: 'http://purl.org/dc/terms/'
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
            stored: true
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

    describe '#uri' do
      subject { Vocabulary.new(valid_args).uri }
      it { should == 'http://purl.org/dc/terms/' }
    end
  end
end
