<script setup lang="ts">
const config = useRuntimeConfig();
useSeoMeta({
  title: 'Contact',
  ogTitle: 'Contact' + ' | ' + config.public.appName,
  description: 'Contact description',
  ogDescription: 'Contact description for social media',
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
      :data="{ title: 'Contact', description: 'Contact description' }"
    />
  </section>
</template>
