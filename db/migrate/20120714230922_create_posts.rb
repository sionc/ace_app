class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :comment
      t.string :owner

      t.timestamps
    end
  end
end
