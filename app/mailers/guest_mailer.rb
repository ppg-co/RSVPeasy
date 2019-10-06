class GuestMailer < ApplicationMailer
  def guest_email()
    # @event = params[:event]
    # @guestlist = params[:guestlist]
    # mail(to: @guestlist.email)
    @current_guest = params[:current_guest]
    @current_event = params[:current_event]
    mail(to: @current_guest.email, subject: 'Invitation')
  end

  # VB: This is the correct mailer method.   I'm not sure what the one above is for.
  def guestlist_email
      @current_guest = params[:current_guest]
      @current_event = params[:current_event]
      mail(to: @current_guest.email, subject: 'Invitation')
  end
end
