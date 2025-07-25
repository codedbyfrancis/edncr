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
    <h1>Contact {{ $t('language') }}</h1>
    <h2>{{ $t('welcome') }}</h2>
  </section>
</template>
