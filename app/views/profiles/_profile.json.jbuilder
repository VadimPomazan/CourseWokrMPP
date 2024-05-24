json.extract! profile, :id, :user_id, :first_name, :last_name, :patronym, :tel, :address, :date_of_birth, :gender, :created_at, :updated_at
json.url profile_url(profile, format: :json)
