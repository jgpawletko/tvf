require 'spec_helper'
module TVF
  describe Field do
    subject(:field) { Field.new }
    it { should be_an TVF::Field }
  end
end
