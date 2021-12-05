describe 'POST/api/articles' do
  subject { response }
  let(:user) { create(:user) }
  let(:creadentials) { user.create_new_auth_token }

  describe 'with valid params' do
    describe 'as an ananomys user' do
      before do
        post '/api/articles',
             params: {
               article: {
                 title: 'My awesome article',
                 content: 'My text yada yada'
               }
             }, headers: nil
      end
      it { is_expected.to have_http_status 401 }
    end

    describe 'as an authorized user' do
      before do
        post '/api/articles',
             params: {
               article: {
                 title: 'My awesome article',
                 content: 'My text yada yada'
               }
             }, headers: creadentials
      end
      it 'is expected to respond with status 201' do
        expect(subject.status).to eq 201
      end

      # it {is_expected.to have_http_status :created}

      it 'is expected to return the new object with a title' do
        expect(response_json['article']['title']).to eq 'My awesome article'
      end

      it 'is expected to return the new object with a conent' do
        expect(response_json['article']['content']).to eq 'My text yada yada'
      end
    end
  end

  describe 'unsuccessfully' do
    describe 'due to missing params' do
      before { post '/api/articles', params: {}, headers: creadentials }

      it { is_expected.to have_http_status 422 }

      it 'is expected to respond with an error message' do
        expect(response_json['message']).to eq 'Missing params'
      end
    end
    describe 'due to missing title' do
      before do
        post '/api/articles',
             params: {
               article: {
                 content: 'My text yada yada'
               }
             }, headers: creadentials
      end
      it { is_expected.to have_http_status 422 }

      it 'is expected to respond with an error message' do
        expect(response_json['message']).to eq 'Title can\'t be blank'
      end
    end
  end
end
