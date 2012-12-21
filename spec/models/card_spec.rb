require 'spec_helper'

describe Card do
  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name) }
  

  its(:level_one) { should be_defined }
end
