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

      describe '最大15文字' do
        context '15文字の場合' do
          it '有効' do
            item.name = 'a'*15
            expect(item).to be_valid
          end
        end
        context '16文字の場合' do
          it '無効' do
            item.name = 'a'*16
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
      expect(item.name).to eq 'これはサンプルの備品です！'
    end
    it 'バリデーションが有効であること' do
      # 実行結果
      expect(item).to be_valid
    end
  end
end
