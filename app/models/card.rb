class Card < ActiveRecord::Base
  attr_accessible :attack, :check_difficulty, :defense, :details, :dexterity, :intelligence, :kind, :level, :name, :order, :type, :wisdom

  scope :level_one, where(:level => 1)
  scope :level_two, where(:level => 2)
  scope :level_three, where(:level => 3)

  scope :item, where(:kind => "Item")
  scope :trait, where(:kind => "Trait")

  scope :stat_card, where(:kind => ["Item", "Trait"])

  scope :encounter, where(:kind => "Encounter")
  scope :event, where(:kind => "Event")

  has_many :card_instances
  has_many :characters, :through => :card_instances


  validates :name, :presence => true, :uniqueness => true

  def instance(game_id)
    card_instances.where(:game_id => game_id).first
  end

end
