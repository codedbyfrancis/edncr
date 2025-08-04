<script lang="ts" setup>
import { AnimationsButtons } from '#components';

definePageMeta({
  layout: 'defaultpages',
});

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
<template>
  <div>
    <div class="container mx-auto">
      <h1>[Animations]</h1>

      <div>
        <AnimationsButtons />
      </div>
    </div>
  </div>
</template>
