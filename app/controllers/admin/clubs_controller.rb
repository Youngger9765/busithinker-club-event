class Admin::ClubsController < ApplicationController
  before_action :authenticate_user! 
  before_action :check_admin
  before_action :set_admin_club, only: [:show, :edit, :update, :destroy]

  # GET /admin/clubs
  # GET /admin/clubs.json
  def index
    @admin_clubs = Admin::Club.all
  end

  # GET /admin/clubs/1
  # GET /admin/clubs/1.json
  def show
  end

  # GET /admin/clubs/new
  def new
    @admin_club = Admin::Club.new
  end

  # GET /admin/clubs/1/edit
  def edit
  end

  # POST /admin/clubs
  # POST /admin/clubs.json
  def create
    @admin_club = Admin::Club.new(admin_club_params)

    respond_to do |format|
      if @admin_club.save
        format.html { redirect_to @admin_club, notice: 'Club was successfully created.' }
        format.json { render :show, status: :created, location: @admin_club }
      else
        format.html { render :new }
        format.json { render json: @admin_club.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/clubs/1
  # PATCH/PUT /admin/clubs/1.json
  def update
    
    if params[:destroy_logo] == "1"
      @admin_club.logo = nil
    end

    if params[:destroy_banner] == "1"
      @admin_club.banner = nil
    end


    respond_to do |format|
      if @admin_club.update(admin_club_params)
        format.html { redirect_to @admin_club, notice: 'Club was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin_club }
      else
        format.html { render :edit }
        format.json { render json: @admin_club.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/clubs/1
  # DELETE /admin/clubs/1.json
  def destroy
    @admin_club.destroy
    respond_to do |format|
      format.html { redirect_to admin_clubs_url, notice: 'Club was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_club
      @admin_club = Admin::Club.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def admin_club_params
      params.fetch(:admin_club, {}).permit(:name, :logo, :banner)
    end

    def check_admin
      unless current_user.is_admin?
          redirect_to root_path
      end
    end
end
