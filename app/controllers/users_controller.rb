require 'digest'

class UsersController < ApplicationController
  before_action :authenticate, except: [:create]
  before_action :log_ip, only: [:create]

  def show
    @users = User.all
  end

  def create
    user = User.new(user_params)
    respond_to do |format|
      if user.save
        flash[:notice] = "Thanks, you're all signed up!"
        flash[:danger] = nil
        format.js
      else
        flash[:notice] = nil
        flash[:danger] = "Sorry, we've encountered a problem."
        format.js { render "users/create_error.js.erb" }
      end
    end
  end

private
  def log_ip
    tracker = Tracker.where(ip_address: request.remote_ip)
    if tracker.count == 0
      Tracker.create(ip_address: request.remote_ip, count: 1)
    else
      if Time.now.utc-tracker.last.updated_at < 5.seconds
        flash[:notice] = nil
        flash[:danger] = "You're doing too that soon."
        respond_to do |format|
          format.js { render "users/create_error.js.erb" }
        end
      else
        Tracker.update(tracker.last.id, count: tracker.last.count+1)
      end
    end
  end

  def authenticate
    authenticate_or_request_with_http_basic('Administration') do |username, password|
      md5_of_password = Digest::MD5.hexdigest(password)
      username == ENV["HTTP_USER"] && md5_of_password == ENV["HTTP_PASSWORD"]
    end
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end
