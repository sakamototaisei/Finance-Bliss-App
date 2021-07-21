require 'rails_helper'

RSpec.describe "postコントローラーのテスト", type: :request do
  let(:user) { create(:user) }
  let(:post) { create(:post) }
  # describe "ログイン済み" do
  #   before do
  #     sign_in user
  #   end
  #   context "マイページが正しく表示される" do
  #     before do
  #       get user_path
  #     end
  #     it "リクエストは200 OKとなること" do
  #       # リクエスト成功を表す200が返ってきたか確認する。
  #       expect(response.status).to eq 200
  #     end
  #     it "マイページに「プロフィールの編集」が表示されていること" do
  #       expect(response.body).to include("プロフィールの編集")
  #     end
  #   end
  # end
  # describe "非ログイン" do
  #   context "投稿一覧ページへ遷移されない" do
  #     before do
  #       get posts_path
  #     end
  #     it "リクエストは401 OKとなること" do
  #       expect(response.status).to eq 401
  #     end
  #   end
  # end
end