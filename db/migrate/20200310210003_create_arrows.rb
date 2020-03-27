class CreateArrows < ActiveRecord::Migration[6.0]
  def change
    create_table :arrows do |t|
      t.string :reason
      t.integer :user_id
      t.integer :from_user_id

      t.timestamps
    end
  end
end
