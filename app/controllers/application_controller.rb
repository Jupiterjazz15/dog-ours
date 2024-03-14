class ApplicationController < ActionController::Base

  include Pundit::Authorization
  before_action :configure_permitted_parameters, if: :devise_controller?

  # # Pundit: allow-list approach
  after_action :verify_authorized, except: :index, unless: :skip_pundit?
  after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?
  after_action :save_navigation_history

  # # Uncomment when you *really understand* Pundit!
  # # rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  # # def user_not_authorized
  # #   flash[:alert] = "You are not authorized to perform this action."
  # #   redirect_to(root_path)
  # # end

  def default_url_options
    { host: ENV["DOMAIN"] || "localhost:3000" }
  end

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: user_params)
    devise_parameter_sanitizer.permit(:account_update, keys: user_params)
  end

  def save_navigation_history
    return unless request.get?
    return if request.xhr?

    session[:history] ||= []
    session[:history] << request.fullpath
    session[:history].delete_at 0 if session[:history].size == 6
    session[:history]
  end

  def user_params
    [
      :first_name,
      :last_name,
      dogs_attributes: [
        :name,
        :id
      ]
    ]
  end

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)|(^breeds$)|(^messages$)/
  end
end
