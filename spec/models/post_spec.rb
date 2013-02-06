require 'spec_helper'

describe Post do
  before do
    @post = Post.new(user_id: 1, title: "Grocery list", 
                     body: "Buy milk and eggs." )
  end

  subject { @post }

  it { should respond_to(:user_id)}
  it { should respond_to(:title) }
  it { should respond_to(:body) }
  it { should respond_to(:created_at) }
  it { should respond_to(:updated_at) }

  describe "is invalid without an author" do 
    before { @post.user_id = nil}
    it { should_not be_invalid }
  end

  describe "is invalid without a title" do
    before { @post.title = ""}
    it { should_not be_valid }
  end

  describe "is invalid wit an empty bdody" do
    before { @post.body = ""}
    it { should_not be_valid }
  end

  describe "cannot repeat a title regardless of case" do
    before { post1 = Post.new(user_id: 1, title: "grocery List", body: "Buy somethings" ); post1.save }
    it { should_not be_valid}
  end

  describe "can repeat a body" do 
    before {post1 = Post.new(user_id: 2, title: "new grocery list", body: "Buy milk and eggs." ); post1.save }
    it {should be_valid}
  end

  it "stores undercase title url" do
    @post.title_url == 'grocery list'
  end
end