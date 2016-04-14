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

    let(:invalid_field_args) do
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
            indexed: 'Wow! What am I doing here?',
            mandatory: true,
            multiple: false,
            searchable: true,
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

    describe 'field singleton methods' do
      let(:field_arg) {
        {
          data_type: 'integer',
          facetable: true,
          indexed: true,
          mandatory: true,
          multiple: false,
          searchable: false,
          stored: true
        }
      }
      let(:expected) { Field.new(field_arg) }
      subject { Vocabulary.new(valid_args).date }
      it { should == expected }
    end

    describe '#valid?' do
      context 'with valid fields' do
        subject { Vocabulary.new(valid_args) }
        it { should be_valid }
      end
      context 'with an invalid field' do
        subject { Vocabulary.new(invalid_field_args) }
        it { should_not be_valid }
      end
    end
  end
end
