class PasswordcheckerController < ApplicationController

  def check_credentials
    @username = params[:username]
    @password = params[:password]

    if @username.length>=6 && !@username.include?("!") && !@username.include?("#") && !@username.include?("$") &&
      flash.now[:alert] = "Your username is valid."
      cookies[:valid_username] = @username
      @valid_username = cookies[:valid_username]
    else
      flash.now[:alert] = "Your username is invalid."
    end

    if @password.length>=6 && (@password.include?("!") || @password.include?("#") || @password.include?("$")) && (@password.include?("0") || @password.include?("1") || @password.include?("2") || @password.include?("3") || @password.include?("4") || @password.include?("5") || @password.include?("6") || @password.include?("7") || @password.include?("8") || @password.include?("9")) && @password.upcase != @password && @password.downcase != @password
      flash.now[:notice] = "Your password is valid."
      cookies[:valid_password] = @password
      @valid_password = cookies[:valid_password]
    else
      flash.now[:notice] = "Your password is invalid."
    end

  end

end
