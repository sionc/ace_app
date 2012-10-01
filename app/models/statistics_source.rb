class StatisticsSource < ActiveRecord::Base
  attr_accessible :process_manager_id, :source_path, :statistics_source_type_id

  belongs_to :process_manager
  belongs_to :statistics_source_type

  has_many :data_items
end
