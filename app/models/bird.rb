class Bird
  include Mongoid::Document
  # fields
  field :name, type: String
  field :family, type: String
  field :continents, type: String
  field :added, type: DateTime, default: ->{ Date.today }
  field :visible, type: Mongoid::Boolean, default: false

  # validations
  validates :name, :family, :continents, presence: :true

end
