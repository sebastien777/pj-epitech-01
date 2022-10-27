<script setup>
import { ref } from "vue";
const displaySelect = ref(true);
const email = ref("");
const username = ref("");

function toggle() {
  displaySelect.value = !displaySelect.value;
}
</script>
<template>
  <h3  v-if="displaySelect">Select un User</h3>
  <h3  v-else>Create un User</h3>

  <input v-model="email" placeholder="email" />
  <input v-model="username"  placeholder="username" />

  <button @click="toggle">Submit</button>

  <button @click="toggle" v-if="displaySelect">Display Create Form</button>
  <button @click="toggle" v-else>Display Select Form</button>
</template>
