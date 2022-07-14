class CheetsController < ApplicationController
  before_action :set_user

  def index
    render json: @user.cheets
  end

  def create
    @user.cheets.create!(cheet_params)
  end

  # This application does not implement any authorization or authentication, as it would end up being a large percentage
  # of the code. You do not need to make any comments around security issues involving users - it's intended that
  # anyone can perform actions on behalf of any user id.
  def set_user
    @user = User.find(params[:user_id])
  end

  def cheet_params
    params.permit(:message)
  end
end
