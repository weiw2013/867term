class CreateCourseAttachments < ActiveRecord::Migration
  def change
    create_table :course_attachments do |t|
      t.string :title
      t.string :format
      t.string :path

      t.timestamps
    end
  end
end
