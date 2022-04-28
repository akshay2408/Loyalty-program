ActiveAdmin.register Invoice do
  permit_params :list, :of, :attributes, :on, :model, :amount, :invoice_name,:status

  scope :all, :default => true
  scope :draft do |invoices|
    invoices.where(:status => Invoice::STATUS_DRAFT)
  end

  scope :paid do |invoices|
    invoices.where(:status => Invoice::STATUS_PAID)
  end
  
  index do
    column :status do |invoice|
      status_tag invoice.status, invoice.status_tag
    end
    column :code do |invoice|
      link_to "##{invoice.code}", admin_invoice_path(invoice)
    end
    
    column :user_id
    column "Issued" do |invoice|
      due = if invoice.due_date
        " (due in #{distance_of_time_in_words Time.now, invoice.due_date})"
      else
        ""
      end

      "#{l invoice.created_at, :format => :short}" + due
    end
    column :total do |invoice|
      number_to_currency invoice.total
    end
    
    column do |invoice|
      link_to("Details", admin_invoice_path(invoice)) + " | " + \
      link_to("Edit", edit_admin_invoice_path(invoice)) + " | " + \
      link_to("Delete", admin_invoice_path(invoice), :method => :delete, :confirm => "Are you sure?")
    end
  end
end  