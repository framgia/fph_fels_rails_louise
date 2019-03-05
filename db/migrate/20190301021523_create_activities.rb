class CreateActivities < ActiveRecord::Migration[5.2]
  def change
    create_table :activities do |t|
      t.references :action, polymorphic: true, index: true
      t.integer :user_id

      t.timestamps
    end
  end
end
