class AddStatisticsEntryIdToDataItemValue < ActiveRecord::Migration
  def change
    add_column :data_item_values, :statistics_entry_id, :integer
  end
end
