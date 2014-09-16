class WebAppsController < ApplicationController
  before_action :set_web_app, only: [:show, :edit, :update, :destroy]

  # GET /web_apps
  # GET /web_apps.json
  def index
    @web_apps = WebApp.all
  end


  # GET /web_apps/1
  # GET /web_apps/1.json
  def show
    @events = @web_app.events

    # Find unique event names
    @event_types = @events.pluck(:name).uniq

    @chart_array = []

    @event_types.each do |type|
      type_hash = {}
      label_val_array = []

      @data = {}

      # Convert :created_at values to dates and propogate @data hash
      @events.where(name: type).order(:created_at).group(:created_at).count.each do |key, value|
        if @data.has_key?(key.to_date)
          @data[key.to_date] += value
        else
          @data[key.to_date] = value
        end
      end

      # Use first and last ordered keys from @data hash to generate date range
      # @date_range = ((@data.keys.last - 1.month) .. @data.keys.last).to_a # Use to limit chart timeline
      @date_range = (@data.keys.first .. @data.keys.last).to_a
      @value_range = []

      # Check for events by date and fill value range with event count data
      @date_range.each do |date|
        if @data.has_key?(date)
          @value_range << @data[date]
        else
          @value_range << 0
        end
      end

      # Convert date range to chart friendly format
      @date_range.map! do |date|
        date.strftime("%m-%d-%Y")
      end

      label_val_array = [@date_range, @value_range]
      type_hash = {type => label_val_array}
      @chart_array << type_hash

    end

      # binding.pry
    # @data = @events.order(:created_at).group("DATE(created_at)").count
    # @date_range = @data.keys
    # @value_range = @data.values
  end

  # GET /web_apps/new
  def new
    @web_app = WebApp.new
  end

  # GET /web_apps/1/edit
  def edit
  end

  # POST /web_apps
  # POST /web_apps.json
  def create
    @web_app = WebApp.new(web_app_params)
    @token = SecureRandom.hex(8)
    @web_app.update_attribute(:token, @token)

    respond_to do |format|
      if @web_app.save
        format.html { redirect_to @web_app, notice: 'Web app was successfully created.' }
        format.json { render action: 'show', status: :created, location: @web_app }
      else
        format.html { render action: 'new' }
        format.json { render json: @web_app.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /web_apps/1
  # PATCH/PUT /web_apps/1.json
  def update
    respond_to do |format|
      if @web_app.update(web_app_params)
        format.html { redirect_to @web_app, notice: 'Web app was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @web_app.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /web_apps/1
  # DELETE /web_apps/1.json
  def destroy
    @web_app.destroy
    respond_to do |format|
      format.html { redirect_to web_apps_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_web_app
      @web_app = WebApp.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def web_app_params
      params.require(:web_app).permit(:name)
    end
end
