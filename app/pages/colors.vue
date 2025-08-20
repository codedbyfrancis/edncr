<script lang="ts" setup>
definePageMeta({
  layout: 'defaultpages',
});

const config = useRuntimeConfig();
useSeoMeta({
  title: 'Colors',
  ogTitle: 'Colors' + ' | ' + config.public.appName,
  description: 'Colors description',
  ogDescription: 'Colors description for social media',
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
      <h1>[Colors]</h1>
      <div>
        <div class="text-center py-5">
          <a
            href="https://9to5google.com/2025/08/17/google-material-3-expressive-redesign/"
            target="blank"
            rel="”nofollow”"
            >Guide 9to5google-google-material-3-expressive-redesign</a
          >
        </div>
        <DevTwColorScheme />
      </div>

      <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">
        <!-- Buttons -->
        <div class="space-y-4">
          <h2 class="text-xl font-semibold">Buttons</h2>
          <div class="flex flex-wrap gap-4">
            <UButton
              label="Primary"
              size="lg"
              :ui="{
                base: 'rounded-full px-8 py-4 text-lg bg-[color:var(--primary)] text-[color:var(--on-primary)] cursor-pointer',
              }"
            />
            <UButton
              label="Secondary"
              color="secondary"
              :ui="{ base: 'rounded-full px-8 py-4 text-lg cursor-pointer' }"
            />
            <UButton
              label="Info"
              color="info"
              :ui="{ base: 'rounded-full px-8 py-4 text-lg cursor-pointer' }"
            />
            <UButton
              label="Success"
              color="success"
              :ui="{ base: 'rounded-full px-8 py-4 text-lg cursor-pointer' }"
            />
            <UButton
              label="Warning"
              color="warning"
              :ui="{ base: 'rounded-full px-8 py-4 text-lg cursor-pointer' }"
            />
            <UButton
              label="Error"
              color="error"
              :ui="{ base: 'rounded-full px-8 py-4 text-lg cursor-pointer' }"
            />
          </div>
        </div>

        <!-- Cards -->
        <div class="space-y-4 mt-3">
          <h2 class="text-xl font-semibold">Cards</h2>
          <UCard
            class="bg-[var(--surface-container)] text-[color:var(--on-surface-container)]"
          >
            <template #header>
              <h3 class="text-lg font-bold text">Primary Card</h3>
            </template>
            <p>This card uses the primary color.</p>
          </UCard>
          <UCard
            class="bg-[color:var(--surface-container)]/70 text-[color:var(--on-surface-container)]"
          >
            <template #header>
              <h3 class="text-lg font-bold">With Background Opacity</h3>
            </template>
            <p>This card uses background opacity.</p>
          </UCard>
        </div>

        <!-- Accordion -->
        <div class="space-y-4">
          <h2 class="text-xl font-semibold">Accordion</h2>
          <UAccordion
            :items="[
              {
                label: 'Primary Accordion',
                content: 'This uses the primary color.',
                color: 'primary',
              },
              {
                label: 'Secondary Accordion',
                content: 'This uses the secondary color.',
                color: 'secondary',
              },
            ]"
          />
        </div>
      </div>
    </div>
  </div>
</template>
