describe 'GET/api/articles' do 

    subject { response }
    let!(:article) {create(:article, title: "My own title", content: "Lorem ipsum..")}

    before do
        get "/api/articles/#{article.id}"
    end

    it 'is expected to respond with status 200' do
        expect(subject.status).to eq 200
    end

    it 'is expected to return all articles' do
        expect(response_json.size).to eq 5
    end

    it 'is expected to respond with the right title' do
        expect(response_json["title"]).to eq "My own title"
    end 

    it 'is expected to respond with the requested article content' do
        expect(response_json["content"]).to eq "Lorem ipsum.."
    end
end
