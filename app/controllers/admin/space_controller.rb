module Admin
class SpaceController < ::ApplicationController
  force_ssl if Rails.env.production?
  layout "admin"
  before_filter :set_current_section, :authenticate_user!, :authenticate_admin!

private

  def authenticate_admin!
    redirect_to "/users/login/" unless user_signed_in? && current_user.has_role?(:admin)
  end

  def set_current_section
    @current_section = params[:controller].split("/").last.split("_").first.singularize
  end

end
end
