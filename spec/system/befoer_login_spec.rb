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
        visit new_user_registration_path
      end
      context "表示内容の確認" do
        it "URLが正しい" do
          expect(current_path).to eq "/users/sign_up"
        end
        it "「金融リテラシーを高めていきましょう」と表示される" do
          expect(page).to have_content "金融リテラシーを高めていきましょう"
        end
        it "nameフォームが表示されている" do
          expect(page).to have_field "user[name]"
        end
        it "emailフォームが表示されている" do
          expect(page).to have_field "user[email]"
        end
        it "passwordフォームが表示されている" do
          expect(page).to have_field "user[password]"
        end
        it "password_confirmationフォームが表示されている" do
          expect(page).to have_field "user[password_confirmation]"
        end
        it "戻るリンクボタンが表示されている" do
          expect(page).to have_link "戻る", href: root_path
        end
        it "登録ボタンが表示されている" do
          expect(page).to have_button "登録する"
        end
      end

      context "新規登録成功のテスト" do
        before do
          fill_in "user[name]", with: Faker::Lorem.characters(number: 10)
          fill_in "user[email]", with: Faker::Internet.email
          fill_in "user[password]", with: "password"
          fill_in "user[password_confirmation]", with: "password"
        end
        it "正しく登録されている" do
          expect { click_button "登録する" }.to change(User.all, :count).by(1)
        end
        it "新規登録のリダイレクト先が、新規登録したユーザーのプロフィールページになっている" do
          click_button "登録する"
          expect(current_path).to eq "/users/" + User.last.id.to_s
        end
      end
    end


    describe "ユーザーログインのテスト" do
      let(:user) { create(:user) }

      before do
        visit new_user_session_path
      end
      context "表示内容の確認" do
        it "URLが正しい" do
          expect(current_path).to eq "/users/sign_in"
        end
        it "「会員登録を既にされている方」が表示されている" do
          expect(page).to have_content "会員登録を既にされている方"
        end
        it "emailフォームが表示されている" do
          expect(page).to have_field "user[email]"
        end
        it "passwordフォームが表示されている" do
          expect(page).to have_field "user[password]"
        end
        it "ログインボタンが表示されている" do
          expect(page).to have_button "ログイン"
        end
        it "戻るリンクボタンが表示されている" do
          expect(page).to have_link "戻る", href: root_path
        end
        it "nameフォームが表示されていない" do
          expect(page).not_to have_field "user[name]"
        end
      end

      context "ログイン成功のテスト" do
        before do
          fill_in "user[email]", with: user.email
          fill_in "user[password]", with: user.password
          click_button "ログイン"
        end
        it "ログイン後のリダイレクト先が、ログインしたユーザーのプロフィールページになっている" do
          expect(current_path).to eq "/users/" + user.id.to_s
        end
      end

      context "ログイン失敗のテスト" do
        before do
          fill_in "user[email]", with: ""
          fill_in "user[password]", with: ""
          click_button "ログイン"
        end
        it "ログインに失敗したらまたログイン画面にリダイレクトされる" do
          expect(current_path).to eq "/users/sign_in"
        end
      end
    end


    describe "ログアウトのテスト" do
      let(:user) { create(:user) }

      before do
        visit new_user_session_path
        fill_in "user[email]", with: user.name
        fill_in "user[password]", with: user.password
        click_button "ログイン"
        logout_link = find_all('a')[5].native.inner_text
        # inner_text タグ内のテキストを取得する際に使用します。
        # native findメソッドで取得したオブジェクトでnativeメソッドを実行するとNokogiri::XML::Elementオブジェクトを取得できます。
        logout_link = logout_link.gsub(/\n/, '').gsub(/\A\s*/, '').gsub(/\s*\Z/, '')
        # gsubメソッドはマッチしたすべての部分を特定の文字列に置換します。
        click_link logout_link
      end

      context "ログアウト機能のテスト" do
        it "ログアウト後のリダイレクト先がトップページになっている" do
          expect(current_path).to eq "/"
        end
        it "ログアウト後のリダイレクト先にInvestmentのリンクが表示されている" do
        expect(page).to have_link "Investment", href: investment_path
        end
      end
    end


    describe "ヘッダーのテスト: ログインしているとき" do
      let(:user) { create(:user) }

      before do
        visit new_user_session_path
        fill_in "user[email]", with: user.email
        fill_in "user[password]", with: user.password
        click_button "ログイン"
      end
      context "ヘッダーの表示内容の確認" do
        it "FBAのロゴまたはただのテキストのFBAのトップページへのリンクが表示される" do
          expect(page).to have_link "", href: root_path
        end
        it "Aboutリンクが表示される" do
          expect(page).to have_link "About", href: about_path
        end
        it "My pageリンクが表示される" do
          expect(page).to have_link "My page", href: user_path(user)
        end
        it "Usersリンクが表示される" do
          expect(page).to have_link "Users", href: users_path
        end
        it "Log outリンクが表示される" do
          expect(page).to have_link "Log out", href: destroy_user_session_path
        end
      end
    end
  end
end