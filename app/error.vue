<script setup lang="ts">
import type { NuxtError } from '#app';

const props = defineProps({
  error: Object as () => NuxtError,
});
</script>

<template>
  <NuxtLayout>
    <NuxtRouteAnnouncer />
    <section>
      <!-- For development only -->
      <div class="text-center page">
        <h1>{{ error.statusCode }}</h1>
        <h2>{{ error.statusMessage }}</h2>
        <pre class="text-left">{{ error }}</pre>
      </div>

      <!-- For Production -->
      <div v-if="error?.statusCode === 404">
        <DefaultErrors404 />
      </div>
      <div v-if="error?.statusCode === 500">
        <DefaultErrors500 />
      </div>
      <div v-if="error?.statusCode !== 404 && error?.statusCode !== 500">
        <DefaultErrorsAllError />
      </div>

      <NuxtLink to="/">Go back home</NuxtLink>
    </section>
  </NuxtLayout>
</template>
