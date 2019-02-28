class RemoveLearnedFromLesson < ActiveRecord::Migration[5.2]
  def change
    remove_column :lessons, :learned, :boolean
  end
end
