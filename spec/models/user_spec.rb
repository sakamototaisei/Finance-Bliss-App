require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'バリデーションのテスト' do

    # factoriesで作成したダミーデータを使用します。
    let(:user) { FactoryBot.create(:user) }
    let!(:post) { build(:post, user_id: user.id) }

    subject { user.valid? }


    context 'nameカラム' do
      it '空欄でないこと' do
        user.name = ''
        is_expected.to eq false
      end
      it '20文字以下であること: 20文字はOK' do
        user.name = Faker::Lorem.characters(number:20)
        is_expected.to eq true
      end
      it '20文字以下であること: 21文字はOUT' do
        user.name = Faker::Lorem.characters(number:21)
        is_expected.to eq false
      end
    end
    context 'introductionカラム' do
      it '160文字以下であること: 160文字はOK' do
        user.introduction = Faker::Lorem.characters(number:160)
        is_expected.to eq true
      end
      it '160文字以下であること: 161文字はOUT' do
        user.introduction = Faker::Lorem.characters(number:161)
        is_expected.to eq false
      end
    end
  end
  describe 'アソシエーションのテスト' do
    context 'postモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:posts).macro).to eq :has_many
      end
    end
    context 'post_commentsモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:post_comments).macro).to eq :has_many
      end
    end
    context 'likesモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:likes).macro).to eq :has_many
      end
    end
    context 'relationshipsモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:relationships).macro).to eq :has_many
      end
    end
  end
end