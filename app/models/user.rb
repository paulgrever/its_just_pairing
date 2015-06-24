class User < ActiveRecord::Base
  def self.find_or_create_by_auth(data)
    user = find_or_create_by_uid(data["uid"])
    user.login = data["info"]["nickname"]
    user.avatar_url = data["info"]["image"]
    user.html_url = data["info"]["urls"]["GitHub"] 
    user.save
    user
  end

  def self.find_or_create_by_uid(uid)
    User.find_by(uid: uid) || User.new(uid: uid)
  end

  has_many :userlanguages
  has_many :languages, through: :userlanguages
  validates :description, length: { maximum: 500 }
end
