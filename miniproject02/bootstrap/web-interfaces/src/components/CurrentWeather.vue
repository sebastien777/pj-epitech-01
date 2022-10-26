<template>
  <div class="weather">
    <div class="row">
      <slot name="c"></slot>
    </div>
    <div class="row">
      <slot name="t"></slot>
    </div>
    <div class="row">
      <slot name="d"></slot>
    </div>
  </div>
</template>
<style scoped>
div.weather {
  margin: 5px;
}
div.row {
  flex: 1;
  align-items: center;
  justify-content: center;
  margin-bottom: 2px;
}
</style>
