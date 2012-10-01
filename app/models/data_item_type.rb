class DataItemType < ActiveRecord::Base
  attr_accessible :default_value, :name, :unit

  has_many :data_items
end
