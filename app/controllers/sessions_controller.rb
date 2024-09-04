class SessionsController < ApplicationController
  def new
  end

  def create
    env['warden'].authenticate!

    if env['warden'].authenticated?
      redirect_to root_path, notice: 'Logged in successfully'
    else
      flash.now[:alert] = 'Invalid email or password'
      render :new
    end
  end

  def destroy
    env['warden'].logout
    redirect_to root_path, notice: 'Logged out successfully'
  end
end

