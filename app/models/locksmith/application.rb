module Locksmith
  class Application < ActiveRecord::Base
    belongs_to :user

    validates_presence_of :user
    validates_presence_of :name
    validates_presence_of :key

    after_initialize do
      self.key = SecureRandom.base64 25 if self.key.nil?
    end
  end
end
