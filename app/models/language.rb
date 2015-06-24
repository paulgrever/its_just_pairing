class Language < ActiveRecord::Base
  has_many :userlanguages
  has_many :users, through: :userlanguages
end