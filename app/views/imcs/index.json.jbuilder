json.array! @imcs do |imc|
    json.id imc.id
    json.height imc.height
    json.weight imc.weight
    json.imc_value imc.imc_value
    json.message imc.message
    json.obesity imc.obesity
    json.created_at imc.created_at
    json.updated_at imc.updated_at
end
