class CreateLessons < ActiveRecord::Migration[7.2]
  def change
    create_table :lessons do |t|
      t.date :lesson_day
      t.string :discipline
      t.references :professor, null: false, foreign_key: { to_table: :users }
      
      t.timestamps
    end
  end
end
