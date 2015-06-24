class HomeController < ApplicationController
  skip_before_filter :require_login
  def index
  end

  def dashboard
    @matches = Match.all
  end
end
