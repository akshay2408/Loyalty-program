ActiveAdmin.register Invoice do
  permit_params :user_id, :amount, :foreign
end  