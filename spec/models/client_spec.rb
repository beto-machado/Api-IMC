require 'rails_helper'

RSpec.describe Client, type: :model do
  it 'is valid with valid attributes' do
    client = create(:client)
    expect(client).to be_valid
  end

  it 'calculates and associates IMC upon creation' do
    client = create(:client)
    expect(client.imc).to be_present
    expect(client.imc.value).to eq((client.weight / (client.height ** 2)).round(2))
    expect(client.imc.message).to eq(Imc.classify(client.imc.value)[:message])
    expect(client.imc.obesity_degree).to eq(Imc.classify(client.imc.value)[:obesity])
  end

  it 'updates IMC when height or weight is updated' do
    client = create(:client)
    new_height = 1.80
    new_weight = 75
    client.update(height: new_height, weight: new_weight)
    client.reload
    expect(client.imc.value).to eq((new_weight / (new_height ** 2)).round(2))
    expect(client.imc.message).to eq(Imc.classify(client.imc.value)[:message])
    expect(client.imc.obesity_degree).to eq(Imc.classify(client.imc.value)[:obesity])
  end

  it 'destroys IMC if height or weight is missing' do
    client = create(:client)
    client.update(height: nil, weight: nil)
    client.reload
    expect(client.imc).to be_nil
  end
end
