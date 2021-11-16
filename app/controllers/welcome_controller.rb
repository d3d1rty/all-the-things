class WelcomeController < ApplicationController
  def index
    redirect_to items_path if user_signed_in?
  end
end
