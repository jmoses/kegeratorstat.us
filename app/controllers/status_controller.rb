class StatusController < ApplicationController
  def index
    @kegs = Keg.order("created_at desc").limit(15).includes(:user)
  end
end
