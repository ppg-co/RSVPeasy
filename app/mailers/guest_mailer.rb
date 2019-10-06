class GuestMailer < ApplicationMailer
  def guest_email()
    @event = params[:event]
    @guestlist = params[:guestlist]
    mail(to: @guestlist.email)
  end

  def guestlist_email
      @guestlist = params[:guestlist]
      mail(to: @guestlist.email, subject: 'Invitation')
  end
end
