<script setup lang="ts">
definePageMeta({
  layout: 'defaultpages',
});
const config = useRuntimeConfig();
useSeoMeta({
  title: 'About',
  ogTitle: 'About' + ' | ' + config.public.appName,
  description: 'About description',
  ogDescription: 'About description for social media',
  ogUrl: config.public.appUrl + '/account/',
  ogType: 'website',
  ogSiteName: config.public.appName,
  ogImage: config.public.imageCdnUrl + '/icons/android-chrome-512x512.png',
  twitterCard: 'summary_large_image',
});
</script>
<template>
  <section>
    <DefaultPagesMain
      :data="{ title: 'About', description: 'About description' }"
    />
  </section>
</template>
