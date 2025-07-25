<script setup lang="ts">
import { ref, watch } from 'vue';

const min = 14;
const max = 24;
const defaultSize = 16;

const fontSize = ref(defaultSize);

const setFontSize = (size: number) => {
  fontSize.value = Math.min(max, Math.max(min, size));
};

const increase = () => setFontSize(fontSize.value + 2);
const decrease = () => setFontSize(fontSize.value - 2);
const reset = () => setFontSize(defaultSize);

watch(
  fontSize,
  (size) => {
    document.documentElement.style.fontSize = size + 'px';
  },
  { immediate: true }
);
</script>

<template>
  <div
    role="region"
    aria-label="Text size controls"
    class="flex gap-2 items-center my-2"
  >
    <button
      @click="decrease"
      :disabled="fontSize <= min"
      aria-label="Decrease text size"
      class="px-2 py-1 rounded bg-[var(--surface-container-high)] hover:bg-[var(--surface-container-highest)] disabled:opacity-50"
    >
      A-
    </button>
    <button
      @click="reset"
      aria-label="Reset text size"
      class="px-2 py-1 rounded bg-[var(--surface-container-high)] hover:bg-[var(--surface-container-highest)]"
    >
      A
    </button>
    <button
      @click="increase"
      :disabled="fontSize >= max"
      aria-label="Increase text size"
      class="px-2 py-1 rounded bg-[var(--surface-container-high)] hover:bg-[var(--surface-container-highest)] disabled:opacity-50"
    >
      A+
    </button>
    <span class="ml-2 text-sm text-[var(--on-surface)]"
      >Text size: {{ fontSize }}px</span
    >
  </div>
</template>
