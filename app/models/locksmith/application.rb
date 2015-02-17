module Locksmith
  class Application < ActiveRecord::Base
    belongs_to :user

    validates_presence_of :user
    validates_presence_of :name
    validates :key, presence: true, uniqueness: true

    after_initialize do
      regenerate_key if self.key.nil?
    end

    def regenerate_key
      self.key = SecureRandom.hex
    end
  end
end
