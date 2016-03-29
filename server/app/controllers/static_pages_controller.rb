class StaticPagesController < ApplicationController
  def index
    @request = request
  end
end
