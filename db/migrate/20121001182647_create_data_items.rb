class CreateDataItems < ActiveRecord::Migration
  def change
    create_table :data_items do |t|
      t.integer :data_item_type_id
      t.integer :statistics_source_id

      t.timestamps
    end
  end
end
