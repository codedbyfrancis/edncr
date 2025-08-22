<script setup lang="ts">
definePageMeta({
  layout: 'defaultmain',
});
const config = useRuntimeConfig();
useSeoMeta({
  title: 'Welcome to ' + config.public.appTag,
  ogTitle: 'Welcome to ' + config.public.appTag + ' | ' + config.public.appName,
  description: 'Index description',
  ogDescription: 'Index description for social media',
  ogUrl: config.public.appUrl + '/account/',
  ogType: 'website',
  ogSiteName: config.public.appName,
  ogImage: config.public.imageCdnUrl + '/icons/android-chrome-512x512.png',
  twitterCard: 'summary_large_image',
});
</script>
<template>
  <div>
    <div class="content container mx-auto">
      <DefaultCardsWelcome />
      <DefaultCardsStepsEdncr />
      <DefaultCardsIndexFaq />
    </div>
  </div>
</template>
<style lang="css" scoped>
@reference "tailwindcss";
</style>
