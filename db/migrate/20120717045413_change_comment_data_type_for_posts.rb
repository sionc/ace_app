class ChangeCommentDataTypeForPosts < ActiveRecord::Migration
  def up
    change_column :posts, :comment, :text
  end

  def down
    change_column :posts, :comment, :string
  end
end
