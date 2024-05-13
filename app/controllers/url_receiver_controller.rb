# app/controllers/url_receiver_controller.rb
class UrlReceiverController < ApplicationController
  skip_before_action :verify_authenticity_token

  def receive_url
    if request.post?
       data = JSON.parse(request.body.read)
      url = data['url']
      message = data['message']
      
      if message == "closed"
        individual = Individual.find_by(website: url)
        if individual
          individual.update(last_out: Time.now)
          render json: { message: "last_out updated successfully" }, status: :ok
        else
          render json: { error: "Individual not found" }, status: :not_found
        end
      else
        individual = Individual.create(website: url, last_in: Time.now)
        render json: { message: "Individual created successfully" }, status: :created
      end
    elsif request.get?
      @url = params[:url]
    end
  rescue JSON::ParserError => e
    render json: { error: 'Invalid JSON format' }, status: :unprocessable_entity
  end
end