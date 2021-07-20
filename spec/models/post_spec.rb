require 'rails_helper'


RSpec.describe 'Postモデルのテスト', type: :model do
  describe 'バリデーションのテスト' do
    
    # factoriesで作成したダミーデータを使用します。
    let(:user) { FactoryBot.create(:user) }
    let(:post) { build(:post, user_id: user.id) }
    
    # test_postを作成し、空欄で登録ができるか確認します。
    subject { test_post.valid? }
    let(:test_post) { post }


    context 'introductionカラム' do
      it '300文字以下であること: 300文字はOK' do
        post.introduction = Faker::Lorem.characters(number:300)
        expect(post.valid?).to eq true
      end
      it '300文字以下であること: 301文字はNG' do
        post.introduction = Faker::Lorem.characters(number:301)
        expect(post.valid?).to eq false
    end
  end
end
  describe 'アソシエーションのテスト' do
    context 'userモデルとの関係' do
      it 'N:1となっている' do
        expect(Post.reflect_on_association(:user).macro).to eq :belongs_to
      end
    end
    context 'PostCommentモデルとの関係' do
      it '1:Nとなっている' do
        expect(Post.reflect_on_association(:post_comments).macro).to eq :has_many
      end
    end
  end
end