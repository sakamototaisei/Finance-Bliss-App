require 'rails_helper'


RSpec.describe 'PostCommentモデルのテスト', type: :model do
  describe 'バリデーションのテスト' do

    # factoriesで作成したダミーデータを使用します。
    let(:user) { FactoryBot.create(:user) }
    let!(:post) { build(:post, user_id: user.id) }
    let(:post_comment) { build(:post_comment, user_id: user.id) }
    let(:post_comment) { build(:post_comment, post_id: post.id) }

    # test_postを作成し、空欄で登録ができるか確認します。
    subject { post_comment.valid? }

    context 'commentカラム' do
      it '空欄でないこと' do
        post_comment.comment = ''
        is_expected.to eq false
      end
      # it '300文字以下であること: 300文字はOK' do
      #   post_comment.comment = Faker::Lorem.characters(number:300)
      #   is_expected.to eq true
      # end
      it '300文字以下であること: 301文字はOUT' do
        post_comment.comment = Faker::Lorem.characters(number:301)
        is_expected.to eq false
      end
    end
  end
  describe 'アソシエーションのテスト' do
    context 'Userモデルとの関係' do
      it 'N:1となっている' do
        expect(PostComment.reflect_on_association(:user).macro).to eq :belongs_to
      end
    end
    context 'Postモデルとの関係' do
      it 'N:1となっている' do
        expect(PostComment.reflect_on_association(:post).macro).to eq :belongs_to
      end
    end
  end
end