class Item < ApplicationRecord
  belongs_to :user, optional: true

  validates :name, presence: true, length: { maximum: 15 }
  validates :note, presence: true, length: { maximum: 20 }

  def sample
    self.name = 'これはサンプルの備品です！'
    self.note = 'これはサンプルの備品です！'
  end
end
