require 'spec_helper'
module TVF
  describe Field do
    let(:valid_args) do
      { data_type: 'integer',
        facetable: true,
        indexed: true,
        mandatory: true,
        multiple: false,
        searchable: false,
        stored: true }
    end

    let(:invalid_args) do
      x = valid_args.clone
      x[:mandatory] = 'hahaha'
      x
    end

    describe '#valid' do
      context 'with valid arguments' do
        subject { Field.new(valid_args).valid? }
        it { should be true }
      end

      context 'with invalid arguments' do
        subject { Field.new(invalid_args).valid? }
        it { should_not be true }
      end
    end
  end
end
