class CreateInvoices < ActiveRecord::Migration[5.2]
  def change
    create_table :invoices do |t|
      t.string :user_id
      t.integer :amount
      t.string :invoice_name

      t.timestamps
    end
  end
end
