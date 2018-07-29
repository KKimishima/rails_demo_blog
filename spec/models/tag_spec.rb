require 'rails_helper'

RSpec.describe Tag, type: :model do


  describe 'バリデーション' do

    before do
      @tag = FactoryBot.build(:tag)
    end

    context 'nameのバリデーションチェック' do
      it 'nameが空だとNG' do
        @tag.name = ''
        expect(@tag.valid?).to eq(false)
      end
      it 'nameが重複するとNG ' do
        FactoryBot.create(:tag ,name: 'タグ')
        expect{(FactoryBot.create(:tag ,name: 'タグ'))}.to raise_error(ActiveRecord::RecordInvalid)
      end
    end
  end

  # describe '.page_navigation' do
  #   before do
  #      FactoryBot.create(:tag)
  #   end
  #   context 'データ件数確認' do
  #     it 'データ件数が1件の場合' do
  #       tag = Tag.page_navigation(id: 1)
  #       expect(tag.length).to eq 1
  #     end
  #   end
  # end
end
