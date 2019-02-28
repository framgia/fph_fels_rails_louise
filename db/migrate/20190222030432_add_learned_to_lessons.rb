class AddLearnedToLessons < ActiveRecord::Migration[5.2]
  def change
    add_column :lessons, :learned, :boolean, default: false
  end
end
