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
      <section class="header_accessibility">
        <DefaultNavigationAccessibility />
      </section>
      <section class="header_navigation">
        <DefaultNavigation />
      </section>
      <section class="header_hamburger">
        <DefaultNavigationHamburger />
      </section>
    </header>

    <section class="dashboard">
      <!-- Left -->
      <div class="dashboard_nav">
        <DefaultDashboardMenu />
      </div>
      <!-- Right -->
      <div class="dashboard_content">
        <slot />
      </div>
    </section>

    <footer>
      <section class="footer_main">
        <DefaultFooter />
      </section>
      <section class="footer_navigation">
        <DefaultNavigationBottom />
      </section>
    </footer>
  </Html>
</template>
<style lang="css" scoped>
@reference "tailwindcss";
</style>
