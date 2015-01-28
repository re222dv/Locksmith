require 'rails_helper'

module Locksmith
  describe Application do

    it { should belong_to :user }

    it { should validate_presence_of :user }
    it { should validate_presence_of :name }
    it { should validate_presence_of :key }
    it { should validate_uniqueness_of :key }

    it 'should generate a random key when created' do
      stingray = Application.create name: 'Stingray'
      barracuda = Application.create name: 'Barracuda'

      expect(stingray.key.length).to be > 32
      expect(barracuda.key.length).to be > 32

      expect(stingray.key).not_to be == barracuda.key
    end
  end
end
