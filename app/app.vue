<script setup lang="ts">
import { useI18n } from 'vue-i18n';
import * as locales from '@nuxt/ui/locale';
const { locale } = useI18n();
</script>
<template>
  <UApp :locale="locales[locale]">
    <NuxtLayout>
      <NuxtRouteAnnouncer />
      <NuxtPage />
    </NuxtLayout>
  </UApp>
</template>
<style>
/* Page Transition */
/* .page-enter-active,
.page-leave-active {
  transition: opacity 0.5s cubic-bezier(0.2, 0, 0, 1),
    transform 0.5s cubic-bezier(0.2, 0, 0, 1),
    filter 0.5s cubic-bezier(0.2, 0, 0, 1);
}

.page-enter-from,
.page-leave-to {
  opacity: 0;
  transform: scale(0.98);
}

.page-enter-to,
.page-leave-from {
  opacity: 1;
  transform: scale(1);
} */
</style>
