json.extract! person, :id, :first_name, :last_name, :patronym, :phone_number, :address, :date_of_birth, :created_at, :updated_at
json.url person_url(person, format: :json)
