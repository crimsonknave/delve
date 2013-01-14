FactoryGirl.define do
  factory :card do
    sequence :name do |n|
      "card #{n}"
    end
  end

  factory :card_instance do
    card
  end

  factory :game do
    after :create do |game, opts|
    end
  end
end
