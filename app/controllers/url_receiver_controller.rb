# app/controllers/url_receiver_controller.rb
class UrlReceiverController < ApplicationController
  skip_before_action :verify_authenticity_token
  def check_url
    url = params[:url]
    block = Blocked.exists?(blocked_site: url)
    render json: { blocked: block }
  end

  def receive_url
    if request.post?
      data = JSON.parse(request.body.read)
      url = data['url']
      individual = Individual.create(website: url, last_in: Time.now)
      render json: { message: "Individual created successfully" }, status: :created
    elsif request.get?
      @url = params[:url]
    end
  rescue JSON::ParserError => e
    render json: { error: 'Invalid JSON format' }, status: :unprocessable_entity
  end
end