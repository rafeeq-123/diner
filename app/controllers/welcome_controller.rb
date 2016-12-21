class WelcomeController < ApplicationController
	skip_before_action :authenticate_user!, except: [:index]
  def index
  end
end
