# app/mailers/user_mailer.rb
class UserMailer < Devise::Mailer
  include Devise::Controllers::UrlHelpers
  default template_path: 'users/mailer'
end
