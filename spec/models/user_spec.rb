require 'spec_helper'

describe User do

  subject(:user) { User.create(screenname: "ExampleUser", email: "user@example.com", 
                     password: "foobar") }

  it { should respond_to(:screenname) }
  it { should respond_to(:email) }
  it { should respond_to(:password) }
  it { should respond_to(:posts) }

  describe "when screenname is blank" do 
    before {user.screenname = ""}
    it  { should_not be_valid }
  end

  describe "when email is blank" do 
    before { user.password = "" }
    it  { should_not be_valid }
  end

  describe "when email is repeated" do 
    before do
      p User.count
      user1 = User.create!(screenname: "Repeat email", email: "USER@example.com", password: "foobar")
    end
    it { should be_invalid }
  end

  describe "when screenname is repeated" do 
    before do
      user1 = User.create!(screenname: "exampleUSER", email: "example@example.com", password: "foobar")
    end
    it { should be_invalid }
  end

  describe "when email is an invalid format" do 
    before { user.email = "blah+dee" }
    it  { should_not be_valid }
  end


end