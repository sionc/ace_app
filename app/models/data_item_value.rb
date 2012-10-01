class DataItemValue < ActiveRecord::Base
  attr_accessible :current_value, :data_item_id

  belongs_to :data_item
end
