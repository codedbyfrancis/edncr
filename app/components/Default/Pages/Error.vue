<script lang="ts" setup>
defineProps({
  data: { type: Object, default: () => ({}) },
});
</script>
<template>
  <div>
    <div>
      <h1>{{ data.title }}</h1>
    </div>
    <div>{{ data.description }}</div>
  </div>
</template>
