class Event < ApplicationRecord
  # optional: true é necessário pq o evento pode não ter categoria, eu já havia cadastrado 2 sem categoria.
  belongs_to :category, optional: true


  validates :name, presence: true, length: { minimum: 2, maximum: 200, allow_blank: true }
  validates :description, presence: true, length: { minimum: 2, maximum: 500, allow_blank: true }
  validates :started_at, presence: true
  validates :finished_at, presence: true
  validate :validate_if_starts_in_the_future, on: :create
  validate :validate_if_finished_at_is_after_started_at

  private

  def validate_if_finished_at_is_after_started_at
    errors.add(:finished_at, "must be after started_at") if started_at.present? && finished_at.present? && finished_at < started_at
  end

  def validate_if_starts_in_the_future
    errors.add(:started_at, "must be in the future") if started_at.present? && started_at < Time.zone.now
  end
end
