require 'spec_helper'
require 'yaml'

module TVF
  describe Terms do
    let(:valid_args) { Utils.symbolize_keys(YAML.load_file('spec/fixtures/metadata_fields.yml'))[:terms][:vocabulary] }

    describe '#vocabularies' do
      subject { Terms.new(valid_args).vocabularies }
      it { should == [:dcterms, :ichabod, :nyucore] }
    end

    describe '#all' do
      subject { Terms.new(valid_args).all }
      it do
        should == [:title, :identifier, :contributor, :creator, :date,
                   :description, :format, :language, :publisher, :relation,
                   :rights, :subject, :type, :addinfolink, :addinfotext,
                   :data_provider, :discoverable, :geometry, :isbn,
                   :location, :repo, :resource_set, :subject_spatial,
                   :subject_temporal, :available, :citation, :edition,
                   :restrictions, :series, :version]
      end
    end

    describe '#multiple' do
      subject { Terms.new(valid_args).multiple }
      it do
        should == [:title, :contributor, :creator, :date,
                   :description, :format, :language, :publisher, :relation,
                   :rights, :subject, :type, :addinfolink, :addinfotext,
                   :data_provider, :discoverable, :geometry, :isbn,
                   :location, :subject_spatial, :subject_temporal, :available,
                   :citation, :edition, :series, :version]
      end
    end

    describe '#single' do
      subject { Terms.new(valid_args).single }
      it do
        should == [:identifier, :repo, :resource_set, :restrictions]
      end
    end
  end
end
