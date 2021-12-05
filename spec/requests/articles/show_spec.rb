RSpec.describe 'GET/api/articles/:id' do
  describe 'successfully' do
    let!(:article) { create(:article, title: 'Latest News', content: 'And mind blowing content') }

    before do
      get "/api/articles/#{article.id}"
    end

    it 'is expected to return a 200 status' do
      expect(response).to have_http_status 200
    end

    it 'is expected to return the requested articles title' do
      expect(response_json['article']['title']).to eq 'Latest News'
    end

    it 'is expected to return the requested articles title' do
      expect(response_json['article']['content']).to eq 'And mind blowing content'
    end
  end

  # describe "unsuccessfully with invalid id" do
  #     before do
  #         get "api/articles/abc"
  #     end

  #     it "is expected to return a 404 status" do
  #     expect(response).to have_http_status 404
  #     end

  #     it "is expected to return an error message" do
  #         expect(response_json['message']).to eq "Unfortunately we can not find the article you are looking for"
  #     end
  # end
end
