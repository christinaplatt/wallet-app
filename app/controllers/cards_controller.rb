class CardsController < ApplicationController
	def index
		@card = Card.all
	end
	def new
		@card = Card.new

	end

	def create
		@card = Card.new(card_params)
		@card.user_id == User.first
		puts params
		if @card.save
		redirect_to card_path(@card.id)
	else
		redirect_to root_path
	end
	end

	def show
		@card = Card.find(params[:id])
	end




	private

	def card_params
		params.require(:card).permit(:number, :card_type, :exp_month, :exp_year, :user_id)
	end

end
