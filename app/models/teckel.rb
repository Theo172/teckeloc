class Teckel < ApplicationRecord
  belongs_to :user
  has_many :reservations, dependent: :destroy
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
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

  include PgSearch::Model
  pg_search_scope :search_by_teckel_characteristic,
    against: [ :name, :species, :hair, :color, :age, :sex, :special_features, :description, :anecdote ],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }
end
