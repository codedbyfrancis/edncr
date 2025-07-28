<script setup>
const config = useRuntimeConfig();
// import CbfLogo from '~/assets/logo/cbf-logo.svg';
</script>
<template>
  <div class="flex flex-row items-center gap-2">
    <div>
      <LogoCbf :fill="`var(--logo-fill)`" :width="2" :height="2" />
    </div>

    <div
      class="md:flex-row md:flex items-center font-[Inika] hidden text-3xl font-semibold text-[var(--logo-fill)]"
    >
      <span class="cbf-logo-text">{{ config.public.appName }}</span>
    </div>
    <div
      class="md:hidden flex flex-row items-center font-[Inika] text-4xl font-semibold text-[var(--logo-fill)]"
    >
      <span class="cbf-logo-text">{{ config.public.appName }}</span>
    </div>
  </div>
</template>
<style lang="css" scoped>
@reference "tailwindcss";
.cbf-logo-text {
  @apply font-[Inika] text-3xl md:text-2xl text-inherit text-nowrap;
}
.cbf-logo-by {
  @apply italic text-[var(--logo-fill)]/75 text-3xl;
}
</style>
