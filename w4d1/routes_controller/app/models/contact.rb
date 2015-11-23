class Contact < ActiveRecord::Base
  validates :user_id, uniqueness: {:scope => :email}
  validates :name, :email, :user_id, presence: true

  belongs_to :owner,
    class_name: "User",
    foreign_key: :user_id,
    :primary_key: :id

end
