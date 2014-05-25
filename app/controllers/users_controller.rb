require 'digest'

class UsersController < ApplicationController
  before_action :authenticate, except: [:create]

  def show
    @users = User.all
  end

private
  def authenticate
    authenticate_or_request_with_http_basic('Administration') do |username, password|
      md5_of_password = Digest::MD5.hexdigest(password)
      username == ENV["HTTP_USER"] && md5_of_password == ENV["HTTP_PASSWORD"]
    end
  end
end
