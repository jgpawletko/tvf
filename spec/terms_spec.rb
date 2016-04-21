require 'spec_helper'
require 'yaml'

module TVF
  describe Terms do
    let(:valid_args) { Utils.symbolize_keys(YAML.load_file('spec/fixtures/metadata_fields.yml'))[:terms][:vocabulary] }

    describe '#vocabularies' do
      subject { Terms.new(valid_args).vocabularies }
      it { should == [:dcterms, :ichabod, :nyucore] }
    end
  end
end
