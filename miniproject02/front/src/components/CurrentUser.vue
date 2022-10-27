<script setup>
import { ref } from "vue";
import { user } from "../user";

// state
const displaySelectUser = ref(true);
const email = ref("raoul@mail.pt");
const username = ref("CoolRaoul33");
const notify = ref("");

// function
async function select() {
  notify.value = await user.select(email.value, username.value);
}
async function create() {
  notify.value = await user.create(email.value, username.value);
}
async function deleteUser() {
  notify.value = await user.delete();
}
async function empty() {
  notify.value = await user.empty();
}
</script>

<template>
  <div v-if="user.isSetted">
    <!-- SELECTED -->
    <div>username: {{ user.current.username }} ({{ user.current.id }})</div>
    <button @click="deleteUser">Delete</button>
    <button @click="empty">find another</button>
  </div>
  <div v-else>
    <!-- UNSELECTED -->
    <h3 v-if="displaySelectUser">Select un User</h3>
    <h3 v-else>Create un User</h3>

    <input v-model="email" placeholder="email" />
    <input v-model="username" placeholder="username" />

    <button @click="select" v-if="displaySelectUser">Select</button>
    <button @click="create" v-else>Create</button>

    <button
      @click="() => (displaySelectUser = !displaySelectUser)"
      v-if="displaySelectUser"
    >
      Display Create Form
    </button>
    <button @click="() => (displaySelectUser = !displaySelectUser)" v-else>
      Display Select Form
    </button>
  </div>
  <em>
    {{ notify }}
  </em>
</template>
