require 'rails_helper'


describe "ログイン前のテスト" do
  describe "トップページのテスト" do
    before do
      visit root_path
    end
    context "表示内容の確認" do
      it "URLが正しい" do
        expect(current_path).to eq "/"
      end
      it "Aboutリンクが表示されている" do
        expect(page).to have_link "About", href: about_path
      end
      it "Investmentリンクが表示されている" do
        expect(page).to have_link "Investment", href: investment_path
      end
      it "Sidn upリンクが表示されている" do
        expect(page).to have_link "Sign up", href: new_user_registration_path
      end
      it "Log inリンクが表示されている" do
        expect(page).to have_link "Log in", href: new_user_session_path
      end
      it "積立投資フォームが表示されているか" do
        expect(page).to have_field "age"
      end
      it "積立投資フォームのボタンが表示されているか" do
        expect(page).to have_button "結果を見る"
      end
    end


    describe "Aboutページのテスト" do
      before do
        visit about_path
      end
      context "表示の内容の確認" do
        it "URが正しいか" do
          expect(current_path).to eq "/about"
        end
      end
    end


    describe "ユーザーの新規登録テスト" do
      before do
      end
      context "表示内容の確認" do
      end
    end
  end
end