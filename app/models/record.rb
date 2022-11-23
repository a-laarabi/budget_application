class Record < ApplicationRecord
  validates :name, presence: true
  validates :amount, presence: true

  belongs_to :user
  has_many :category_records, dependent: :destroy
  has_many :categories, through: :category_records
end
