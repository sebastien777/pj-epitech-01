<script setup>
import { RouterLink, RouterView } from "vue-router";
import CurrentUser from "./components/CurrentUser.vue";

/* const user = reactive({});
function updateUser(value) {
  user.value = value;
  alert("updated");
}
provide("user", { user, updateUser }); */
</script>

<template>
  <header>
    <div class="box">
      <nav>
        <RouterLink to="/">Home</RouterLink>
        <RouterLink to="/about">About</RouterLink>
      </nav>
    </div>

    <!--     user component -->

    <div class="box">
      <!-- 

        simple state injection
        at top:
          const userId = ref(1);
        in Component: 
          exemple <CurrentUser
          :userId="userId" @update:userId="(v) => (userId = v)>" 
      -->
      <CurrentUser></CurrentUser>
    </div>
  </header>

  <RouterView />
</template>

<style scoped>
header {
  line-height: 1.5;
  max-height: 100vh;
  display: flex;
  flex-direction: row;
}
div.box {
  flex: 1;
  border: 1px #aeaeae solid;
}
nav {
  width: 100%;
  font-size: 12px;
  text-align: center;
  margin-top: 2rem;
}
</style>
