class Role < ApplicationRecord
  validates :person_name, :character_name, :person_id, :movie_id, presence: true
  belongs_to :movie
  belongs_to :person
end
