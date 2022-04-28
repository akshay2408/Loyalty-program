class AddAdminUserIdToInvoice < ActiveRecord::Migration[5.2]
  def change
    add_column :invoices, :admin_user_id, :integer
  end
end
