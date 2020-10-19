require 'rails_helper'

RSpec.describe 'Users', type: :request do
  # initialize test data - creating 10 users
  let!(:users) { create_list(:user, 10) }

  # initialize test data - creating 10 posts
  let!(:posts) { create_list(:post, :with_user, 10) }
  let(:user_id) { users.first.id }


  describe 'GET users#index' do
    # before { allow(@request).to receive(:authenticate_request!).and_return(true) }
    # before {
    #   user = FactoryBot.create(:user)
    #   log_in(user)
    #   puts("BEFORE USER: #{user.email}")}

    before { get '/api/v1/users' }

    it 'should get index and return status code 200' do
      expect(response).to have_http_status(200)
    end

    it 'should return users' do
      expect(json).not_to be_empty
      expect(json['users'].size).to eq(10)
    end
  end

  describe 'GET users#show' do
    before { get '/api/v1/profile' }

    context 'when the user exists' do
      it 'returns status 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns user profile' do
        puts(json)
        expect(json).not_to be_empty
      end

    end



  end

end
