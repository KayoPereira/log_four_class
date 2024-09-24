class AddValidateTodayLessonToUser < ActiveRecord::Migration[7.2]
  def change
    add_column :users, :validate_today_lesson, :datetime
  end
end
