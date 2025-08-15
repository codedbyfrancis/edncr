<script lang="ts" setup>
import type { NuxtError } from '#app';
const config = useRuntimeConfig();

const props = defineProps({
  error: Object as () => NuxtError,
});

useSeoMeta({
  title: props.error?.statusCode + ' Error: ' + props.error?.statusMessage,
  ogTitle: props.error?.statusCode + ' Error' + ' | ' + config.public.appName,
  description: props.error?.statusCode + ' Error description',
  ogDescription:
    props.error?.statusCode + ' Error description for social media',
  ogUrl: config.public.appUrl + '/account/',
  ogType: 'website',
  ogSiteName: config.public.appName,
  ogImage: config.public.imageCdnUrl + '/icons/android-chrome-512x512.png',
  twitterCard: 'summary_large_image',
});
</script>
<template>
  <section class="error_page">
    <!-- For development only -->
    <div v-if="config.public.appEnv === 'dev'">
      <h1>{{ error?.statusCode }}</h1>
      <h2>{{ error?.statusMessage }}</h2>
      <h3>Dev Only</h3>
      <pre class="text-left">{{ error }}</pre>
    </div>

    <!-- For Production -->
    <div v-if="`${error?.statusCode}`.slice(0, 2) === '50'">
      <DefaultErrors500 :error="error" />
    </div>
    <div v-if="`${error?.statusCode}`.slice(0, 2) === '40'">
      <DefaultErrors404 />
    </div>

    <NuxtLink to="/">Go back home</NuxtLink>
  </section>
</template>

<style lang="css" scoped>
@reference 'tailwindcss';
section {
  @apply container mx-auto;
  .error_page {
    @apply flex flex-col text-left text-2xl font-bold;
    color: var(--on-surface);
    p {
      @apply text-xl font-normal;
    }
  }
}
</style>
