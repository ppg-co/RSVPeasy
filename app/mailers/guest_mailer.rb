class GuestMailer < ApplicationMailer

  def guestlist_email()
     # @guestlist = params[:guestlist]
     # # emails = @guestlist.map(|guestlist| guestlist.email)
     #    mail(to: emails )
  end

  def guest_email()
    @event = params[:event]
    @guest = params[:guest]
    mail(to: @guest.email)
  end

end
