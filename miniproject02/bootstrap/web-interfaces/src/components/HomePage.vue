<script setup>
import { ref } from "vue";
import { useRouter } from "vue-router";

import weathers from "../weathers";

const router = useRouter();

function changePage() {
  router.push("currentWeather?index=" + current.value);
}
// reactive state
const current = ref(0);
</script>
<template>
  <main>
    <div class="box">
      <h2>Ou ?</h2>
      <select v-model="current">
        <option
          v-for="weather in weathers"
          v-bind:key="weather.i"
          v-bind:value="weather.i"
        >
          {{ weather.c }}
        </option>
      </select>
      <button @click="changePage">Search</button>
    </div>
  </main>
</template>
<style scoped>
main {
  display: flex;
  align-items: center;
  justify-content: center;
  flex-direction: column;
}
div.box {
  display: flex;
  align-items: center;
  justify-content: center;
  flex-direction: column;
  background: #eee;
  margin-top: 10px;
  width: 95vw;
  padding: 5px;
}
</style>
