import {createRouter, createWebHistory} from 'vue-router'
import Home from '@/Home.vue'
import CurrentWeather from '@/CurrentWeather.vue'

const routes = [
  {path: '/', component: Home},
  {path: '/currentweather', component: CurrentWeather},
]

const router = createRouter({
  history: createWebHistory(),
  routes
})


app.use(router)

app.mount('#app')

export default router