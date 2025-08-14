<script lang="ts" setup>
definePageMeta({
  layout: 'defaultpages',
});
const config = useRuntimeConfig();
useSeoMeta({
  title: 'Animations',
  ogTitle: 'Animations' + ' | ' + config.public.appName,
  description: 'Animations description',
  ogDescription: 'Animations description for social media',
  ogUrl: config.public.appUrl + '/account/',
  ogType: 'website',
  ogSiteName: config.public.appName,
  ogImage: config.public.imageCdnUrl + '/icons/android-chrome-512x512.png',
  twitterCard: 'summary_large_image',
});
</script>
<template>
  <div>
    <div class="container mx-auto">
      <h1>[Animations]</h1>

      <div class="flex flex-col gap-5">
        <div><DevAnimationsButtons /></div>
        <div><DevAnimationsDrawer /></div>
      </div>
    </div>
  </div>
</template>
