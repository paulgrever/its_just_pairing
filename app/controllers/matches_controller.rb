class MatchesController < ApplicationController
  def index
    @users = User.all
  end

  def create
    people = person_evaluator(current_user.id, params[:pair_id].to_i)
    @match = current_user.matches.create(person_a: people[0], 
                       person_b: people[1], 
                       status: params[:status])
    redirect_to matches_path
  end
end
