# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->

  console.log 'Page loaded!'

  if $('#mapid').length > 0

    map = L.map('mapid').setView([40.75, -74.00], 12)

    # OSM Tile layer
    osm = new L.TileLayer('http://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
      minZoom: 4,
      maxZoom: 16,
      attribution: 'Map data © <a href="http://openstreetmap.org">OpenStreetMap</a> contributors'
    })
    map.addLayer(osm)

    geojsonMarkerOptions = {
      radius: 8,
      fillColor: "#ff7800",
      weight: 4,
      opacity: 1,
      fillOpacity: 0.8
    }

    $('.btn-load-dataset').click((event) ->
      event.preventDefault()

      button = $(this)
      datasetId = button.attr('id')
      console.log "Clicked dataset: #{datasetId}"

      # Load geobjects of dataset
      $.getJSON("/datasets/#{datasetId}.json", (data) ->
        console.log data
        L.geoJSON(data.feature_collection, {
          style: data.style,
          pointToLayer: (feature, latlng) ->
            L.circleMarker(latlng, geojsonMarkerOptions)
          ,
          onEachFeature: (feature, layer) ->
            if (feature.properties && feature.properties)
              popupContent = if feature.properties.description then feature.properties.description else JSON.stringify(feature.properties, null, 2).replace(/\n/g, '<br>')
              layer.bindPopup(popupContent)
        }).addTo(map);
      )
    )
