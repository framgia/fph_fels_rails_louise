class AddScoreToLessons < ActiveRecord::Migration[5.2]
  def change
    add_column :lessons, :score, :integer
  end
end
