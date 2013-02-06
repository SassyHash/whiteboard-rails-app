require "spec_helper"

describe 'UserController' do
  describe 'routing' do
    it "routes signup to new user" do
      get('/signup').should route_to("users#new")
    end
  end
end

describe 'SessionController' do
  describe 'routing' do
    it "routes signin to new session" do
      get("/signin").should route_to("sessions#new")
    end
    it "routes signout to destroy session" do
      get("/signout").should route_to("sessions#destroy")
    end
  end
end

describe 'PostsController' do
  let(:post) {post.title = "example", post.id = 2 }
  describe "routing" do
    it "routes to show posts with the title in the url" do
      get("/posts/example").should route_to("posts#show", :id => 2)
    end

    it "routes to show posts with a case insensitive title in the url" do
      get("/posts/Example").should route_to("posts#show", :id => 2)
    end
  end
end