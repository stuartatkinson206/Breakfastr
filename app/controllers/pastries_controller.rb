class PastriesController < ApplicationController
  def index
  	# create array of hashes
  	# will become seed data for migration
  	@pastries = [
  				{
  					name: "Croissant",
  					price_in_pence: 350,
  					description:" Butter one"  		
				},
				{
					name: "Pain au chocolat",
					price_in_pence: 380,
					description: "choccy one",
				}]
				
  end

  def show
  end

  def new
  end

  def edit
  end
end
