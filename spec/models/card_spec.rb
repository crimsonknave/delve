require 'spec_helper'

describe Card do
  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name) }
  it { should have_many(:card_instances) }
  it { should have_many(:characters) }

  it { should respond_to(:instance) }
end
