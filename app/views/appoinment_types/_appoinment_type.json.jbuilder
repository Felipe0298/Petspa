json.extract! appoinment_type, :id, :payment_required, :name, :user_id, :price, :description, :created_at, :updated_at
json.url appoinment_type_url(appoinment_type, format: :json)
json.description appoinment_type.description.to_s
