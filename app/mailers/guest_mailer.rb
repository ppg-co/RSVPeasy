class GuestMailer < ApplicationMailer

  def guest_email()
    @event = params[:event]
    @guestlist = params[:guestlist]
    mail(to: @guestlist.email)
  end

  def guestlist_email()
     Guestlist.all.each { |guestlist| mail(to: guestlist.email) }
      # mail(to: Guestlist.first.email )
      # mail(to: Guestlist.second.email )
      # mail(to: Guestlist.third.email )
  end
end
