ActiveAdmin.register User do
  filter :name
  filter :email
  
  index do
    column :name
    column :email do |user|
      if user.email 
        mail_to user.email, user.email 
      else 
        "-"
      end
    end
    column :phone_number
    column do |user|
      link_to("Details", admin_user_path(user)) + " | " + \
      link_to("Delete", admin_user_path(user), :method => :delete, :confirm => "Are you sure?")
    end
  end
  
  show :title => :name do
    panel "user Details" do
      attributes_table_for user do
        row("Name") { user.name }
        row("Email") { mail_to user.email }
        row("Phone") { user.phone_number }
      end
    end
  end

  form do |f|
    f.inputs "user" do
      f.input :name
      f.input :email
      f.input :phone_number
    end
    f.button
  end

  sidebar "Total Billed", :only => :show do
    h1 number_to_currency(Invoice.where(:user_id => user.id).all.sum(&:total)), :style => "text-align: center; margin-top: 20px;"
  end
  
  sidebar "Latest Invoices", :only => :show do
    table_for Invoice.where(:user_id => user.id).order('created_at desc').limit(5).all do |t|
      t.column("Status") { |invoice| status_tag invoice.status, invoice.status_tag }
      t.column("Total") { |invoice| number_to_currency invoice.total }
    end
  end
  
end
