module Locksmith
  require 'email_validator/strict'

  class User < ActiveRecord::Base
    has_secure_password
    has_many :applications

    validates :name,
              presence: true,
              uniqueness: { case_sensitive: false }

    validates :email,
              presence: true,
              email: true,
              confirmation: true,
              uniqueness: { case_sensitive: false }

    before_save { self.email.downcase! }
  end
end
