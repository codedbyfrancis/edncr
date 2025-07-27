<script setup lang="ts">
const locales = useI18n();
const locale = ref(locales.localeProperties);
const head = useLocaleHead({
  addDirAttribute: true,
  identifierAttribute: 'id',
  addSeoAttributes: true,
});
</script>
<template>
  <Html :lang="locale.code" :dir="head.htmlAttrs.dir">
    <header>
      <div class="hidden md:block">
        <DefaultNavigationAccessibility />
      </div>
      <div class="hidden md:block">
        <DefaultNavigation />
      </div>
      <div class="md:hidden">
        <DefaultNavigationHamburger />
      </div>
    </header>
    <slot />
    <footer><DefaultFooter /></footer>
    <DefaultNavigationBottom />
  </Html>
</template>
<style lang="css" scoped>
@reference "tailwindcss";
</style>
