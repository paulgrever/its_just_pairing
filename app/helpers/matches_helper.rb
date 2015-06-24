module MatchesHelper
  def person_evaluator(current_user, pot_match)
    if current_user > pot_match
      [pot_match, current_user]
    else
      [current_user, pot_match]
    end
  end
end
