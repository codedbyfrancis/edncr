<script setup>
const config = useRuntimeConfig();
import LogoMain from '~/assets/logo/logo.svg';
</script>
<template>
  <div class="flex flex-row items-center gap-2">
    <div>
      <LogoMain
        class="text-4xl text-[var(--logo-fill)] fill-[var(--logo-fill)]"
      />
    </div>

    <div
      class="md:flex-row md:flex items-center font-[Inika] hidden text-3xl font-semibold text-[var(--logo-fill)]"
    >
      <!-- Desktop -->
      <span class="cbf-logo-text">{{ config.public.appName }}1</span>
    </div>
    <div
      class="md:hidden flex flex-row items-center font-[Inika] text-2xl font-semibold text-[var(--logo-fill)]"
    >
      <!-- Mobile -->
      <span class="cbf-logo-text">{{ config.public.appName }}2</span>
    </div>
  </div>
</template>
<style lang="css" scoped>
@reference "tailwindcss";
</style>
