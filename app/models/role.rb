class Role < ApplicationRecord
  validates :person_name, :character_name, :movie_id, presence: true
  belongs_to :movie
  belongs_to :person, optional: true
end
