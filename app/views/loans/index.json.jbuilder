json.array!(@loans) do |loan|
  json.extract! loan, :id, :user_id, :room_id, :input_register, :output_register
  json.url loan_url(loan, format: :json)
end
