import { createApp } from 'vue'
import App from './App.vue'
import VueGoogleMaps from '@fawmi/vue-google-maps'
import axios from 'axios'
import VueAxios from 'vue-axios'

import BootstrapVue3 from 'bootstrap-vue-3'
import "bootstrap/dist/css/bootstrap.min.css"
import "bootstrap"

const app = createApp(App)
app.use(BootstrapVue3)
app.use(VueGoogleMaps, {
  load: {
      key: process.env.VUE_APP_GOOGLE_MAPS_KEY,
  },
}).mount('#app')
app.use(VueAxios, axios)
