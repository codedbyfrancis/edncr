<script setup lang="ts">
definePageMeta({
  layout: 'defaultmain',
});
const config = useRuntimeConfig();
useSeoMeta({
  title: 'Call to ' + config.public.appTag,
  ogTitle: 'Call to ' + config.public.appTag + ' | ' + config.public.appName,
  description: 'Call description',
  ogDescription: 'Call description for social media',
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
      <DefaultCardsCallInfo />
      <DefaultCardsCallAi />
      <DefaultCardsCallFeedback />
    </div>
  </div>
</template>
<style lang="css" scoped>
@reference "tailwindcss";
</style>
