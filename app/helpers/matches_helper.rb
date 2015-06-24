module MatchesHelper
  def person_evaluator(current_user, pot_match)
    if current_user > pot_match
      [pot_match, current_user]
    else
      [current_user, pot_match]
    end
  end

  def list_of_likes
    Match.pending.where(person_b: current_user)
  end

  def dont_match_with_yourself
    if (session[:next_match] == current_user.id) || current_user.next_match == current_user.id
      session[:next_match] += 1
    end
  end

  def dont_match_with_rejects
    rejects = Match.reject.where(person_b: current_user.id).pluck(:person_a)
    if rejects.include?(session[:next_match].to_i)
      session[:next_match] += 1
    end
  end

  def upcoming_match
    if session[:next_match] > current_user.next_match
      session[:next_match]
    else
      session[:next_match] = current_user.next_match
    end
  end

  def out_of_matches
    if session[:next_match] > User.last.id
      redirect_to matches_path
    end
  end
end
