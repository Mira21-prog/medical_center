class Doctor < User
  belongs_to :category
  validates :email, presence: true
  has_many :appointments
  has_many :patients, through: :appointments
end
