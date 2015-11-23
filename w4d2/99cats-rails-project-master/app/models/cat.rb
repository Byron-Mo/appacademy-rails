class Cat < ActiveRecord::Base
  COLOR = ["Black", "Brown", "Orange", "White"]
  validates :color, inclusion: { in: COLOR}
  validates :sex, inclusion: { in: %w(M F)}
  validates :birth_date, :color, :name, :sex, presence: true

  has_many :cat_rental_requests, dependent: :destroy,
    class_name: "CatRentalRequest",
    foreign_key: :cat_id,
    primary_key: :id
end
