<template>
  <div class="container-fluid mt-5">
    <div>
      <h2>Atforestry</h2>
    </div>
    <br>
    <GMapMap
      ref="mapRef"
      :center='center'
      :zoom='12'
      :draggable="false"
      :options="{
        zoomControl: false,
        mapTypeControl: false,
        scaleControl: false,
        streetViewControl: false,
        rotateControl: false,
        fullscreenControl: false,
        disableDefaultUi: true
      }"
      style='width:100%;  height: 400px;'
      map-type-id="satellite"
      max-zoom="12"
      min-zoom="12"
    >
      <GMapPolygon
          :paths="paths"
          @click="clickOnMap"
          :options="optionsPolygon"
      />
    </GMapMap>    
  </div>
</template>

<script>
export default {
  name: 'GoogleMap',
  mounted() {
    let map = this.$refs.mapRef
    console.log(map)
  },
  methods: {
    clickOnMap(e) {
      let lat = e.latLng.lat()
      let lng  = e.latLng.lng()
      alert(`lat: ${lat}, lng: ${lng}`)
    }
  },
  data() {
    return {
      center: { lat: 41.38, lng: 2.16 },
      paths: [
        { lat: 41.3819, lng: 2.0752 },
        { lat: 41.4398, lng: 2.1641 },
        { lat: 41.4169, lng: 2.2352 },
        { lat: 41.3195, lng: 2.1471 },
        { lat: 41.3819, lng: 2.0752 }
      ],
      optionsPolygon: {
        strokeColor: "#FF0000",
        strokeOpacity: 0.8,
        strokeWeight: 3,
        fillColor: "#FF0000",
        fillOpacity: 0.35,
      }
    }
  },  
}
</script>