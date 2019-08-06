class GuestMailer < ApplicationMailer

  def guestlist_email()
     @guestlist = guestlist
        guestlist.each do |r|
          guestlist.guestlist_email.deliver_now
          # mail(to: r.email)
        end
  end

  def guest_email()
    # @event = Event.find(params[:event_id])
    @guest = params[:guest]
    mail(to: @guest.email)
  end

end
