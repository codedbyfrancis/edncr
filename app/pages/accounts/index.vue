<script setup lang="ts">
const config = useRuntimeConfig();

useSeoMeta({
  title: 'Login',
  ogTitle: 'Login' + ' | ' + config.public.appName,
  description: 'Login description',
  ogDescription: 'Login description for social media',
  ogUrl: config.public.appUrl + '/account/',
  ogType: 'website',
  ogSiteName: config.public.appName,
  ogImage: config.public.imageCdnUrl + '/icons/android-chrome-512x512.png',
  twitterCard: 'summary_large_image',
});

// Remove the url to allow
// chrome://settings/content/federatedIdentityApi
import { useGoogleOneTap } from '~/composables/useGoogleOneTap';

useGoogleOneTap({
  redirectUrl: '/accounts/confirm',
  onError: (error) => {
    alert(error.message);
  },
});
</script>
<template>
  <div>
    <div>
      <h1>Accounts/Index {{ $t('language') }}</h1>
      <h2>{{ $t('welcome') }}</h2>
    </div>
    <section>
      <div class="box">
        <AuthPhone />
        <USeparator label="Log in with Magic Link" />
        <AuthMagiclink />
        <USeparator label="Sign in with your Social Media" />
        <AuthGoogle />
        <USeparator label="Sign in with your Email" />
        <AuthEmailLogin />
        <USeparator label="Sign up with your Email" />
        <AuthEmailSignup />
      </div>
    </section>
  </div>
</template>
<style lang="css" scoped>
@reference "tailwindcss";
section {
  @apply flex flex-col items-center justify-center text-center;
  h1 {
    @apply text-2xl font-bold mb-4;
  }
  .box {
    @apply flex flex-col items-center justify-center gap-4 w-full md:w-1/2 rounded-2xl bg-[var(--surface-container-low)] p-4 shadow-lg;
    .auth-google {
      @apply w-full max-w-md;
    }
  }
}
</style>
