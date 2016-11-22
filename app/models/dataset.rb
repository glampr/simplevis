class Dataset
  include Mongoid::Document
  field :name, type: String
  field :datasource, type: String
  field :active, type: Mongoid::Boolean
  field :style, type: Hash
  field :format, type: String
end
