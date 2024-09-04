RSpec.describe Api::ClientsController, type: :controller do
  let!(:client) { create(:client) }
  let(:valid_attributes) { { name: 'Jane Doe', height: 1.70, weight: 65 } }
  let(:invalid_attributes) { { name: '', height: nil, weight: nil } }

  describe 'GET #index' do
    it 'returns a success response' do
      create_list(:client, 5)
      get :index
      expect(response.status).to eq 200
      expect(JSON.parse(response.body).size).to eq(1)
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      get :show, params: { id: client.id }
      expect(response.status).to eq 200
      expect(JSON.parse(response.body)['name']).to eq(client.name)
    end
  end

  describe 'POST #create' do
    context 'with valid parameters' do
      it 'creates a new Client' do
        expect {
          post :create, params: { client: valid_attributes }
        }.to change(Client, :count).by(1)
      end

      it 'renders a JSON response with the new client' do
        post :create, params: { client: valid_attributes }
        expect(response.status).to eq 201
        byebug
        expect(JSON.parse(response.body)['name']).to eq('Jane Doe')
      end
    end

    context 'with invalid parameters' do
      it 'renders a JSON response with errors for the new client' do
        post :create, params: { client: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
        expect(JSON.parse(response.body)).to have_key('name')
      end
    end
  end

  describe 'PATCH/PUT #update' do
    context 'with valid parameters' do
      let(:new_attributes) { { name: 'John Smith' } }

      it 'updates the requested client' do
        patch :update, params: { id: client.id, client: new_attributes }
        client.reload
        expect(client.name).to eq('John Smith')
      end

      it 'renders a JSON response with the client' do
        patch :update, params: { id: client.id, client: new_attributes }
        expect(response).to be_successful
        expect(JSON.parse(response.body)['name']).to eq('John Smith')
      end
    end

    context 'with invalid parameters' do
      it 'renders a JSON response with errors for the client' do
        patch :update, params: { id: client.id, client: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
        expect(JSON.parse(response.body)).to have_key('name')
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested client' do
      expect {
        delete :destroy, params: { id: client.id }
      }.to change(Client, :count).by(-1)
    end

    it 'returns no content' do
      delete :destroy, params: { id: client.id }
      expect(response).to have_http_status(:no_content)
    end
  end
end
