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
      <!-- <div class="logo"></div> -->
    </div>

    <div
      class="md:flex-row md:flex items-center hidden text-3xl font-extrabold text-[var(--logo-fill)]"
    >
      <!-- Desktop -->
      <span>{{ config.public.appName }}</span>
    </div>
    <div
      class="md:hidden flex flex-row items-center text-2xl font-extrabold text-[var(--logo-fill)]"
    >
      <!-- Mobile -->
      <span>{{ config.public.appName }}</span>
    </div>
  </div>
</template>
<style lang="css" scoped>
@reference "tailwindcss";
.logo {
  background-image: url('~/assets/logo/logo.svg');
  background-size: contain; /* scale nicely */
  background-repeat: no-repeat;
  background-position: center;
  width: 50px;
  height: 50px;
  fill: currentColor;
}
</style>
