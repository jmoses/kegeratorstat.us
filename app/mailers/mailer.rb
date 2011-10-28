class Mailer < ActionMailer::Base
  default from: "from@example.com"

  def beer_request( request )
    @request = request
    mail(:to => 'jon@burningbush.us', :subject => "[kegeratorstat.us] Beer Request")
  end
end
