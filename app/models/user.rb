class User < ApplicationRecord
  belongs_to :city
  has_many :gossips
  has_many :comments
  has_many :sent_messages, foreign_key: 'sender_id', class_name: "PrivateMessage"
  has_many :received_messages, foreign_key: 'recipient_id', class_name: "PrivateMessage"

  validates :email, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :age, presence: true
  has_secure_password
end
