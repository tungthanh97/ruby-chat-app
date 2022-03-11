class User < ApplicationRecord
  validates :name, presence: true,
    length: { within: 3..25}
  validates_uniqueness_of :name
  validates :email, presence: true, uniqueness: { case_sensitive: false },
    length: { within: 6..50},
                    format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, presence: true,
                       confirmation: true,
                       length: { within: 6..40 }
  has_secure_password
end
