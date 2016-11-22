class WelcomeController < ApplicationController
  def index
    @datasets = Dataset.asc(:id).all
  end
end
