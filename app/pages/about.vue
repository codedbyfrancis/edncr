<script setup lang="ts">
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
    <div class="page">
      <h1>About {{ $t('language') }}</h1>
      <h2>{{ $t('welcome') }}</h2>
    </div>
  </section>
</template>
