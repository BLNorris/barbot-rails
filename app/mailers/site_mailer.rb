class SiteMailer < ActionMailer::Base
  
  from_address = Mail::Address.new "BARBOT@BLNorris.com"
  from_address.display_name = "BARBOT"
  
  default from: from_address.format


  def welcome(user)

    @user = user

    mail to: user.email
  end
end
