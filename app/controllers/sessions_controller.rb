class SessionsController < ApplicationController
	def new
  end
  def create
  	@user = User.find_by(email: params[:session][:email].downcase)
  	if @user && User.where(params[:session][:password]).first
      redirect_to new_card_path(@user.id)
      puts "successful login"
  	else
  		flash[:danger] = 'Invalid email/password combination'
  		render 'new'
      puts "bad login"
  	end
  end

  def current_user
  	User.find_by(id: session[:user_id])
  	if @current_user.nil?
  		@current_user = User.find_by(id: session[:user_id])
  	else
  		@current_user
  	end
  end
  def destroy
  	
  end
end
