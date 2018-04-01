class UserMailer < ApplicationMailer
   
  default from: 'shashikumar2203@gmail.com'

	def appointment doctor, booking_date
    # byebug#
    mail(to: "shashi@inkoop.in", subject: 'Welcome to My Awesome Site')
	end

end
