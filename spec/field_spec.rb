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

    let(:invalid_boolean_args) do
      x = valid_args.clone
      x[:mandatory] = 'hahaha'
      x
    end

    let(:invalid_data_type_args) do
      x = valid_args.clone
      x[:data_type] = 'hohoho'
      x
    end

    let(:valid_args_data_type_date) do
      { data_type: 'date',
        facetable: true,
        indexed: true,
        mandatory: true,
        multiple: false,
        searchable: false,
        stored: true }
    end

    let(:valid_args_data_type_text) do
      { data_type: 'text',
        facetable: true,
        indexed: true,
        mandatory: true,
        multiple: false,
        searchable: false,
        stored: true }
    end

    describe '#valid' do
      context 'with valid arguments, data_type integer' do
        subject { Field.new(valid_args) }
        it { should be_valid }
      end

      context 'with different valid arguments, data_type date' do
        subject { Field.new(valid_args_data_type_date) }
        it { should be_valid }
      end

      context 'with different valid arguments, data_type text' do
        subject { Field.new(valid_args_data_type_text) }
        it { should be_valid }
      end

      context 'with invalid boolean arguments' do
        subject { Field.new(invalid_boolean_args) }
        it { should_not be_valid }
      end

      context 'with invalid data_type arguments' do
        subject { Field.new(invalid_data_type_args) }
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
        let(:other) { Field.new(valid_args_data_type_date) }
        subject { Field.new(valid_args) }
        it { should_not == other }
      end
    end

    describe 'accessors' do
      let(:field) { Field.new(valid_args) }
      describe '#data_type' do
        subject { field.data_type }
        it { should == 'integer'}
      end
      describe '#facetable' do
        subject { field.facetable }
        it { should be true }
      end
      describe '#indexed' do
        subject { field.indexed }
        it { should be true }
      end
      describe '#mandatory' do
        subject { field.mandatory }
        it { should be true }
      end
      describe '#multiple' do
        subject { field.multiple }
        it { should be false }
      end
      describe '#searchable' do
        subject { field.searchable }
        it { should be false }
      end
      describe '#stored' do
        subject { field.stored }
        it { should be true }
      end
    end
  end
end
