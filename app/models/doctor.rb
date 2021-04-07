class Doctor < User
  belongs_to :category
  validates :email, presence: true
end
