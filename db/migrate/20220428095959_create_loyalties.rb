class CreateLoyalties < ActiveRecord::Migration[5.2]
  def change
    create_table :loyalties do |t|
      t.string :name
      t.string :scope

      t.timestamps
    end
  end
end
