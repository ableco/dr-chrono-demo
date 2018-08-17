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

  def lab_results
    access_token = params[:access_token]
    patient_id = params[:patient_id]

    auth = "Bearer " + params[:access_token]
    http = HTTP.headers("Authorization" => auth)
    response = http.get("https://drchrono.com/api/lab_results?patient=" + patient_id)

    puts "response from drchrono lab_results endpoint"
    puts response.status

    render json: JSON.parse(response.body)
  end
end
