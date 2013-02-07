require 'spec_helper'

describe "PostPages" do
  subject { page }
  # let(:post) {FactoryGirl.create(:post)}

  describe "complete post page" do

    before {visit new_post_path}
    describe "has title and body" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      it {should have_content("Title")}
      it {should have_content("Body")}
    end

    describe "can create a post" do
      before do
        fill_in "Title", with: "random title"
        fill_in "Body", with: "Some body"
      end
      it "makes a post" do
        expect do
          click_button "Write On My Whiteboard"
        end.to change(Post, :count).by(1)
      end
    end
  end
end
