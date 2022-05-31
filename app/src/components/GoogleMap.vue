<template>
  <div>
    <div>
      <h2>Atforestry</h2>
    </div>
    <br>
    <GMapMap
      ref="mapRef"
      :center='center'
      :zoom='12'
      :options="{
        zoomControl: false,
        mapTypeControl: false,
        scaleControl: false,
        streetViewControl: false,
        rotateControl: false,
        fullscreenControl: false,
        disableDefaultUi: true
      }"
      @click="clickOnMap"
      style='width:100%;  height: 400px;'
      map-type-id="terrain"
    />    
  </div>
</template>

<script>
export default {
  name: 'GoogleMap',
  methods: {
    clickOnMap(e) {
      let lat = e.latLng.lat()
      let lng  = e.latLng.lng()
      alert(`lat: ${lat}, lng: ${lng}`)
    }
  },
  data() {
    return {
      center: { lat: -53.08, lng: -3.16 },
    }
  },  
}
</script>