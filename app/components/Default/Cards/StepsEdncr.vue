<script setup lang="ts">
import type { TimelineItem } from '@nuxt/ui';

const items = ref<TimelineItem[]>([
  {
    // date: '1',
    title: 'Send call approval',
    description: 'Telemarketers wil send call approval using eDNCR system.',
    icon: 'material-symbols:mobile-chat-outline-rounded',
  },
  {
    // date: '1',
    title: 'Receive SMS',
    description: 'You will receive call approval via SMS.',
    icon: 'material-symbols:sms-outline-rounded',
  },
  {
    // date: '2',
    title: 'Reject / Accept / Reschedule / eDNCR',
    description:
      'You will decide to Accept / Reject / Reschedule / eDNCR the call. The call request will auto reject after 3 days.',
    icon: 'material-symbols:mobile-question-outline-rounded',
  },
  {
    // date: '3',
    title: 'Receive call / Call blocked by eDNCR',
    description:
      'Telemarketer will call you if you approved or rescheduled the call. Telemarketer must not call you or block you if you rejected or eDNCR the call.',
    icon: 'material-symbols:shield-question-outline-rounded',
  },
]);
</script>

<template>
  <div class="container mx-atuo px-2 mb-5">
    <h2 class="text-center mb-5">How eDNCR works?</h2>
    <UTimeline
      :default-value="3"
      :items="items"
      class="w-96"
      size="2xl"
      :ui="{ title: 'text-lg -mt-4' }"
    />
  </div>
</template>
<style lang="css" scoped>
@reference 'tailwindcss';
.iconify {
  @apply p-4;
}
</style>

<!-- 
<template>
  <div class="flex flex-col pb-12 px-2">
    <div class="steps_container">
      <UIcon name="material-symbols:sms-outline-rounded" class="icons" />
      <span>Receive SMS with call details.</span>
    </div>
    <div>
      <UIcon
        name="material-symbols:arrow-cool-down-rounded"
        class="steps_dots"
      />
    </div>
    <div class="steps_container">
      <UIcon
        name="material-symbols:mobile-question-outline-rounded"
        class="icons"
      />
      <span>Choose to Accept / Ignore / Reschedule / eDNCR the call.</span>
    </div>
    <div>
      <UIcon
        name="material-symbols:arrow-cool-down-rounded"
        class="steps_dots"
      />
    </div>
    <div class="steps_container">
      <UIcon
        name="material-symbols:shield-question-outline-rounded"
        class="icons"
      />
      <span>Company will call or must block you from their database.</span>
    </div>
  </div>
</template>
<style lang="css" scoped>
@reference "tailwindcss";
.steps_container {
  @apply flex justify-center items-center gap-1 mx-auto bg-[var(--surface-container)] text-[var(--on-surface)] px-4 py-2 rounded-2xl;
}
.steps_dots {
  @apply flex justify-center items-center mx-auto size-5 p-5 my-1 text-[var(--on-surface)]/50;
}
.icons {
  @apply p-4 text-[var(--on-surface-variant)];
}
</style> -->
