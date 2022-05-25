class Teckel < ApplicationRecord
  belongs_to :user
  # ouvrir un ticket :
  # belongs_to :owner, class_name: "User", foreign_key: :user_id
  validates :name, presence: true
  validates :species, presence: true
  validates :hair, presence: true
  validates :age, presence: true, numericality: { only_integer: true }
  validates :sex, presence: true
  validates :color, presence: true
  validates :address, presence: true
  validates :price, presence: true, numericality: { only_integer: true }

  has_one_attached :photo
  validates :photo, presence: true
end
