require 'rails_helper'

module Locksmith
  describe User do
    it { should have_secure_password }
    it { should have_many :applications }

    it { should validate_presence_of :name }
    it { should validate_uniqueness_of :name }

    it { should validate_presence_of :email }
    it { should validate_confirmation_of :email }
    it { should validate_uniqueness_of :email }
    it { should allow_value('example@email.com').for :email }
    it { should_not allow_value('@email.com').for :email }
  end
end
