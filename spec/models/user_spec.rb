require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each ) do 
    @user = User.create(uid: "1234",
                        login: "testuser",
                        avatar_url: "http://www.bluestemprairie.com/.a/6a00d834516a0869e2016760f339c3970b-800wi",
                        html_url: "https://github.com/paulgrever")
    @user.languages.create(name: "Ruby")
    @user.languages.create(name: "JavaScript")
  end

  it "is not activated initially" do
    expect(@user.activated).to eq(false)
  end

  it "can have languages" do
    expect(@user.languages.first.name).to eq("Ruby")
    expect(@user.languages.last.name).to eq("JavaScript")
  end

end
