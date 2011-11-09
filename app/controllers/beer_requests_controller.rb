class BeerRequestsController < ApplicationController
  inherit_resources

  before_filter :authenticate_user!

  actions :new, :create

  def create
    create! do |format|
      format.html do
        flash[:success] = "Request submitted!"
        Mailer.beer_request(@beer_request).deliver rescue nil
        redirect_to kegerators_path
      end
    end
  end
end
