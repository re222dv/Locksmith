require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the SessionHelper. For example:
#
# describe SessionHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
module Locksmith
  describe SessionHelper do
    fixtures :locksmith_users
    let (:user) { User.first }

    describe '#sign_in' do
      # Does this need testing? It's tested pretty much by testing the other methods in the class
    end

    describe '#sign_out?' do
      it 'should sign out the current user' do
        helper.sign_in user
        helper.sign_out

        expect(helper.current_user).to be nil
        expect(helper.signed_in?).to be false
      end
    end

    describe '#current_user' do
      it 'should return the current signed id user' do
        helper.sign_in user

        expect(helper.current_user).to be == user
      end

      it 'should return nil if no user is signed in' do
        expect(helper.current_user).to be nil
      end
    end

    describe '#signed_in?' do
      it 'should return true if a user is signed in' do
        helper.sign_in user

        expect(helper.signed_in?).to be true
      end

      it 'should return false if no user is signed in' do
        expect(helper.signed_in?).to be false
      end
    end
  end
end
