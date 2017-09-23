json.extract! registration, :id, :Name, :Event, :Contact_no, :Email, :College, :created_at, :updated_at
json.url registration_url(registration, format: :json)
