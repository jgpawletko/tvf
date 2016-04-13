require 'spec_helper'
module TVF
  describe Terms do
    subject(:terms) { Terms.new }
    it { should be_an TVF::Terms }
  end
end
