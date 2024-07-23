json.extract! appoinment, :id, :status, :user_id, :appointment_type_id, :start_at, :end_at, :created_at, :updated_at
json.url appoinment_url(appoinment, format: :json)
