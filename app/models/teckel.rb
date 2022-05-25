class Teckel < ApplicationRecord
  belongs_to :user
  # ouvrir un ticket :
  # belongs_to :owner, class_name: "User", foreign_key: :user_id

  SPECIES = %w[Miniature Standard Kanichen]
  HAIR = %w[Short Long]
  SEX = %w[Female Male]

  validates :name, presence: true
  validates :species, presence: true, inclusion: { in: SPECIES }
  validates :hair, presence: true, inclusion: { in: HAIR }
  validates :age, presence: true, numericality: { only_integer: true }
  validates :sex, presence: true, inclusion: { in: SEX }
  validates :color, presence: true
  validates :address, presence: true
  validates :price, presence: true, numericality: { only_integer: true }

  has_one_attached :photo
  validates :photo, presence: true
end
