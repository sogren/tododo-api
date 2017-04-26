class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :title, null: false
      t.string :content
      t.integer :status, default: 0, null: false
      t.references :user, null: false

      t.timestamps null: false
    end
    add_index :tasks, :status
  end
end
