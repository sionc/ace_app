class CreateDataItemValues < ActiveRecord::Migration
  def change
    create_table :data_item_values do |t|
      t.integer :data_item_id
      t.float :current_value

      t.timestamps
    end
  end
end
