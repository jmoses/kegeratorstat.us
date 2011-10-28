class BeerRequestsController < ApplicationController
  inherit_resources

  actions :new, :create

  def create
    create! do |format|
      format.html do
        flash[:success] = "Request submitted!"
        Mailer.beer_request(@beer_request).deliver
        redirect_to kegerators_path
      end
    end
  end
end
