<script setup lang="ts">
import { ref } from 'vue';

const isVisible = ref(true);
const close = () => {
  isVisible.value = false;
};
</script>

<template>
  <div v-if="isVisible" class="relative p-4 border rounded bg-white shadow">
    <button
      type="button"
      @click.stop="close"
      aria-label="Close"
      class="absolute top-2 right-2 text-gray-500 hover:text-gray-800"
    >
      &times;
    </button>
    <slot />
  </div>
</template>
