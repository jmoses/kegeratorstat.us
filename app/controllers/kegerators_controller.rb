class KegeratorsController < ApplicationController
  inherit_resources

  before_filter :authenticate_user!

  def create
    create! { kegerators_path }
  end

  def update 
    update! { kegerators_path }
  end

  protected
    def begin_of_association_chain
      current_user
    end
end
