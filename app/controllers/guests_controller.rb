class GuestsController < ApplicationController
    before_action :set_event
    before_action :set_guest, only: [:show, :edit, :update, :destroy]

  # GET /guests
  # GET /guests.json
  def index
    @guests = @event.guests
    if params[:search]
      @search_term = params[:search]
      @guests = @event.guests.search_by(@search_term)
      # @guest = @event.guests.find(params[:search])
    end
    if params[:search] && @guests.count == 1
        @guest = @event.guests.find(params[:search])
    redirect_to edit_event_guest_path(@event, @guest)
  end
  end
  # if params[:event_id]
  #   @guests = Event.find(params[:event_id])
  # end

  # GET /guests/1
  # GET /guests/1.json
  def show
    @guest = @event.guests.find(params[:id])
  end

  # GET /guests/ne

  # GET /guests/1/edit
  def edit
    if params[:search].present?
      @search_term = params[:search]
      @guest = @event.guests.search_by(@search_term)
    end
  end

  # POST /guests
  # POST /guests.json
  def create
    # @event = Event.find(params[:event_id])
    @guest = @event.guests.create(guest_params)
    respond_to do |format|
      if @guest.save
        format.html { redirect_to @event, notice: 'Guest was successfully added.' }
        GuestMailer.with(guest: @guest, event: @event).guest_email.deliver_now
      end
    end

  end

  # PATCH/PUT /guests/1
  # PATCH/PUT /guests/1.json
  def update
    @event = Event.find(params[:event_id])
    @guest = @event.guests.create(guest_params)
    respond_to do |format|
      if @guest.update(guest_params)
        format.html { redirect_to event_landing_page_path(@event), notice: 'Guest was successfully updated.' }
        format.json { render :show, status: :ok, location: @guest }
      else
        format.html { render :edit }
        format.json { render json: @guest.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /guests/1
  # DELETE /guests/1.json
  def destroy
    @guest.destroy
    respond_to do |format|

      format.html { redirect_to @event, notice: 'Guest has been removed.' }

      format.json { head :no_content }
    end
  end

  private

   def set_event
     @event = Event.find(params[:event_id])
   end
    # Use callbacks to share common setup or constraints between actions.
    def set_guest
      @guest = @event.guests.find(params[:id])
    end


    # Never trust parameters from the scary internet, only allow the white list through.
    def guest_params
      params.require(:guest).permit(:name, :email, :response, :event_id)
    end
end
