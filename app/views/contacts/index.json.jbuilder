json.array!(@contacts) do |contact|
  json.extract! contact, :id, :title, :street_address, :city, :province, :country, :phone, :email, :additional_information
  json.url contact_url(contact, format: :json)
end
