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
    expect(current_path).to eq(users_path)
    click_link_or_button("Logout")
    click_link_or_button("Login")
    expect(current_path).to eq(users_path)
  end

end