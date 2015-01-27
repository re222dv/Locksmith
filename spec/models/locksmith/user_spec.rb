require 'rails_helper'

module Locksmith
  describe User do
    it { should have_secure_password }
    it { should have_many :applications }

    it { should validate_presence_of :name }

    it { should validate_presence_of :email }
    it { should validate_uniqueness_of :email }
    it { should allow_value('example@email.com').for :email }
    it { should allow_value('example+alias@email.com').for :email }
    it { should_not allow_value('example').for(:email), with_message: 'must be valid' }
    it { should_not allow_value('@email.com').for(:email), with_message: 'must be valid' }
    it { should_not allow_value('example@email').for(:email), with_message: 'must be valid' }

    it 'should downcase email before save' do
      peter = User.create name: 'Peter', email: 'Peter@example.com', password: 'password'
      peter.save
      expect(peter.email).to be == 'peter@example.com'
    end
  end
end
