class Event < ApplicationRecord
  validates :name, presence: true, length: { minimum: 2, maximum: 200, allow_blank: true }
  validates :description, presence: true, length: { minimum: 2, maximum: 500, allow_blank: true }
  validates :started_at, presence: true
  validates :finished_at, presence: true
  validate :validate_if_starts_in_the_future, on: :create

  private

  def validate_if_starts_in_the_future
    errors.add(:started_at, "must be in the future") if started_at.present? && started_at < Time.zone.now
  end
end
