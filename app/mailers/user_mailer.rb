class UserMailer < ActionMailer::Base
  default from: "from@example.com"


	def welcome(user)
		mail to: user.email, Subject: "Thanks for signing up"
	end
end
