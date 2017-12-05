class LandingsController < ApplicationController
  layout 'no_nav'
  before_filter :redirect_authenticated_users

  def index

  end

  private

  def redirect_authenticated_users
    redirect_to panoramas_path if user_signed_in?
  end
end
