class CreateStatisticsEntries < ActiveRecord::Migration
  def change
    create_table :statistics_entries do |t|
      t.integer :process_manager_id

      t.timestamps
    end
  end
end
