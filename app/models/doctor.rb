class Doctor < User
  belongs_to :category
  validates :email, presence: true
  has_many :appointments, dependent: :destroy
  has_many :patients, through: :appointments
  has_one_attached :attachment
  scope :searcher, lambda {|params|
   search_scope = Doctor.all
   search_scope = search_scope.filters(params[:filter]) if params[:filter].present?
   search_scope
 }
 scope :filters, lambda { |parameter|
     where(category: parameter)
 }

end
