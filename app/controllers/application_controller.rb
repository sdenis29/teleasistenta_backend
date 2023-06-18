class ApplicationController < ActionController::API
  def send_consultation
    firebase_url    = 'https://teleasistenta-83ccd-default-rtdb.europe-west1.firebasedatabase.app'
    firebase_secret = 'FGxv1Nr6jsNXpZJhXRilP7h3L8WU8E7iz0iGnGko'
    firebase = Firebase::Client.new(firebase_url, firebase_secret)
    response = firebase.push("ElderTrack/consultations", {
      "doctorUID": params["extension"][0]["valueReference"]["reference"],
      "patientUID": params["subject"]["reference"],
      "medicalRecordUID": params["id"],
      "description": params["extension"][1]["valueString"],
      "consultationCode": params["modifierExtension"][0]["valueCodeableConcept"]["coding"][0]["code"],
      "created_at": Time.zone.now.strftime("%d/%m/%Y").to_s,
      "result": "Pacientul trimis nu prezintă anomalii."
    })
    render json: {}, status: :ok
  end
end
