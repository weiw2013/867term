class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.string :title
      t.text :description
      t.integer :reward
      t.integer :popularity

      t.timestamps
    end
  end
end
