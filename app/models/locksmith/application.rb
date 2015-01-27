module Locksmith
  class Application < ActiveRecord::Base
    belongs_to :user

    validates_presence_of :user
    validates_presence_of :name
    validates :key, presence: true, uniqueness: true

    after_initialize do
      loop do
        # Generate a secure random key if missing and make sure that it's unique
        self.key = SecureRandom.base64 25 if self.key.nil?
        break if Application.where(key: self.key).empty?
      end
    end
  end
end
