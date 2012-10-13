class DataItemValue < ActiveRecord::Base
  attr_accessible :current_value, :data_item_id, :statistics_entry_id

  belongs_to :data_item
  belongs_to :statistics_entry
end
