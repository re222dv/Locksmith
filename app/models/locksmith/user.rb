module Locksmith
  require 'email_validator/strict'

  class User < ActiveRecord::Base
    has_secure_password
    has_many :applications

    validates_presence_of :name

    validates :email,
              presence: true,
              email: { message: 'must be valid' },
              uniqueness: { case_sensitive: false }

    before_save { self.email.downcase! }
  end
end
