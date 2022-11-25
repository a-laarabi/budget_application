class Category < ApplicationRecord
  validates :name, presence: true
  validates :icon, presence: true

  belongs_to :user
  has_one_attached :icon
  has_many :category_records, dependent: :destroy
  has_many :records, through: :category_records, dependent: :destroy
end
