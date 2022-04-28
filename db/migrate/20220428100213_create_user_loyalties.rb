class CreateUserLoyalties < ActiveRecord::Migration[5.2]
  def change
    create_table :user_loyalties do |t|
      t.references :user
      t.references :loyalty

      t.timestamps
    end
  end
end
