<script setup>
import { ref } from "vue";
import Selected from "./Selected.vue";
import UnSelected from "./UnSelected.vue";
const isUserSelected = ref(false);
defineProps(["userId"]);
defineEmits(["update:userId"]);
</script>
<template>
  CONTACT {{ userId }}
  <button @click="$emit('update:userId', userId + 1)">bbh</button>
  <Selected v-if="isUserSelected"></Selected>
  <UnSelected v-if="!isUserSelected"></UnSelected>
</template>
