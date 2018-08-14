class WelcomeController < ApplicationController
  def index
    @client_id = ENV['DR_CHRONO_CLIENT_ID']
  end
end
