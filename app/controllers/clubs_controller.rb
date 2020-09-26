class ClubsController < ApplicationController
    
    before_action :set_club, :only => [ :show, :edit, :update, :destroy]

    def index
        @clubs = Club.all
    end

    def new
        @club = Club.new    
    end

    def create
        flash[:notice] = "Club was successfully created"
        @club = Club.new(club_params)
        if @club.save
            redirect_to clubs_url
        else
            render :action => :new
        end    
    end

    def show
        @club = Club.find(params[:id])
        @page_title = @club.name

        respond_to do |format|
            format.html { @page_title = @club.name } # show.html.erb
            format.xml # show.xml.builder
            format.json { render :json => { id: @club.id, name: @club.name }.to_json }
        end
    end

    def edit
        @club = Club.find(params[:id])
    end

    def update
        flash[:notice] = "Club was successfully updated"

        if @club.update(club_params)
            redirect_to :action => :show, :id => @club
        else
            render :action => :edit
        end
    end

    def destroy
        flash[:alert] = "Club was successfully deleted"

        @club = Club.find(params[:id])
        @club.destroy
      
        redirect_to clubs_url
    end

    private

    def club_params
        params.require(:club).permit(:name, :description)
    end

    def set_club
        @club = Club.find(params[:id])
    end

end
