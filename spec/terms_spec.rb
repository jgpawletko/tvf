require 'spec_helper'
require 'yaml'

module TVF
  describe Terms do
    let(:valid_args) { Utils.symbolize_keys(YAML.load_file('spec/fixtures/metadata_fields.yml'))[:terms][:vocabulary] }
    let(:invalid_args) do
      x = Utils.symbolize_keys(YAML.load_file('spec/fixtures/metadata_fields.yml'))[:terms][:vocabulary]
      x[:dcterms][:info][:uri] = nil
      x
    end

    describe '#vocabularies' do
      subject { Terms.new(valid_args).vocabularies }
      it { should == [:dcterms, :ichabod, :nyucore] }
    end

    describe 'selectors' do
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
      describe '#facetable' do
        subject { Terms.new(valid_args).facetable }
        it do
          should == [:contributor, :creator, :format, :language, :subject]
        end
      end
    end

    describe 'vocabulary singleton methods' do
      let(:expected) { valid_args[:dcterms][:info][:uri] }
      subject { Terms.new(valid_args).dcterms.uri }
      it { should == expected }
    end

    describe '#valid?' do
      context 'with valid args' do
        subject { Terms.new(valid_args) }
        it { should be_valid }
      end
      context 'with invalid args' do
        subject { Terms.new(invalid_args) }
        it { should_not be_valid }
      end
    end
  end
end
