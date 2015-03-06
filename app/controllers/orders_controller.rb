class OrdersController < ApplicationController

	# need to get the pastry id and user id
  def new
  	@pastry = Pastry.find(params[:pastry_id])
  	@order = @pastry.orders.new
  end

  

  def create
  	@pastry = Pastry.find(params[:pastry_id])
  	@order = @pastry.orders.new(order_params)
  	@order.user = current_user
  	if @order.save
  		flash[:success] = "Thanks for the order"
  		logger.debug @order

  		redirect_to order_path(@order)
  		# try to charge card here
  		Stripe.api_key = Rails.application.secrets.stripe_secret_key

		Stripe::Charge.create(
		  :amount => @pastry.price_in_pence,
		  :currency => "gbp",
		  :source => @order.stripe_token, # obtained with Stripe.js
		  :description => "Charge for #{@order.user.email}."
		)
  	else
  		flash[:error] = "oops, that didn't work. Please check form for details and try again"
  		render :new
  	end

  end

  def show
  end

private

  def order_params
  	params.require(:order).permit(:stripe_token)
  end

end
