require "rails_helper"

RSpec.describe "Matches", type: :feature do
  before(:each) do 
    @user = User.create(uid: "12345",
                        login: "testuser",
                        avatar_url: "http://www.bluestemprairie.com/.a/6a00d834516a0869e2016760f339c3970b-800wi",
                        html_url: "https://github.com/paulgrever", 
                        description: "This is the description")
    @user.languages.create(name: "Ruby")
    @user.languages.create(name: "JavaScript")

    github_login
    visit root_path
    click_link_or_button("Login")
  end

  it "can see potential matches" do
    visit dashboard_path
    click_link_or_button("Find Pairs")
    expect(page).to have_content("testuser")
    expect(page).to have_content("This is the description")
  end

  it "can approve of matches" do
    visit dashboard_path
    click_link_or_button("Find Pairs")
    expect(page).to have_content("testuser")
    expect(page).to have_content("This is the description")
  end
end