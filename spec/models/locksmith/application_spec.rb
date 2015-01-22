require 'rails_helper'

module Locksmith
  describe Application do
    it { should belong_to :user }

    it { should validate_presence_of :user }
    it { should validate_presence_of :name }
    it { should validate_presence_of :key }
  end
end
