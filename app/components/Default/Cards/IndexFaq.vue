<script setup lang="ts">
import type { AccordionItem } from '@nuxt/ui';

const items = ref<AccordionItem[]>([
  {
    label: 'What is eDNCR?',
    // icon: 'i-lucide-smile',
    content:
      'eDNCR or enhanced Do Not Call Registry is a service that helps you manage your Do Not Call list.',
  },
  {
    label: 'How eDNCR works?',
    // icon: 'i-lucide-swatch-book',
    content:
      'You can register your phone numbers to the eDNCR list to avoid unwanted calls. Companies are required to check this list before making marketing calls.',
  },
  {
    label: 'How do I report offending companies?',
    // icon: 'i-lucide-box',
    content:
      'You can report offending companies by contacting the eDNCR service.',
  },
]);
</script>

<template>
  <div class="px-2">
    <h2>Frequently Asked Questions</h2>
    <UAccordion :items="items" :ui="{ label: 'text-lg', body: 'text-base' }" />
  </div>
</template>
