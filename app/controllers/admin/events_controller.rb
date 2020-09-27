class Admin::EventsController < ApplicationController
  before_action :authenticate_user! 
  before_action :check_admin
  before_action :set_admin_event, only: [:show, :edit, :update, :destroy]
  before_action :set_admin_club, only: [:show, :edit, :update, :destroy]

  # GET /admin/events
  # GET /admin/events.json
  def index
    @admin_events = Admin::Event.all
  end

  # GET /admin/events/1
  # GET /admin/events/1.json
  def show
    if params.has_key?(:club_id)
      @admin_club = Club.find(params[:club_id])
    end
    
    if @admin_event.is_public?
      @is_public_wording = "公開"
    else
      @is_public_wording = "未公開"
    end
  end

  # GET /admin/events/new
  def new
    @admin_event = Admin::Event.new
  end

  # GET /admin/events/1/edit
  def edit
  end

  # POST /admin/events
  # POST /admin/events.json
  def create
    @admin_event = Admin::Event.new(admin_event_params)

    respond_to do |format|
      if @admin_event.save
        format.html { redirect_to @admin_event, notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: @admin_event }
      else
        format.html { render :new }
        format.json { render json: @admin_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/events/1
  # PATCH/PUT /admin/events/1.json
  def update
    if params[:destroy_banner] == "1"
      @admin_event.banner = nil
    end
    respond_to do |format|
      if @admin_event.update(admin_event_params)
        format.html { redirect_to admin_club_event_path(@admin_club, @admin_event), notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin_event }
      else
        format.html { render :edit }
        format.json { render json: @admin_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/events/1
  # DELETE /admin/events/1.json
  def destroy
    @admin_event.destroy
    respond_to do |format|
      format.html { redirect_to admin_events_url, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_event
      @admin_event = Admin::Event.find(params[:id])
    end

    def set_admin_club
      @admin_club = Admin::Club.find(params[:club_id])
    end

    # Only allow a list of trusted parameters through.
    def admin_event_params
      params.fetch(:admin_event, {}).permit(
        :name, :banner, :description, :is_public, :status,
        :start_time, :end_time, :customers_target
      )
    end

    def check_admin
      unless current_user.admin?
          raise ActiveRecord::RecordNotFound
      end
    end
end