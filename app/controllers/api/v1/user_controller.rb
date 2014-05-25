class Api::V1::EntriesController < ApplicationController
  respond_to :json
  before_action :log_ip, only: [:create]

  def create
    user = User.new(user_params)
    respond_to do |format|
      if user.save
        format.json
      else
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

  def entry_params
    params.require(:entry).permit(:name)
  end
end