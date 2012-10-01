class CreateStatisticsSources < ActiveRecord::Migration
  def change
    create_table :statistics_sources do |t|
      t.integer :process_manager_id
      t.integer :statistics_source_type_id
      t.string :source_path

      t.timestamps
    end
  end
end
