class Item < ApplicationRecord
  belongs_to :user, optional: true

  validates :name, presence: true, length: { maximum: 10 }
  validates :note, presence: true, length: { maximum: 20 }
end
