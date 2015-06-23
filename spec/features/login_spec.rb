require "rails_helper"

RSpec.describe "User", type: :feature do
  it "can be created" do
    github_login
    visit root_path
    expect(User.count).to eq(0)
    within(".main-body") do 
      click_link_or_button("Login with Github")
    end
    expect(User.count).to eq(1)
  end

  it "can logout once logged in" do
    github_login
    visit root_path
    expect(page).to_not have_content("Logout")
    click_link_or_button("Login with Github")
    expect(page).to have_content("Logout")
    click_link_or_button("Logout")
    expect(page).to have_content("Login with Github")
  end
end