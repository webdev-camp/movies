class HomeController < ApplicationController
  before_action :authenticate_user!

  def movie
  end
end
