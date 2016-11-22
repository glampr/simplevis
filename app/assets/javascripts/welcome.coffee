# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->

  console.log 'Page loaded!'

  map = L.map('mapid').setView([40.75, -74.00], 12)

  # OSM Tile layer
  osm = new L.TileLayer('http://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
    minZoom: 4,
    maxZoom: 16,
    attribution: 'Map data © <a href="http://openstreetmap.org">OpenStreetMap</a> contributors'
  })
  map.addLayer(osm)

  $('.btn-load-dataset').click((event) ->
    event.preventDefault()

    button = $(this)
    datasetId = button.attr('id')
    console.log "Clicked dataset: #{datasetId}"

    # Load geobjects of dataset
    $.getJSON("/datasets/#{datasetId}.json", (data) ->
      console.log data
      L.geoJSON(data.feature_collection, {
        onEachFeature: (feature, layer) ->
          if (feature.properties && feature.properties)
            layer.bindPopup(JSON.stringify(feature.properties, null, 2).replace(/\n/g, '<br>'));
      }).addTo(map);
    )
  )
