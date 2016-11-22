class Geobject
  include Mongoid::Document
  include Mongoid::Attributes::Dynamic

  store_in database: "datasets"
end
