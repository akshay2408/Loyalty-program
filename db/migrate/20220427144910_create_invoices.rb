class CreateInvoices < ActiveRecord::Migration[5.2]
  def change
    create_table :invoices do |t|
      t.references :user
      t.integer :amount
      t.boolean :foreign, default: false, null: false

      t.timestamps
    end
  end
end
