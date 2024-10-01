class Event < ApplicationRecord
  validates :name, presence: true, length: { minimum: 2, maximum: 200, allow_blank: true }
  validates :description, presence: true, length: { minimum: 2, maximum: 500, allow_blank: true }
  validates :started_at, presence: true
  validates :finished_at, presence: true
end
