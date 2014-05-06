require 'digest'

class UsersController < ApplicationController
  before_action :authenticate, except: [:create]

  def index
  end

  def create
    user = User.new(user_params)
    respond_to do |format|
      if user.save
        flash[:danger] = nil
        flash[:notice] = "Thanks, you're all signed up!"
        format.js
      else
        flash[:notice] = nil
        flash[:danger] = "Sorry, we've encountered a problem."
        format.js { render "users/create_error.js.erb" }
      end
    end
  end

private
  def authenticate
    authenticate_or_request_with_http_basic('Administration') do |username, password|
      md5_of_password = Digest::MD5.hexdigest(password)
      username == '<%= ENV["HTTP_USER"] %>' && md5_of_password == '<%= ENV["HTTP_PASSWORD"] %>'
    end
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end
