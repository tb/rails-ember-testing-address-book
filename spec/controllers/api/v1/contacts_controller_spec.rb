require 'spec_helper'

describe Api::V1::ContactsController do
  let(:contact_attributes) { attributes_for(:contact) }

  describe '#index' do
    let!(:contact) { create(:contact) }
    let!(:contact_2) { create(:contact) }
    let(:call_request) { get :index, format: :json }
    before { call_request }

    it 'response status is 200' do
      expect(response.status).to eq(200)
    end

    it 'responds with contacts' do
      expect(json).to have_key('contacts')
      expect(json['contacts'].size).to eq(2)
    end
  end

  describe '#show' do
    let!(:contact) { create(:contact) }
    let(:call_request) { get :show, id: contact.id, format: :json }
    before { call_request }

    it 'response status is 200' do
      expect(response.status).to eq 200
    end

    it 'responds with contact' do
      expect(json).to have_key 'contact'
    end
  end

  describe '#create' do
    let(:call_request) { post :create, contact: contact_attributes, format: :json  }

    it 'creates contact' do
      expect{call_request}.to change{Contact.count}.by 1
    end

    it 'response status is 200' do
      call_request
      expect(response.status).to eq 200
    end

    it 'responds with contact' do
      call_request
      expect(json).to have_key 'contact'
    end

    context 'validation fails' do
      let(:contact_attributes) { attributes_for(:contact, first_name: '') }

      it 'creates contact' do
        expect{call_request}.to change{Contact.count}.by 0
      end

      it 'response status is 422' do
        call_request
        expect(response.status).to eq(422)
      end

      it 'response with errors' do
        call_request
        expect(json).to have_key('errors')
      end
    end
  end

  describe '#update' do
    let!(:contact) { create(:contact) }
    let(:contact_attributes) { attributes_for(:contact, first_name: 'Bob') }
    let(:call_request) { put :update, id: contact.id, contact: contact_attributes, format: :json }

    it 'updates name' do
      expect{call_request}.to change{contact.reload.first_name}.to 'Bob'
    end

    context 'validation fails' do
      let(:contact_attributes) { attributes_for(:contact, first_name: '') }

      it 'does not update name' do
        expect{call_request}.not_to change{contact.reload.first_name}.to 'Bob'
      end

      it 'response status is 422' do
        call_request
        expect(response.status).to eq(422)
      end

      it 'response with errors' do
        call_request
        expect(json).to have_key('errors')
      end

      it 'response errors includes first_name' do
        call_request
        expect(json['errors'].keys).to include 'first_name'
      end
    end
  end

  describe '#destroy' do
    let!(:contact) { create(:contact) }
    let(:call_request) { delete :destroy, id: contact.id, format: :json }

    it 'removes contact' do
      expect{call_request}.to change{Contact.count}.by -1
    end

    it 'responds with contact' do
      call_request
      expect(response.status).to eq(204)
    end
  end
end
