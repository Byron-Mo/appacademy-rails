require 'byebug'

class CatRentalRequest < ActiveRecord::Base
  validates :status, inclusion: { in: %w(PENDING APPROVED DENIED)}
  validates :cat_id, :start_date, :end_date, :status, presence: true
  validate :overlapping_approved_requests

  belongs_to :cat,
    class_name: "Cat",
    foreign_key: :cat_id,
    primary_key: :id

  def approve!
    return if self.status != "PENDING"


    self.status = "APPROVED"

    if self.save
    else

    end
  end

  private
  def overlapping_pending_requests
    overlapping_requests.select {|requests| requests.status == "PENDING" }
  end

  def overlapping_requests
    data = CatRentalRequest.find_by_sql([<<-SQL, start_date: start_date, end_date: end_date, cat_id: cat_id])
      SELECT DISTINCT
        *
      FROM
        cat_rental_requests
      WHERE
        start_date BETWEEN :start_date AND :end_date
        OR
        end_date BETWEEN :start_date AND :end_date
        AND
        id NOT NULL
        AND
        cat_id = :cat_id
    SQL
    data
  end

  def overlapping_approved_requests
    overlapping_requests.each do |request|
      if request.status == "APPROVED" && self.status == "APPROVED"
        errors[:cat_rental_requests] << "Dates cannot overlap"
        return
      end
    end
  end
end
