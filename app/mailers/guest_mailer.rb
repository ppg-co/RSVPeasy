class GuestMailer < ApplicationMailer
  def guest_email()
    @event = params[:event]
    @guestlist = params[:guestlist]
    mail(to: @guestlist.email)
  end

  def guestlist_email
      @guest = params[:guest]
      mail(to: @guest.email, subject: 'Invitation')
  end
end
