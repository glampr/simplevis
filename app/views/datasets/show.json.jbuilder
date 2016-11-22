json.partial! "datasets/dataset", dataset: @dataset
json.feature_collection do
  json.type "FeatureCollection"
  json.features do
    json.array! @geobjects do |geobject|
      json.partial! "geobjects/geobject", geobject: geobject
    end
  end
end
