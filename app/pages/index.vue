<script setup lang="ts">
const config = useRuntimeConfig();
useSeoMeta({
  title: 'Index',
  ogTitle: 'Index' + ' | ' + config.public.appName,
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
  <section>
    <h1>Index {{ $t('language') }}</h1>
    <h2>{{ $t('welcome') }}</h2>
    <UiDirhamFont />
  </section>
</template>
