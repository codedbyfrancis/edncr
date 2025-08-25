<script setup>
import { ref } from 'vue';

const open = ref(false);
</script>
<template>
  <div class="flex flex-col gap-1 px-2 py-10">
    <h2>What would you like to do?</h2>

    <UDrawer
      title="Drawer with description"
      description="Lorem ipsum dolor sit amet, consectetur adipiscing elit."
      :ui="{
        content: 'rounded-t-4xl',
      }"
    >
      <div
        class="group hover:bg-[var(--surface-container)]/10"
        @click="open = true"
      >
        <div class="button rounded-t-4xl">
          <UIcon name="material-symbols:check-circle-rounded" class="p-5" />
          <div class="flex flex-col">
            <span class="font-medium text-lg">Reject</span>
            <span class="label"
              >Reject the call or automatically selected after 3 days of
              inactivity.</span
            >
          </div>
        </div>
      </div>

      <template #content>
        <div class="drawer_content">
          <h2>Reject</h2>
          <p>
            Reject the call or automatically selected after 3 days of
            inactivity.
          </p>
        </div>
      </template>
    </UDrawer>

    <!-- <NuxtLink to="#" class="group">
      <div class="button rounded-t-4xl">
        <UIcon name="material-symbols:check-circle-rounded" class="p-5" />
        <div class="flex flex-col">
          <span class="font-medium text-lg">Reject</span>
          <span class="label"
            >Reject the call or automatically selected after 3 days of
            inactivity.</span
          >
        </div>
      </div>
    </NuxtLink> -->

    <UDrawer
      title="Drawer with description"
      description="Lorem ipsum dolor sit amet, consectetur adipiscing elit."
      :ui="{
        content: 'rounded-t-4xl',
      }"
    >
      <div class="group hover:bg-[var(--surface-container)]/10">
        <div class="button">
          <UIcon name="material-symbols:check-circle-rounded" class="p-5" />
          <div class="flex flex-col">
            <span class="font-medium text-lg">Accept</span>
            <span class="label"
              >Allow this caller to call you at any given time.</span
            >
          </div>
        </div>
      </div>

      <template #content>
        <div class="drawer_content">
          <h2>Accept</h2>
          <p>Allow this caller to call you at any given time.</p>
        </div>
      </template>
    </UDrawer>

    <!-- <NuxtLink to="#" class="group">
      <div class="button">
        <UIcon name="material-symbols:check-circle-rounded" class="p-5" />
        <div class="flex flex-col">
          <span class="font-medium text-lg">Accept</span>
          <span class="label"
            >Allow this caller to call you at any given time.</span
          >
        </div>
      </div>
    </NuxtLink> -->

    <UDrawer
      title="Drawer with description"
      description="Lorem ipsum dolor sit amet, consectetur adipiscing elit."
      :ui="{
        content: 'rounded-t-4xl',
      }"
    >
      <div class="group hover:bg-[var(--surface-container)]/10">
        <div class="button">
          <UIcon name="material-symbols:check-circle-rounded" class="p-5" />
          <div class="flex flex-col">
            <span class="font-medium text-lg">Reschedule</span>
            <span class="label"
              >Allow the caller to call you on your prefered date and
              time.</span
            >
          </div>
        </div>
      </div>

      <template #content>
        <div class="drawer_content">
          <h2>Reschedule</h2>
          <p>Allow the caller to call you on your prefered date and time.</p>
        </div>
      </template>
    </UDrawer>

    <!-- <NuxtLink to="#" class="group">
      <div class="button">
        <UIcon name="material-symbols:check-circle-rounded" class="p-5" />
        <div class="flex flex-col">
          <span class="font-medium text-lg">Reschedule</span>
          <span class="label"
            >Allow the caller to call you on your prefered date and time.</span
          >
        </div>
      </div>
    </NuxtLink> -->

    <UDrawer
      title="Drawer with description"
      description="Lorem ipsum dolor sit amet, consectetur adipiscing elit."
      :ui="{
        content: 'rounded-t-4xl',
      }"
    >
      <div class="group hover:bg-[var(--surface-container)]/10">
        <div class="button rounded-b-4xl">
          <UIcon name="material-symbols:check-circle-rounded" class="p-5" />
          <div class="flex flex-col">
            <span class="font-medium text-lg">eDNCR</span>
            <span class="label"
              >Customize eDNCR for this company or business category.</span
            >
          </div>
        </div>
      </div>

      <template #content>
        <div class="drawer_content">
          <h2>eDNCR</h2>
          <p>Customize eDNCR for this company or business category.</p>
        </div>
      </template>
    </UDrawer>

    <!-- <NuxtLink to="#" class="group">
      <div class="button rounded-b-4xl">
        <UIcon name="material-symbols:check-circle-rounded" class="p-5" />
        <div class="flex flex-col">
          <span class="font-medium text-lg">eDNCR</span>
          <span class="label"
            >Customize eDNCR for this company or business category.</span
          >
        </div>
      </div>
    </NuxtLink> -->

    <NuxtLink to="#" class="group">
      <div
        class="opacity-50 my-5 py-4 text-center text-lg rounded-full bg-[var(--error-container)]/90 hover:bg-[var(--error-container)] text-[var(--on-error-container)]/90 hover:text-[var(--on-error-container)]"
      >
        Report this call
      </div>
    </NuxtLink>
  </div>
</template>
<style lang="css" scoped>
@reference 'tailwindcss';

.button {
  @apply cursor-pointer px-8 py-4 bg-[var(--primary)]/95 group-hover:bg-[var(--primary)] text-[var(--on-primary)] group-hover:text-[var(--on-primary)]/90 flex flex-row gap-2 items-center;
  .label {
    @apply text-[var(--on-primary)]/70 group-hover:text-[var(--on-primary)]/70;
  }
}
.drawer_content {
  @apply px-4 pb-10;
}
</style>
