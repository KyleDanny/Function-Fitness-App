class Booking < ApplicationRecord
  # enum status: [:pending, :accepted, :declined, :completed]
  STATUS = %w(pending accepted declined completed)

  belongs_to :user
  belongs_to :personalized_trainer
  has_many :review

  validates :status, inclusion: { in: STATUS }
  validates :fee, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
  validates :start_date, :end_date, presence: true
  validate :end_date_after_start_date
  #validate :start_date_after_today
  # validates_length_of :goal, minimum: 6

  def booked_date_range
    { from: :start_date, to: :end_date }
  end

  private

  def end_date_after_start_date
    return if end_date.blank? || start_date.blank?

    if end_date < start_date
      errors.add(:end_date, "must be after the start date")
    end
  end



end
