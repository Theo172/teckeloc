class Teckel < ApplicationRecord
  belongs_to :user
  # ouvrir un ticket :
  # belongs_to :owner, class_name: "User", foreign_key: :user_id
end
