class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :title
      t.string :description
      t.datetime :start_time
      t.integer :length
      t.integer :price
      t.string :attachment_path
      t.integer :user_id

      t.timestamps
    end
  end
end
