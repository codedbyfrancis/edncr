<script lang="ts" setup>
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

      <div class="container mx-auto mt-10">
        <h1 class="text-3xl font-bold mb-4">Nuxt 4 Material 3 Expressive UI</h1>

        <div class="space-y-6">
          <div>
            <h2 class="text-xl font-semibold mb-2">Expressive Button</h2>
            <DefaultAnimatedComponentsExpressiveButton color="primary"
              >Primary Action</DefaultAnimatedComponentsExpressiveButton
            >
            <DefaultAnimatedComponentsExpressiveButton
              color="secondary"
              class="ml-4"
              >Accent Action</DefaultAnimatedComponentsExpressiveButton
            >
          </div>

          <div>
            <h2 class="text-xl font-semibold mb-2">Slide-up Card</h2>
            <DefaultAnimatedComponentsSlideUpCards>
              <template #title>Awesome Feature</template>
              <template #description>
                This is a customizable card that lifts and reveals more info on
                hover.
              </template>
              <template #action>
                <DefaultAnimatedComponentsExpressiveButton
                  >Learn More</DefaultAnimatedComponentsExpressiveButton
                >
              </template>
            </DefaultAnimatedComponentsSlideUpCards>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>
