class PhiController < ApplicationController
  def patients
    access_token = params[:access_token]
    auth = "Bearer " + params[:access_token]
    http = HTTP.headers("Authorization" => auth)
    response = http.get("https://drchrono.com/api/patients")

    puts "response from drchrono patients endpoint"
    puts response.status

    render json: JSON.parse(response.body)
  end
end
