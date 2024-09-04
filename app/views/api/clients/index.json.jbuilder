# app/views/api/clients/index.json.jbuilder
json.array! @clients do |client|
  json.extract! client, :id, :name, :height, :weight
  json.imc do
    json.extract! client.imc, :value, :message, :obesity_degree if client.imc.present?
  end
end
