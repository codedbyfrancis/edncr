<script setup lang="ts">
// For Google sign-in
const user = useSupabaseUser();
const config = useRuntimeConfig();

useSeoMeta({
  title: 'Confirm',
  ogTitle: 'Confirm',
  description: 'Confirm description',
  ogDescription: 'Confirm description for social media',
  ogUrl: 'https://example.com/login',
  ogType: 'website',
  ogSiteName: 'MyApp',
  ogImage: config.public.imageCdnUrl + '/icons/android-chrome-512x512.png',
  twitterCard: 'summary_large_image',
});

watch(
  user,
  () => {
    if (user.value) {
      // Redirect to protected page after Google sign-in
      return navigateTo('/dashboard');
    }
  },
  { immediate: true }
);
</script>

<template>
  <div>
    <div>Authenticating your credentials...</div>
  </div>
</template>
<style lang="css" scoped>
@reference "tailwindcss";
div {
  @apply flex items-center justify-center h-[80vh] text-2xl font-bold;
  color: var(--on-surface);
}
div {
  @apply text-center;
}
</style>
