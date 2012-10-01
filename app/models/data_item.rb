class DataItem < ActiveRecord::Base
  attr_accessible :data_item_type_id, :statistics_source_id

  belongs_to :data_item_type
  belongs_to :statistics_source

  has_many :data_item_values
end
