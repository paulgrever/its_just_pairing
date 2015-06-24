require "rails_helper"

RSpec.describe "User", type: :feature do

  it "is taken to edit, if not activated" do
    github_login
    visit root_path
    click_link_or_button("Login")
    expect(page).to have_content("Please complete your pairing profile")
  end

  it "is taken to index if actived" do
    github_login
    visit root_path
    click_link_or_button("Login")
    fill_in("user[description]", with: "This is the new description")
    click_link_or_button("Complete Profile")
    click_link_or_button("Logout")
    click_link_or_button("Login")
    expect(current_path).to eq(dashboard_path)
  end
  context "with languages" do
    before(:each) do
      Language.create(name: "Ruby")
      Language.create(name: "JavaScript")
    end

    it "can select languages" do
      github_login
      visit root_path
      click_link_or_button("Login")
      find(:css, "#Ruby").set(true)
      fill_in("user[description]", with: "This is the new description")
      click_link_or_button("Complete Profile")
      user = User.first
      expect(user.languages.first.name).to eq("Ruby")
      expect(user.languages.include?("JavaScript")).to eq(false)
    end
  end
end