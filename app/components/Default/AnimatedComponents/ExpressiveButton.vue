<template>
  <button
    v-ripple
    :class="[
      'relative rounded-full px-6 py-3 font-medium text-white transition-all duration-200 ease-material focus:outline-none focus-visible:ring-4 focus-visible:ring-primary/40',
      'shadow-elevated hover:shadow-hovered active:scale-95',
      bgClass,
      classOverride,
    ]"
    v-bind="attrs"
  >
    <span class="relative z-10"><slot>Expressive Button</slot></span>
    <!-- ripple is handled by directive -->
  </button>
</template>

<script setup lang="ts">
import { useAttrs } from 'vue';

const props = defineProps<{
  color?: 'primary' | 'secondary' | string;
  classOverride?: string;
}>();

const attrs = useAttrs();

const bgClass = computed(() => {
  if (props.color === 'secondary') return 'bg-secondary';
  if (props.color === 'primary') return 'bg-primary';
  return typeof props.color === 'string' ? props.color : 'bg-primary';
});
</script>
