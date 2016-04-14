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

    let(:different_args) do
      { data_type: 'text',
        facetable: true,
        indexed: true,
        mandatory: true,
        multiple: false,
        searchable: false,
        stored: true }
    end

    describe '#valid' do
      context 'with valid arguments' do
        subject { Field.new(valid_args) }
        it { should be_valid }
      end

      context 'with invalid arguments' do
        subject { Field.new(invalid_args) }
        it { should_not be_valid }
      end
    end

    describe '#==' do
      context 'with equivalent object' do
        let(:other) { Field.new(valid_args) }
        subject { Field.new(valid_args) }
        it { should == other }
      end
      context 'with different object' do
        let(:other) { Field.new(different_args) }
        subject { Field.new(valid_args) }
        it { should_not == other }
      end
    end
  end
end
