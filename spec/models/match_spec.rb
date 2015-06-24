require 'rails_helper'

RSpec.describe Match, type: :model do
  before(:each) do
    @user = User.create(uid: "1234",
                    login: "testuser",
                    avatar_url: "http://www.bluestemprairie.com/.a/6a00d834516a0869e2016760f339c3970b-800wi",
                    html_url: "https://github.com/paulgrever")
    @user2 = User.create(uid: "123784",
                    login: "testuser2",
                    avatar_url: "http://www.bluestemprairie.com/.a/6a00d834516a0869e2016760f339c3970b-800wi",
                    html_url: "https://github.com/paulgrever")
    @match = @user.matches.create(person_a: @user.id,
                                  person_b: @user2)
  end

  it "has a relationship with user" do
    expect(@match.user.login).to eq("testuser")
  end

  it "has a default value for status" do
    expect(@match.status).to eq("Potential")
  end
end
