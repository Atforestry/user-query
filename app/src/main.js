import Vue from 'vue'
import * as VueGoogleMaps from 'vue2-google-maps'
import App from './App.vue'

Vue.config.productionTip = false

Vue.use(VueGoogleMaps, {
  load: {
    key: 'AIzaSyC_8Itm1gZjpl7-6guyIomDCuIqptqY4M4',
  }
});

new Vue({
  render: h => h(App),
}).$mount('#app')