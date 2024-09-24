class CreateAttendances < ActiveRecord::Migration[7.2]
  def change
    create_table :attendances do |t|
      t.references :user, null: false, foreign_key: true
      t.references :lesson, null: false, foreign_key: true

      t.timestamps
    end
  end
end
