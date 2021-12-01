describe 'GET/api/articles' do
  subject { response }
  let!(:article) do
    create(:article, title: 'My own title', content: 'Lorem ipsum..')
  end

  before { get '/api/articles' }

  it 'is expected to respond with status 200' do
    expect(subject.status).to eq 200
  end

  it 'is expected to return all articles' do
    expect(response_json.size).to eq 1
  end

  it 'is expected to respond with the right title' do
    expect(response_json['articles'].first['title']).to eq 'My own title'
  end

  it 'is expected to respond with the requested article content' do
    expect(response_json['articles'].first['content']).to eq 'Lorem ipsum..'
  end
end
