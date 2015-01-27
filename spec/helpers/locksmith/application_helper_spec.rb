require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the ApplicationHelper. For example:
#
# describe ApplicationHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
# noinspection RubyResolve
module Locksmith
  describe ApplicationHelper do
    describe '#errors_for' do
      before do
        @user = User.new(name: 'Some Name')
        @user.valid?
      end

      it "shouldn't render anything when there are no errors" do
        expect(helper.errors_for(@user, :name)).to be nil
      end

      it 'should render multiple errors' do
        expect(helper.errors_for(@user, :email)).to include 'Email can&#39;t be blank'
        expect(helper.errors_for(@user, :email)).to include 'Email must be valid'
      end

      it 'should render a <ul class="errors"> with errors in <li>' do
        expect(helper.errors_for(@user, :password))
            .to be == '<ul class="errors"><li>Password can&#39;t be blank</li></ul>'
      end
    end
  end
end
