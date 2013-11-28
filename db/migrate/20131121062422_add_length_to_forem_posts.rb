class AddLengthToForemPosts < ActiveRecord::Migration
  def change
    add_column :forem_posts, :length, :integer
  end
end
