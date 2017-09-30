class Role < ApplicationRecord
  validates :person_name, :character_name, :person_id, :movie_id, presence: true
  validates :movie_id, :person_id, numericality:{ only_integer: true,}
end
