require 'rails_helper'

RSpec.describe Item, type: :model do
  # 変数を宣言
  let(:item){ build(:item) }

  # バリデーションのテスト
  describe 'validation' do
    # 名前カラム
    describe 'name' do
      # 条件
      describe '必須入力' do
        context '入力されている場合' do
          it '有効' do
            # 実行結果
            expect(item).to be_valid
          end
        end
        context '未入力の場合' do
          it '無効' do
            item.name = ''
            # 実行結果
            expect(item).to be_invalid
          end
        end
      end

      describe '最大10文字' do
        context '10文字の場合' do
          it '有効' do
            item.name = 'a'*10
            expect(item).to be_valid
          end
        end
        context '11文字の場合' do
          it '無効' do
            item.name = 'a'*11
            expect(item).to be_invalid
          end
        end
      end
    end
  end

  # sampleメソッドのテスト
  describe '#sample' do
    # テスト毎に実行する処理
    before do
      item.sample
    end
    it 'nameがサンプルであること' do
      # 実行結果
      expect(item.name).to eq 'サンプル'
    end
    it 'バリデーションが有効であること' do
      # 実行結果
      expect(item).to be_valid
    end
  end
end
