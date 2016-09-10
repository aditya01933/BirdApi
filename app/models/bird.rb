class Bird
  include Mongoid::Document
  field :name, type: String
  field :family, type: String
  field :continents, type: String
  field :added, type: DateTime, default: ->{ Date.today }
  field :visible, type: Mongoid::Boolean, default: false
end
