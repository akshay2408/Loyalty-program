class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :invoices, :dependent => :destroy
  has_many :points, :dependent => :destroy
  belongs_to :admin_user
  #validates :phone_number, presence: true, numericality:{ message: ' 10 digits number' }
  attr_accessor :name, :birth_date, :phone_number, :email 
end
