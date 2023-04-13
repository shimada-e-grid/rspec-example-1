class Item < ApplicationRecord
  belongs_to :user, optional: true

  validates :name, presence: true, length: { maximum: 10 }
  validates :note, presence: true, length: { maximum: 20 }

  def sample
    self.name = 'サンプル'
    self.note = 'サンプル'
  end
end
