<template>
  <div id="app">
    <div class="container">
      <div class="row"><div class="col-12">&nbsp;</div></div>
      <div class="row">
        <div class="col-12">
          <img src="./assets/Atforestry_logo.png" height="100"/>
        </div>
      </div>
      <div class="row"><div class="col-12">&nbsp;</div></div>
      <div class="row">
        <div class="col-8">
          <GoogleMap />
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
                  <img src="./assets/placeholder-image.jpeg" width="100%" class="border" />
                  <div class="p-1 border bg-light">Date</div>
                </div>
                <div class="col-6 text-center">
                  <img src="./assets/placeholder-image.jpeg" width="100%" class="border" />                  
                  <div class="p-1 border bg-light">Date</div>
                </div>
              </div>
              <div class="row"><div class="col-12">&nbsp;</div></div>
              <div class="row">
                <div class="col-12">
                    <div class="p-3 border bg-light">Prediction result.</div>
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
  components: {
    GoogleMap
  }
}
</script>
