class Contact < ApplicationRecord
  validates :first_name,
    presence: true,
    length: { maximum: 30 }
  validates :last_name,
    presence: true,
    length: { maximum: 30 }
  validates :email,
    presence: true,
    format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "L'email n'est pas au bon format" }
  validates :email_content,
    presence: true,
    length: { minimum: 50, maximum: 10000 }
    
end
