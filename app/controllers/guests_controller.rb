class GuestsController < ApplicationController
    before_action :set_event, only: [:show, :edit, :update, :destroy]
    before_action :set_guest, only: [:show, :edit, :update, :destroy]

  # GET /guests
  # GET /guests.json
  def index
    @guests = Guest.all
  end

  # GET /guests/1
  # GET /guests/1.json
  def show
  end

  # GET /guests/ne

  # GET /guests/1/edit
  def edit
  end

  # POST /guests
  # POST /guests.json
  def create
    @event = Event.find(params[:event_id])
    @guest = @event.guests.create(guest_params)
    GuestMailer.with(guest: @guest, event: @event).guest_email.deliver_now
    redirect_to event_path(@event)
  end

  # PATCH/PUT /guests/1
  # PATCH/PUT /guests/1.json
  def update
    respond_to do |format|
      if @guest.update(guest_params)
        format.html { redirect_to @event, notice: 'Guest was successfully updated.' }
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
      format.html { redirect_to @event, notice: 'Guest was successfully destroyed.' }
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
