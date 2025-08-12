<script setup lang="ts">
import { ref } from 'vue';

const isVisible = ref(true);
const close = () => {
  isVisible.value = false;
};
</script>

<template>
  <div
    v-if="isVisible"
    class="flex items-center justify-between px-4 py-2 bg-blue-100 border-b border-blue-300 text-blue-900 relative"
  >
    <div class="flex-1">
      <slot />
    </div>
    <button
      type="button"
      @click.stop="close"
      aria-label="Close bar"
      class="ml-4 text-blue-700 hover:text-blue-900 text-xl font-bold focus:outline-none"
    >
      &times;
    </button>
  </div>
</template>
