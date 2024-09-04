# app/views/api/clients/index.json.jbuilder
json.array!(@clients) do |client|
  json.id client.id
  json.name client.name
  json.height client.height
  json.weight client.weight
  json.imc client.imc if client.imc.present?
end
