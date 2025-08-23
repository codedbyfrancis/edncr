<script setup lang="ts">
const { locale } = useI18n();
</script>

<template>
  <div class="px-2 mt-10">
    <h2>Explain with Artificial Intelligence.</h2>
    <UDrawer
      title="Drawer with description"
      description="Lorem ipsum dolor sit amet, consectetur adipiscing elit."
      :ui="{
        handle: ['shrink-0 !bg-[var(--primary)]', 'transition-opacity'],
        container: 'bg-[var(--surface-container)]',
        content: 'bg-[var(--surface-container)] rounded-t-4xl px-4 ring-0',
        overlay:
          'bg-[var(--surface-container)]/75 backdrop-filter backdrop-grayscale backdrop-blur-lg backdrop-contrast-100',
      }"
    >
      <div class="flex flex-col p-5 justify-center items-center">
        <UIcon
          name="streamline:artificial-intelligence-spark-remix"
          class="p-10 bg-[var(--primary-container)]/90 hover:bg-[var(--primary-container)]"
        />
      </div>
      <template #content>
        <!-- <Placeholder class="h-48 m-4" /> -->
        <div class="py-8">
          <h2>Explain</h2>
          <div class="overflow-y-auto scroll-auto max-h-full">
            <DefaultCardsCallAiGenerate />
          </div>
        </div>
      </template>
    </UDrawer>
  </div>
</template>
<style lang="css" scoped></style>
