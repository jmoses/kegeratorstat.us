class ContentController < ApplicationController
  def show
    render params[:content]
  end
end
