require "rails_helper"

RSpec.describe "Matches", type: :feature do
  before(:each) do 
    @user = User.create(uid: "12345",
                        login: "testuser",
                        avatar_url: "http://www.bluestemprairie.com/.a/6a00d834516a0869e2016760f339c3970b-800wi",
                        html_url: "https://github.com/paulgrever", 
                        description: "This is the description",
                        next_match: 1)
    @user2 = User.create(uid: "12346",
                        login: "testuser2",
                        avatar_url: "http://www.bluestemprairie.com/.a/6a00d834516a0869e2016760f339c3970b-800wi",
                        html_url: "https://github.com/paulgrever", 
                        description: "This is the description",
                        next_match: 1)
    @user.languages.create(name: "Ruby")
    @user.languages.create(name: "JavaScript")
    @user2.languages.create(name: "Ruby")
    @user2.languages.create(name: "JavaScript")

    github_login
    visit root_path
    click_link_or_button("Login")
  end

  it "can see potential matches" do
    User.last.update(next_match: @user.id)
    binding.pry
    visit dashboard_path
    click_link_or_button("Find Pairs")
    expect(page).to have_content("testuser")
    expect(page).to have_content("This is the description")
  end

  xit "can approve of matches" do
    expect(User.last.matches.count).to eq(0)
    User.last.update(next_match: @user.id)
    visit dashboard_path
    click_link_or_button("Find Pairs")
    expect(page).to have_content("testuser")
    expect(page).to have_content("This is the description")
    click_link_or_button("Approve")
    expect(User.last.matches.first.status).to eq("Pending")
  end

  xit "can reject of matches" do
    expect(User.last.matches.count).to eq(0)
    User.last.update(next_match: @user.id)
    visit dashboard_path
    click_link_or_button("Find Pairs")
    expect(page).to have_content("testuser")
    expect(page).to have_content("This is the description")
    click_link_or_button("Reject")
    expect(User.last.matches.first.status).to eq("Reject")
  end
end