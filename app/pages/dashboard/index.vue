<script setup lang="ts">
definePageMeta({
  middleware: 'auth',
  layout: 'dashboard',
});
const supabase = useSupabaseClient();
// const {
//   data: { claims },
// } = await supabase.auth.getClaims();
const { data } = await supabase.auth.getClaims();
const user = data?.claims;

// const user = useSupabaseUser();
const config = useRuntimeConfig();
useSeoMeta({
  title: 'Dashboard/Index',
  ogTitle: 'Dashboard/Index' + ' | ' + config.public.appName,
  description: 'Dashboard/Index description',
  ogDescription: 'Dashboard/Index description for social media',
  ogUrl: config.public.appUrl + '/account/',
  ogType: 'website',
  ogSiteName: config.public.appName,
  ogImage: config.public.imageCdnUrl + '/icons/android-chrome-512x512.png',
  twitterCard: 'summary_large_image',
});
</script>
<template>
  <section>
    <h1>Dashboard/index {{ $t('language') }}</h1>
    <h2>
      {{ $t('welcome') }} <span v-if="user?.email">{{ user?.email }}</span
      ><span v-else>{{ user?.phone }}</span>
    </h2>
  </section>
</template>
