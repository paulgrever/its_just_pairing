class MatchesController < ApplicationController
  def index
    @user = current_user
    @matches = Match.where(status: 2).where(person_b: current_user.id)
  end

  def create
    if pending_matches
      @match = list_of_likes.first
      if params[:status] == "Pending"
        @match.update(status: "Match")
        matcher = User.find(@match.person_a).login
        flash[:notice] = "Congrats #{current_user.login} you will be a good match with #{matcher} "
      else
        @match.update(status: params[:status])
      end
    else
      @match = current_user.matches.create(person_a: current_user.id, 
                                         person_b: params[:pair_id].to_i, 
                                         status: params[:status])
      session[:next_match] += 1
    end
    redirect_to user_path(next_potential_match)
  end

  private
  
  def pending_matches
    Match.pending.where(person_b: current_user).count > 0
  end
end
