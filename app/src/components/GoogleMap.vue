<template>
  <GMapMap
    ref="mapRef"
    :center='center'
    :zoom='8'
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
    style='width:100%;  height: 375px;'
    map-type-id="satellite"
    max-zoom="8"
    min-zoom="8"
  >
    <GMapPolygon
        :paths="paths"
        @click="clickOnMap"
        :options="optionsPolygon"
    />
  </GMapMap> 
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
      let apiurl = `http://${process.env.VUE_APP_API_URL}/v1/is-deforested`

      if (this.demoIndex < this.demoPoints.length) {
        lat = this.demoPoints[this.demoIndex].lat
        lng = this.demoPoints[this.demoIndex].lng
        this.demoIndex++
      }

      this.$emit('onLoading')

      this.axios.get(apiurl,
      { params: {
        lat: lat,
        lng: lng
      }}).then((response) => {
        this.$emit('onClick', {
          isDeforested: response.data.deforestation,
          imagePast: response.data.imagePast,
          imagePresent: response.data.imagePresent,
          datePredictionPast: response.data.datePredictionPast,
          datePredictionPresent: response.data.datePredictionPresent
        })

      }).catch((error) => {
        this.$emit("onError", error)
      })

    }
  },
  data() {
    return {
      center: { lng: -52.5, lat: -3.5 },
      demoIndex: 0,
      demoPoints: [
        {
          lat: -3.5222672296528335,
          lng: -52.60829050093891
        },
        {
          lat: -3.4803517783673135,
          lng: -52.411114610731616
        }
      ],
      paths: [
        // -53,-4,-52,-3
        { lng: -53, lat: -4 },
        { lng: -53, lat: -3 },
        { lng: -52, lat: -3 },
        { lng: -52, lat: -4 },
        { lng: -53, lat: -4 }
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