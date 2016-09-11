class Bird
  include Mongoid::Document
  # fields
  field :name, type: String
  field :family, type: String
  field :continents, type: Array, default: []
  field :added, type: Date, default: -> { Date.today }
  field :visible, type: Mongoid::Boolean, default: false

  # validations
  validates :name, :family, :continents, presence: :true

  # scopes
  # To find all visible birds only.
  scope :visible, -> { where(visible: true) }
end
