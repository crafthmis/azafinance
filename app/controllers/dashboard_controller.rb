class DashboardController < ApplicationController
  before_action :set_user

  def index
    cheets = Cheet.joins('inner join subscriptions on subscriptions.subscribed_to_id  = cheets.user_id ')
	              .where(' subscriptions.subscribed_id = ? ',@user.id)
                  .order(created_at: :desc)
                  .limit(50)

    render json: cheets
  end

  # This application does not implement any authorization or authentication, as it would end up being a large percentage
  # of the code. You do not need to make any comments around security issues involving users - it's intended that
  # anyone can perform actions on behalf of any user id.
  def set_user
    @user = User.find(params[:user_id])
  end
end
