require 'spec_helper'

describe Character do
  it { should validate_presence_of(:order) }
  it { should allow_value(1).for(:order) }
  it { should_not allow_value(0.5).for(:order) }
  it { should_not allow_value("foo").for(:order) }

  it { should belong_to(:game) }
  it { should have_one(:current_player_of) }
  it { should have_many(:cards) }
  it { should have_many(:card_instances) }
  it { should have_many(:tiles) }
  it { should have_many(:tile_instances) }

  it { should respond_to(:set_defaults) }
  it { should respond_to(:check_damage) }
  it { should respond_to(:next_player) }
  it { should respond_to(:previous_player) }
  it { should respond_to(:gear_limits) }
  it { should respond_to(:draw!) }
  it { should respond_to(:fight) }
  it { should respond_to(:regain_stamina) }
  it { should respond_to(:equip!) }
  it { should respond_to(:unequip!) }
  it { should respond_to(:take!) }
  it { should respond_to(:drop!) }
  it { should respond_to(:attack) }
  it { should respond_to(:defense) }
  it { should respond_to(:dexterity) }
  it { should respond_to(:willpower) }
  it { should respond_to(:intelligence) }

  context "when naked" do
    before :each do
      @char = FactoryGirl.create(:character)
    end
    subject { @char }
    its(:defense) { should eq 1 }
    its(:attack) { should eq 1 }
    its(:dexterity) { should eq 3 }
    its(:willpower) { should eq 3 }
    its(:intelligence) { should eq 3 }

  end

  context "with basic gear" do
    it "should have tests"
  end

end
