import { createRouter, createWebHashHistory } from "vue-router";
import CurrentWeatherVue from "../components/CurrentWeather.vue";
import HomePage from "../components/HomePage.vue";

const routes = [
  { path: "/", component: HomePage },
  { path: "/currentWeather", component: CurrentWeatherVue },
];

const router = createRouter({
  history: createWebHashHistory(),
  routes,
});
export default router;
