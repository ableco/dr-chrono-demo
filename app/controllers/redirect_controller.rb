class RedirectController < ApplicationController
  def index
    @code = "<not found>"
    if params.has_key?(:code)
      @code = params[:code]
      body = get_token(@code)

      puts "access token:"
      @access_token = body["access_token"]

      puts "refresh token:"
      @refresh_token = body["refresh_token"]
    end
  end

  def get_token(code)
    client_id = ENV['DR_CHRONO_CLIENT_ID']
    client_secret = ENV['DR_CHRONO_CLIENT_SECRET']

    puts client_id
    puts client_secret

    puts "getting access token and refresh token from dr chrono"
    response = HTTP.post("https://drchrono.com/o/token/", :form => {
      :grant_type => "authorization_code",
      :client_id => client_id,
      :client_secret => client_secret,
      :redirect_uri => "http://localhost:3000/redirect",
      :code => code,
    })

    puts "response status from server:"
    puts response.status

    body = JSON.parse(response.body)
    return body
  rescue HTTP::Error
    puts "some sort of http error"
  end
end
