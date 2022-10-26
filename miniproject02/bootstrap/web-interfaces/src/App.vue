<script setup>
import CurrentWeatherVue from "./components/CurrentWeather.vue";
import { ref, onMounted } from "vue";

// reactive state
const current = ref(0);
const weathers = ref([
  {
    c: "Montauban",
    t: 12.06,
    d: "2022-10-26 11:33:00",
    i: 0,
    detail: "bkablankanjkan",
  },
  {
    c: "Beaumont-de-Lomagne",
    t: 18.46,
    d: "2022-10-26 11:33:00",
    i: 1,
    detail: "etc",
  },
  {
    c: "Lyon",
    t: 16.2,
    d: "2022-10-26 11:33:00",
    i: 2,
    detail: "mais oui mais oui",
  },
]);

// functions that mutate state and trigger updates
function changeCurrent() {
  if (current.value < weathers.value.length - 1) {
    current.value++;
  } else {
    current.value = 0;
  }
}

// lifecycle hooks
onMounted(() => {});
</script>

<template>
  <ul>
    <li v-for="weather in weathers" v-bind:key="weather.i">
      <CurrentWeatherVue>
        <template #c>in {{ weather.c }}</template>
        <template #t>{{ weather.t }}°C</template>
        <template #d>{{ weather.d }}</template>
      </CurrentWeatherVue>
    </li>
  </ul>
  <main @click="changeCurrent">
    <h1>{{ weathers[current].detail }}</h1>
    <CurrentWeatherVue>
      <template #c>in {{ weathers[current].c }}</template>
      <template #t>{{ weathers[current].t }}°C</template>
      <template #d>{{ weathers[current].d }}</template>
    </CurrentWeatherVue>
  </main>
</template>

<style scoped>
ul {
  list-style-type: none;
  display: flex;
  flex-flow: row wrap;
}
li {
  flex: 1;
  flex-grow: 1;
  display: flex;
}
main {
  display: flex;
  align-items: center;
  justify-content: center;
  flex-direction: column;
}
</style>
