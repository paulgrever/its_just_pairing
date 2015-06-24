require 'rails_helper'

RSpec.describe Language, type: :model do
  before(:each) do
    @language = Language.create(name: "Ruby")
    @language.users.create(uid: "1234",
                          login: "testuser",
                          avatar_url: "http://www.bluestemprairie.com/.a/6a00d834516a0869e2016760f339c3970b-800wi",
                          html_url: "https://github.com/paulgrever")
    @language.users.create(uid: "5678",
                          login: "testuser2",
                          avatar_url: "http://www.googlecom",
                          html_url: "https://github.com/paulgrever")
  end

  it "has a name" do
    expect(@language.name).to eq("Ruby")
  end

  it "can have multiple users" do
    expect(@language.users.first.uid).to eq("1234")
  end
end
