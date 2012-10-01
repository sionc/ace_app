class CreateProcessManagers < ActiveRecord::Migration
  def change
    create_table :process_managers do |t|
      t.string :workspace_path

      t.timestamps
    end
  end
end
