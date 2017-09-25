json.extract! event, :id, :Title, :Description, :Venue, :Time, :Date, :Cost, :Department, :Type, :CordinatorDetails, :add_photo, :created_at, :updated_at
json.url event_url(event, format: :json)
