class ApplicationController < ActionController::API
  def send_consultation
    firebase_url    = 'https://teleasistenta-83ccd-default-rtdb.europe-west1.firebasedatabase.app'
    firebase_secret = 'FGxv1Nr6jsNXpZJhXRilP7h3L8WU8E7iz0iGnGko'
    firebase = Firebase::Client.new(firebase_url, firebase_secret)

    response = firebase.push("ElderTrack/consultations", {
      "doctorUID": params["extension"][0]["valueReference"]["reference"],
      "result": "-"
    })
    render json: {}, status: :ok
  end
end
