class CreateActivities < ActiveRecord::Migration[5.2]
  def change
    create_table :activities do |t|
      t.references :user, foreign_key: true
      t.integer :action_id
      t.string :action_type
      t.timestamps
    end
      add_index :activities, [:action_type, :action_id]
  end
end
