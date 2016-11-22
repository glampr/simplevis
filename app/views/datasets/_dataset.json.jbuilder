json.extract! dataset, :id, :name, :datasource, :active, :style, :format, :created_at, :updated_at
json.url dataset_url(dataset, format: :json)