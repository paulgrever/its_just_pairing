class HomeController < ApplicationController
  skip_before_filter :require_login, except: [:dashboard]
  skip_before_filter :out_of_matches
  
  def index
  end

  def dashboard
    @matches = Match.matched.where('person_a = ? OR person_b =?', current_user.id, current_user.id)
    @users = match_locater
  end
  
  private

  def match_locater
    @matches.map do |match|
      if current_user == match.user
        User.find(match.person_b.to_i)
      else
        match.user
      end
    end
  end
end
