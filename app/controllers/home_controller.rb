class HomeController < ApplicationController
  before_action :authenticate_customer!, only: [:index, :new]

  def index
  end

  def new
  end

  def edit
  end
end
