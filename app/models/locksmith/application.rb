module Locksmith
  class Application < ActiveRecord::Base
    belongs_to :user

    validates_presence_of :user
    validates_presence_of :name
    validates_presence_of :key
  end
end
