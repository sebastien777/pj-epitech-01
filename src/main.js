import { createApp } from 'vue'
import { createRouter, createWebHistory } from 'vue-router'
import Home from '@/Home.vue'

import CurrentWeather from '@/CurrentWeather.vue'

const routes = [
  {path: '/', name: "home", component: Home},
  {path: '/currentweather', name: "currentweather", component: CurrentWeather},
  {path: '/currentweather/:city', name: "currentweatherParams", component: CurrentWeather},
]

const router = createRouter({
  history: createWebHistory(),
  routes
})

createApp(Home).use(router).mount('#app')

export default router
