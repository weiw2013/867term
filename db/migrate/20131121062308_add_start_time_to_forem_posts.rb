class AddStartTimeToForemPosts < ActiveRecord::Migration
  def change
    add_column :forem_posts, :start_time, :datetime
  end
end
