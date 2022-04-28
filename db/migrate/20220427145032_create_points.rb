class CreatePoints < ActiveRecord::Migration[5.2]
  def change
    create_table :points do |t|
      t.string :user_id
      t.integer :score

      t.timestamps
    end
  end
end
