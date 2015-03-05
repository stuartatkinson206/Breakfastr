class PastriesController < ApplicationController
  def index
  	# create array of hashes
  	# will become seed data for migration
  	@pastries = Pastry.all
				
  end

  def show
  	@pastry = Pastry.find(params[:id])
	

  end

  def new
  end

  def edit
  end
end
