require "rails_helper"

RSpec.describe "User", type: :feature do
  before(:each ) do 
    @user = User.create(uid: "1234",
                        login: "testuser",
                        avatar_url: "http://www.bluestemprairie.com/.a/6a00d834516a0869e2016760f339c3970b-800wi",
                        html_url: "https://github.com/paulgrever")
  end

  it "is taken to edit, if not activated" do
    github_login
    visit root_path
    binding.pry
    click_link_or_button("Login")
    expect(current_path).to eq(edit_user_path(@user))
  end

end