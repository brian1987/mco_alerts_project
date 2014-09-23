json.array!(@alerts) do |alert|
  json.extract! alert, :id, :first_name, :last_name, :dob, :medicaid_id, :alert
  json.url alert_url(alert, format: :json)
end
