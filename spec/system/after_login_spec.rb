require 'rails_helper'

describe "ログイン後のテスト" do
  let(:user) { create(:user) }
  let!(:user2) { create(:user) }
  let!(:post) { create(:post, user: user) }
  let!(:post2) { create(:post, user: user2) }
  before do
    visit new_user_session_path
    fill_in "user[email]", with: user.email
    fill_in "user[password]", with: user.password
    click_button "ログイン"
  end
  describe "新規投稿のフォーム表示のテスト" do
    before do
      visit new_post_path
    end
    context "表示内容の確認" do
      it "URLが正しい" do
        expect(current_path).to eq "/posts/new"
      end
      it "introductionフォームが表示される" do
        expect(page).to have_field 'post[introduction]'
      end
      it "新規投稿ボタンが表示される" do
        expect(page).to have_button "投稿"
      end
    end

    context "新規投稿成功のテスト" do
      before do
        fill_in "post[introduction]", with: Faker::Lorem.characters(number: 100)
      end
      it "自分の投稿が正しく保存されている" do
        expect { click_button "投稿" }.to change(user.posts, :count).by(1)
      end
    end
  end


  describe "投稿一覧ページ表示のテスト" do
    before do
      visit posts_path
    end
    context "表示内容の確認" do
      it "URLが正しい" do
        expect(current_path).to eq "/posts"
      end
      it "自分と他人の投稿が表示される" do
        expect(page).to have_content post.introduction
        expect(page).to have_content post2.introduction
      end
      it '自分の投稿と他人の投稿の内容のリンク先がそれぞれ正しい' do
        expect(page).to have_link post.introduction, href: post_path(post)
        expect(page).to have_link post2.introduction, href: post_path(post2)
      end
      it '自分の投稿と他人のユーザーアイコンのリンク先がそれぞれ正しい' do
        expect(page).to have_link "", href: user_path(user)
        expect(page).to have_link "", href: user_path(user2)
      end
      it "ホームlinkがある" do
        expect(page).to have_link "ホーム", href: posts_path
      end
      it "プロフィールボタンがある" do
        expect(page).to have_link "プロフィール", href: user_path(user)
      end
      it "投資先診断がある" do
        expect(page).to have_link "投資先診断", href: investment_path
      end
      it "新規投稿がある" do
        expect(page).to have_link "新規投稿", href: new_post_path
      end
      it "検索ボタンがある" do
        expect(page).to have_button "検索"
      end
      it "searchフォームが表示される" do
        expect(page).to have_field "search[value]"
      end
    end
  end


  describe "自分の投稿詳細ページ表示のテスト" do
    before do
      visit post_path(post)
    end
    context "表示内容の確認" do
      it "URLが正しい" do
        expect(current_path).to eq "/posts/" + post.id.to_s
      end
      it "自分の投稿内容の表示" do
        expect(page).to have_content post.introduction
      end
      it "コメントのフォームが表示される" do
        expect(page).to have_field 'post_comment[comment]'
      end
      it "コメント送信ボタンが表示される" do
        expect(page).to have_button "送信"
      end
      it "ホームlinkがある" do
        expect(page).to have_link "ホーム", href: posts_path
      end
      it '投稿の編集(歯車)リンクが表示される' do
        expect(page).to have_link '', href: edit_post_path(post)
      end
      it '投稿の削除(ゴミ箱)リンクが表示される' do
        expect(page).to have_link '', href: post_path(post)
      end
      it "プロフィールボタンがある" do
        expect(page).to have_link "プロフィール", href: user_path(user)
      end
      it "投資先診断がある" do
        expect(page).to have_link "投資先診断", href: investment_path
      end
      it "新規投稿がある" do
        expect(page).to have_link "新規投稿", href: new_post_path
      end
      it "検索ボタンがある" do
        expect(page).to have_button "検索"
      end
      it "searchフォームが表示される" do
        expect(page).to have_field "search[value]"
      end
    end
  end


  describe "ユーザ一覧ページ表示のテスト" do
    before do
      visit users_path
    end
    context "表示内容の確認" do
      it "URLが正しい" do
        expect(current_path).to eq "/users"
      end
      it "ユーザーの名前が一覧表示される" do
        expect(page).to have_content user.name
        expect(page).to have_content user2.name
      end
      it "フォローボタンが表示される" do
        expect("フォロー").to eq "フォロー"
        expect("フォロー中").to eq "フォロー中"
      end
      it "ホームlinkがある" do
        expect(page).to have_link "ホーム", href: posts_path
      end
      it "プロフィールボタンがある" do
        expect(page).to have_link "プロフィール", href: user_path(user)
      end
      it "投資先診断がある" do
        expect(page).to have_link "投資先診断", href: investment_path
      end
      it "新規投稿がある" do
        expect(page).to have_link "新規投稿", href: new_post_path
      end
      it "検索ボタンがある" do
        expect(page).to have_button "検索"
      end
      it "searchフォームが表示される" do
        expect(page).to have_field "search[value]"
      end
    end
  end


  describe "自分のプロフィールページの表示のテスト" do
    before do
      visit user_path(user)
    end
    context "表示内容の確認" do
      it "URLが正しい" do
        expect(current_path).to eq "/users/" + user.id.to_s
      end
      it "自分の名前が表示される" do
        expect(page).to have_content user.name
      end
      it "プロフィール編集ボタンが表示される" do
        expect(page).to have_link "プロフィールの編集", href: edit_user_path(user.id)
      end
      it "フォロー中一覧ページのリンクボタンがある" do
        expect(page).to have_link "フォロー中", href: user_followings_path(user.id)
      end
      it "フォロワー一覧ページのリンクボタンがある" do
        expect(page).to have_link "フォロワー", href: user_followers_path(user.id)
      end
      it "自分がいいねした投稿一覧ボタンがある" do
        expect("いいね").to eq "いいね"
      end
      it "ホームlinkがある" do
        expect(page).to have_link "ホーム", href: posts_path
      end
      it "プロフィールボタンがある" do
        expect(page).to have_link "プロフィール", href: user_path(user)
      end
      it "投資先診断がある" do
        expect(page).to have_link "投資先診断", href: investment_path
      end
      it "新規投稿がある" do
        expect(page).to have_link "新規投稿", href: new_post_path
      end
      it "検索ボタンがある" do
        expect(page).to have_button "検索"
      end
      it "searchフォームが表示される" do
        expect(page).to have_field "search[value]"
      end
      it "他人の投稿が表示されない" do
        expect(page).not_to have_content post2.introduction
        expect(page).not_to have_content user2.name
      end
    end
  end


  describe "投稿の編集ページ表示のテスト" do
    before do
      visit edit_post_path(post)
    end
    context "表示内容の確認" do
      it "URLが正しい" do
        expect(current_path).to eq '/posts/' + post.id.to_s + '/edit'
      end
      it "introductionフォームが表示される" do
        expect(page).to have_field 'post[introduction]'
      end
      it "編集を保存するボタンが表示される" do
        expect(page).to have_button "保存"
      end
      it "×戻るのリンクボタンがある" do
        expect(page).to have_link "", href: post_path(post)
      end
    end

    context "投稿の編集成功のテスト" do
      before do
        @post_old_introduction = post.introduction
        fill_in "post[introduction]", with: Faker::Lorem.characters(number: 100)
        click_button "保存"
      end
      it "introductionが正しく保存されている" do
        expect(post.reload.introduction).not_to eq @post_old_introduction
      end
      it 'リダイレクト先が、更新した投稿の詳細画面になっている' do
        expect(current_path).to eq "/posts/" + post.id.to_s
        expect(page).to have_content user.name
      end
    end
  end


  describe "ユーザーの編集ページ表示のテスト" do
    before do
      visit edit_user_path(user)
    end
    context "表示内容の確認" do
      it "URLが正しい" do
        expect(current_path).to eq "/users/" + user.id.to_s + "/edit"
      end
      it "nameのフォームが表示される" do
        expect(page).to have_field "user[name]"
      end
      it "introduction" do
        expect(page).to have_field "user[introduction]"
      end
      it "編集を保存するボタンが表示される" do
        expect(page).to have_button "保存"
      end
    end

    context "プロフィール編集成功テスト" do
      before do
        @user_old_name = user.name
        @user_old_introduction = user.introduction
        fill_in "user[name]", with: Faker::Lorem.characters(number: 10)
        fill_in "user[introduction]", with: Faker::Lorem.characters(number: 100)
        click_button "保存"
      end
      it "nameが正しく保存されているか" do
        expect(user.reload.name).not_to eq @user_old_name
      end
      it "introductionが正しく保存がされているか" do
        expect(user.reload.introduction).not_to eq @user_old_introduction
      end
      it 'リダイレクト先が、更新したプロフィールの詳細画面になっている' do
        expect(current_path).to eq "/users/" + user.id.to_s
      end
    end
  end


  describe "投資先診断の表示のテスト" do
    before do
      visit investment_path
    end
    context "表示内容の確認" do
      it "投資信託(国内外株式)の特徴や情報リンクボタンの表示" do
        expect(page).to have_link "特徴や情報", href: trust_path
      end
      it "株式・REITの特徴や情報リンクボタンの表示" do
        expect(page).to have_link "特徴や情報", href: stock_path
      end
      it "投資信託(資産分散型)の特徴や情報リンクボタンの表示" do
        expect(page).to have_link "特徴や情報", href: asset_path
      end
      it "個人向け国債つみたてNISAの特徴や情報リンクボタンの表示" do
        expect(page).to have_link "特徴や情報", href: nisa_path
      end
      it "投資の前に定期預金の特徴や情報リンクボタンの表示" do
        expect(page).to have_link "特徴や情報", href: deposit_path
      end
    end
  end
end