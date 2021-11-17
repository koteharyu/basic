require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'validations' do
    it 'images are neccessary' do
      post = build(:post, images: nil)
      post.valid?
      expect(post.errors[:images]).to include('を入力してください')
    end

    it 'body is neccessary' do
      post = build(:post, body: nil)
      post.valid?
      expect(post.errors[:body]).to include('を入力してください')
    end

    it 'body is less than 1000 charators' do
      post = build(:post, body: "a"*1001)
      post.valid?
      expect(post.errors[:body]).to include('は1000文字以内で入力してください')
    end
  end


  describe 'scope' do
    describe 'body_contain' do
      let!(:post) { create(:post, body: 'model spec') }
      subject { Post.body_contain('spec') }
      it { is_expected.to include post}
    end
  end
end
