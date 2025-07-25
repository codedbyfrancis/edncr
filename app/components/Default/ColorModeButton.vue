<script setup>
const colorMode = useColorMode();

const isDark = computed({
  get() {
    return colorMode.value === 'dark';
  },
  set(_isDark) {
    colorMode.preference = _isDark ? 'dark' : 'light';
  },
});
</script>

<template>
  <ClientOnly
    v-if="!colorMode?.forced"
    class="flex items-center justify-center"
  >
    <UButton
      :icon="isDark ? 'i-lucide-moon' : 'i-lucide-sun'"
      color="neutral"
      variant="ghost"
      @click="isDark = !isDark"
      class="nav-items-components-scoped cursor-pointer"
      aria-label="Theme selector"
    />

    <template #fallback>
      <div class="size-14" />
    </template>
  </ClientOnly>
</template>
<style scoped>
@reference "tailwindcss";
.nav-items-components-scoped {
  @apply py-2 px-4 rounded-full text-xl bg-[var(--transparent)] text-[var(--on-surface-container)] hover:bg-[var(--surface-container-highest)] hover:text-[var(--on-surface-variant)] transition-colors duration-200 ease-in-out;
}
</style>
