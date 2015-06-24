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
    User.last.update(next_match: @user.id)
    visit dashboard_path
    click_link_or_button("Find Pairs")
  end

  it "can see potential matches" do

    expect(page).to have_content("testuser")
    expect(page).to have_content("This is the description")
  end

  it "can approve of matches" do
    expect(User.last.matches.count).to eq(0)
    click_link_or_button("Approve")
    expect(User.last.matches.first.status).to eq("Pending")
  end

  it "can reject of matches" do
    click_link_or_button("Reject")
    expect(User.last.matches.first.status).to eq("Reject")
  end

  it "it can make a match" do
    Match.create(person_a: @user2.id,
                 person_b: User.last.id,
                 status: 2,
                 user_id: @user2.id)
    visit dashboard_path
    click_link_or_button("Find Pairs")
    expect(page).to have_content("testuser2")
    click_link_or_button("Approve")
    expect(page).to have_content("Congrats")
    visit dashboard_path
    expect(page).to have_content("testuser2")
  end

  it "rejects don't show on match page" do
    Match.create(person_a: @user2.id,
                 person_b: User.last.id,
                 status: 2,
                 user_id: @user2.id)
    visit dashboard_path
    click_link_or_button("Find Pairs")
    expect(page).to have_content("testuser2")
    click_link_or_button("Reject")
    expect(page).to_not have_content("Congrats")
    visit dashboard_path
    expect(page).to_not have_content("testuser2")
  end

  it "will redirect to no more matches page if out of potential matches" do
    expect(page).to have_content("testuser")
    click_link_or_button("Approve")
    expect(page).to have_content("testuser2")
    click_link_or_button("Approve")
    expect(current_path).to eq(matches_path)
    expect(page).to have_content("Sorry there are no more potential matches at this time.")
  end

  it "will never match withitself" do
    name = User.last.login
    within(".main-body") do 
      expect(page).to_not have_content(name)
      click_link_or_button("Approve")
      expect(page).to_not have_content(name)
      click_link_or_button("Approve")
      expect(page).to_not have_content(name)
    end

  end
end