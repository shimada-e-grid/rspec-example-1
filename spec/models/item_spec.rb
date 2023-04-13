require 'rails_helper'

RSpec.describe Item, type: :model do
  let(:item){ build(:item) }

  describe 'validation' do
    describe 'name' do
      describe '必須入力' do
        context '入力されている場合' do
          it '有効' do
            expect(item).to be_valid
          end
        end
        context '未入力の場合' do
          it '無効' do
            item.name = ''
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

  describe '#sample' do
    before do
      item.sample
    end
    it 'nameがサンプルであること' do
      expect(item.name).to eq 'サンプル'
    end
    it '有効であること' do
      expect(item).to be_valid
    end
  end
end
