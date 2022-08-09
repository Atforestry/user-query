<template>
  <div id="app">
    <div class="container">
      <div class="row"><div class="col-12">&nbsp;</div></div>
      <div class="row">
        <div class="col-12">
          <img src="./assets/atforestry-logo.png" height="100"/>
        </div>
      </div>
      <div class="row"><div class="col-12">&nbsp;</div></div>
      <div class="row">
        <div class="col-8">
          <GoogleMap @onError="errorMesage" @onClick="clickOnMap" @onLoading="onLoading"/>
          <p></p>
          <b-alert
            dismissible
            variant="danger"
            v-model="showDismissibleAlert" 
          >
            {{ errorMessage }}
          </b-alert>
          <b-alert
            dismissible
            variant="primary"
            v-model="showLoading" 
          >
           Loading...
          </b-alert>
        </div>
        <div class="col-4">
          <div class="card">
            <div class="card-body">
              <div class="row">
                <div class="col-12">
                  <h5 class="card-title">Instructions</h5>
                  <p class="card-text">Click inside the highlighted area to query if it's experiencing deforestation.</p>
                </div>
              </div>
              <div class="row"><div class="col-12">&nbsp;</div></div>
              <div class="row">
                <div class="col-6 text-center">
                  <img :src="getImagePast" width="150" height="125" class="border" />
                  <div class="p-1 border bg-light" style="width: 150px; margin: 0 auto;">{{datePredictionPast}}</div>
                </div>
                <div class="col-6 text-center">
                  <img :src="getImagePresent" width="150" height="125" class="border" />                  
                  <div class="p-1 border bg-light" style="width: 150px;margin: 0 auto">{{datePredictionPresent}}</div>
                </div>
              </div>
              <div class="row"><div class="col-12">&nbsp;</div></div>
              <div class="row">
                <div class="col-12">
                    <div :class="{isDeforested: isDeforested}" class="p-3 border bg-light">{{ result }}</div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    
  </div>
</template>

<script>
import GoogleMap from './components/GoogleMap.vue'

export default {
  name: 'App',
  data() {
    return {
      errorMessage: '',
      showDismissibleAlert: false,
      showLoading: false,
      result: 'Prediction result',
      imagePast: null,
      imagePresent: null,
      datePredictionPast: 'Date',
      datePredictionPresent: 'Date',
      isDeforestation: false
    }
  },
  components: {
    GoogleMap
  },
  computed: {
    getImagePast() {
      return this.imagePast
    },
    getImagePresent() {
      return this.imagePresent
    }
  },
  mounted() {
                      
    this.imagePast = 'https://storage.googleapis.com/atforestry-model-tracker/frontend/placeholder-image.jpeg'
    this.imagePresent = 'https://storage.googleapis.com/atforestry-model-tracker/frontend/placeholder-image.jpeg'
  },
  methods: { 
    errorMesage(error) {
      this.showLoading = false
      const errorCode = error.response.status
      if (errorCode === 404) {
        this.errorMessage = 'No data found for this location.'
      } else {
        this.errorMessage = 'An error occurred.'
      }
      this.showDismissibleAlert = true
    },
    clickOnMap(event) {
      this.showLoading = false
      this.result = (event.isDeforested) ? 'Deforestation' : 'No deforestation'
      this.isDeforested = event.isDeforested
      this.imagePast = event.imagePast
      this.imagePresent = event.imagePresent
      this.showDismissibleAlert = false
      this.datePredictionPast = event.datePredictionPast
      this.datePredictionPresent = event.datePredictionPresent
    },
    onLoading() {
      this.showLoading = true
    }
  }
}
</script>
<style scoped>
.isDeforested{
    color: red;
}

</style>