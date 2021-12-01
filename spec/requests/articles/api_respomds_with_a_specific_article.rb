RSpec.describe "GET/api/articles/:id" do
    describe "successfully" do
        let!(:article) {create(:article, title: "Latest News", content: "And mind blowing content")}

        before do
            get "/api/articles/#{article.id}"
        end

        it "is expected to return a 200 status" do
            expect(response).to have_http_status 200
        end

        it "is expected to return the requested articles title" do
            expect(response_json["title"]).to eq "Latest News" 
        end

        it "is expected to return the requested articles title" do
            expect(response_json["content"]).to eq "And mind blowing content" 
        end
    end
end
