class KegsController < ApplicationController
  before_filter :authenticate_user!
end
