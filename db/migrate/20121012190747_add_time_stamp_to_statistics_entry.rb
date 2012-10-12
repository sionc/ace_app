class AddTimeStampToStatisticsEntry < ActiveRecord::Migration
  def change
    add_column :statistics_entries, :timestamp, :datetime
  end
end
