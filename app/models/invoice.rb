class Invoice < ApplicationRecord
  STATUS_DRAFT = 'draft'
  STATUS_PAID  = 'paid'

  belongs_to :user

  validates :status, :inclusion => { :in => [STATUS_PAID, STATUS_DRAFT], :message => "You need to pick one status." }
  attr_accessor :user_id, :status, :due_date
  
  class << self
    def suggest_code
      invoice = order('created_at desc').limit(1).first
      if invoice
        "INV-#{invoice.id + 1}"
      else
        "INV-1"
      end
    end 
  end
end
