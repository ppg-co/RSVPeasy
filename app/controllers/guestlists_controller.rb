class GuestlistsController < ApplicationController
  before_action :set_event
  before_action :set_guestlist, only: [:show, :edit, :update, :destroy]

  helper_method :sort_column, :sort_direction
  # GET /guestlists
  # GET /guestlists.json
  # def index
  #   #@guestlists = Guestlist.all
  #   @guestlists = Guestlist.order(:name)
  #   respond_to do |format|
  #     format.html
  #     format.csv { send_data @guestlists.to_csv }
  #     format.xls { send_data @products.to_csv(col_sep: "\t") }
  #   # format.xlsx {
  #   #   response.headers[
  #   #     'Content-Disposition'
  #   #   ] = "attachment; filename='guestlists.xlsx'"
  #   # }
  #   # format.html { render :index }
  #   end
  # end

  def index
  @guestlists = @event.guestlists.order(sort_column + " " + sort_direction)
  # @guestlists=Guestlist.order(sort_column + " " + sort_direction)
  respond_to do |format|
    format.html
    format.csv { send_data @guestlists.to_csv }
    format.xls # { send_data @products.to_csv(col_sep: "\t") }
  end
end

def response_page
  respond_to do |format|
    if @guestlist.update(guestlist_params)
      format.html { redirect_to event_landing_page_path(@event), notice: 'Guest was successfully updated.' }
      format.json { render :show, status: :ok, location: @guestlist }
    else
      format.html { render :edit }
      format.json { render json: @guestlist.errors, status: :unprocessable_entity }
    end
  end
end

def import
  @event.guestlists.import(params[:file])
  @guestlists = Guestlist.where(event_id: @event.id)
  @guestlists.each do |g|
    #puts g.email
    GuestMailer.with(current_guest: g, current_event: @event).guestlist_email.deliver_later
  end
  redirect_to event_guestlists_path(@event), notice: "Guest List Has Successfully Been Added! Yay!"
end

  # GET /guestlists/1
  # GET /guestlists/1.json
  def show
  end

  # GET /guestlists/new
  def new
    @guestlist = Guestlist.new
  end

  # GET /guestlists/1/edit
  def edit
  end

  # POST /guestlists
  # POST /guestlists.json
  def create
    @guestlist = @event.guestlists.new(guestlist_params)

    respond_to do |format|
      if @guestlist.save
        format.html { redirect_to event_guestlists_url, notice: 'Guest was successfully created.' }
        format.json { render :show, status: :created, location: @guestlist }
        GuestMailer.with(guestlist: @guestlist, event: @event).guest_email.deliver_now
      else
        format.html { render :new }
        format.json { render json: @guestlist.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /guestlists/1
  # PATCH/PUT /guestlists/1.json
  def update
    respond_to do |format|
      if @guestlist.update(guestlist_params)
        format.html { redirect_to event_guestlists_path(@event), notice: 'Guest was successfully updated.' }
        format.json { render :show, status: :ok, location: @guestlist }
      else
        format.html { render :edit }
        format.json { render json: @guestlist.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /guestlists/1
  # DELETE /guestlists/1.json
  def destroy
    @guestlist.destroy
    respond_to do |format|
      format.html { redirect_to event_guestlists_path(@event), notice: 'Guest was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private
    def sort_column
      Guestlist.column_names.include?(params[:sort]) ? params[:sort] : "firstname"
    end

    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end

    def set_guestlist
      @guestlist = @event.guestlists.find(params[:id])
    end

    def set_event
      @event = Event.find(params[:event_id])
    end


    # Never trust parameters from the scary internet, only allow the white list through.
    def guestlist_params
      params.require(:guestlist).permit(:firstname, :lastname, :email, :response, :dietary_requirements, :event_id)
    end
end
