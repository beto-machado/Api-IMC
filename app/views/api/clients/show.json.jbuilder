json.extract! @client, :id, :name, :height, :weight
json.imc do
  json.extract! @client.imc, :value, :message, :obesity_degree if @client.imc.present?
end

