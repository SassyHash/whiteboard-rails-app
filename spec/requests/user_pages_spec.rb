require 'spec_helper'

describe "UserPages" do
  subject {page}

  describe "sign up page" do
    let(:user) {FactoryGirl.create(:user)}
    before {visit signup_path}
    it {should have_content('Sign-In')}
  end

  describe 'sign in page' do
    let(:user) {FactoryGirl.create(:user)}
    before {visit user_path(user)}
    it {should have_selector('h1', text: user.screenname)}
  end

end
