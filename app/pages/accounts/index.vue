<script setup lang="ts">
definePageMeta({
  layout: 'defaultindex',
});
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

import { LazyUSeparator } from '#components';
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
  <section>
    <div class="content container mx-auto">
      <div class="flex flex-col h-svh justify-center items-center">
        <div
          class="flex flex-col h-[30%] justify-center items-center text-center"
        >
          <h1 class="display">{{ config.public.appName }}</h1>
          <h5>{{ config.public.appTag }}</h5>
        </div>
        <div class="flex flex-col h-[70%] justify-center items-center">
          <div>{{ $t('select-your-language') }}</div>
          <DefaultLanguageSwitcherTop />
          <!-- <DefaultAuthGoogle /> -->
          <DefaultAuthPhone />
        </div>
      </div>
    </div>
  </section>
</template>
<style lang="css" scoped>
@reference "tailwindcss";
section {
  .auth {
    h1 {
      @apply text-left text-2xl font-bold mb-4;
    }
    h2 {
      @apply text-left text-2xl font-medium mb-2;
    }
    .box {
      @apply flex flex-col justify-center items-center w-full md:w-1/2 p-4 bg-[var(--surface-container-low)] rounded-2xl shadow-lg;
    }
  }
}
</style>
