class StatisticsEntry < ActiveRecord::Base
  attr_accessible :process_manager_id, :timestamp

  belongs_to :process_manager
  has_many :data_item_values
end
