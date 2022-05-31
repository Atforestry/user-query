import { createApp } from 'vue'
import App from './App.vue'
import VueGoogleMaps from '@fawmi/vue-google-maps'

const app = createApp(App)
app.use(VueGoogleMaps, {
  load: {
      key: process.env.VUE_APP_GOOGLE_MAPS_KEY,
  },
}).mount('#app')

console.log(`GOOGLE MAPS KEY ${process.env.VUE_APP_GOOGLE_MAPS_KEY}`)