class ApplicationController < ActionController::API
  def send_consultation
    render json: {
      message: "TEST"
    }
  end
end
