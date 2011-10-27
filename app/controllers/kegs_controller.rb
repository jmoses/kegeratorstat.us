class KegsController < ApplicationController
  inherit_resources
  belongs_to :kegerator

  before_filter :authenticate_user!

  def create
    create! { kegerators_path }
  end

  def destroy
    destroy! { kegerators_path }
  end

  def update
    update! { kegerators_path }
  end
end
