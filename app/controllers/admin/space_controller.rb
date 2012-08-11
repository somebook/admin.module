class Admin::SpaceController < ApplicationController
  force_ssl if Rails.env.production?
  layout "admin"
  before_filter :authenticate_user!, :authenticate_admin!

private

  def authenticate_admin!
    redirect_to new_user_session_path unless user_signed_in? && current_user.has_role?(:admin)
  end
end
