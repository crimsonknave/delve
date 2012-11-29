class Item < ActiveRecord::Base
  attr_accessible :attack, :defense, :details, :name, :type
end
