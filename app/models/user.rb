class User < ApplicationRecord
  has_secure_password

  validates_presence_of :name
  validates_uniqueness_of :name

  has_many :proposals, dependent: :destroy
end