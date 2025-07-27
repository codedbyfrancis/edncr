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
  <section>
    <div class="page">
      <div>Authenticating your credentials...</div>
    </div>
  </section>
</template>
<style lang="css" scoped>
@reference "tailwindcss";
section {
  @apply flex items-center justify-center h-[80vh] text-2xl font-bold;
  color: var(--on-surface);
}
div {
  @apply text-center;
}
</style>
