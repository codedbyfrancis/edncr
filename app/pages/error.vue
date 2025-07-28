<script setup lang="ts">
const config = useRuntimeConfig();
useSeoMeta({
  title: 'Error',
  ogTitle: 'Error' + ' | ' + config.public.appName,
  description: 'Error description',
  ogDescription: 'Error description for social media',
  ogUrl: config.public.appUrl + '/account/',
  ogType: 'website',
  ogSiteName: config.public.appName,
  ogImage: config.public.imageCdnUrl + '/icons/android-chrome-512x512.png',
  twitterCard: 'summary_large_image',
});
</script>
<template>
  <NuxtLayout>
    <DefaultPagesError
      :data="{ title: '404 Error', description: 'Page not found.' }"
    />
  </NuxtLayout>
</template>
