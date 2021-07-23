require 'rails_helper'

RSpec.describe "homeコントローラーのテスト", type: :request do
  let(:user) { create(:user) }
  let(:post) { create(:post) }
  context "#top トップページが表示されている" do
    before { get root_path }
    it "リクエストが200: OKとなること" do
      expect(response.status).to eq 200
    end
    it "トップページに「年齢を入力してください」が表示されている" do
      expect(response.body).to include "年齢を入力してください"
      expect(response.body).to_not include "|年齢を入力してください"
    end
  end
  context "#about アバウトページが表示されている" do
    before { get about_path }
    it "リクエストが200: OKとなること" do
      expect(response.status).to eq 200
    end
    it "aboutページに「About Me」が表示されている" do
      expect(response.body).to include "About Me"
      expect(response.body).to_not include "AboutMe"
    end
  end
  context "#investment 投資診断ページが表示されている" do
    before { get investment_path }
    it "リクエストが200: OKとなること" do
      expect(response.status).to eq 200
    end
    it "診断ページに「あなたの合う投資先は？」が表示されている" do
      expect(response.body).to include "あなたの合う投資先は？"
      expect(response.body).to_not include "|あなたの合う投資先は?"
    end
  end
  context "#save 貯金チェクシートページが表示されている" do
    before { get save_path }
    it "リクエストが200: OKとなること" do
      expect(response.status).to eq 200
    end
    it "もっと知りたい方のボタンが配置されている" do
      expect(response.body).to include "もっと情報を知りたい方"
      expect(response.body).to_not include "|もっと情報を知りたい方"
    end
  end
  context "診断結果の詳細ページに遷移できずリダイレクトされる" do
    before { get deposit_path }
    it "リクエストが302: リダイレクトされること" do
      expect(response.status).to eq 302
    end
  end
end