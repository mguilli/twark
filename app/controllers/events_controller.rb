class EventsController < ApplicationController
  before_action :set_headers
  skip_before_action :verfiy_authenticity_token

  def index
  end

  def create
    @webapp = WebApp.where(token: params[:token]).first
    @event = @webapp.events.build(params.require(:event).permit(:name, :value))
    @event.value = request.remote_ip
    @event.save
  end

  def destroy
  end

  def show
  end


  private

  def set_headers
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Methods'] = 'POST, GET, OPTIONS'
    headers['Access-Control-Allow-Headers'] = 'Content-Type'
    headers['Access-Control-Max-Age'] = '1728000'    
  end

end