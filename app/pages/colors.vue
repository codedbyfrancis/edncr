<script lang="ts" setup>
definePageMeta({
  layout: 'defaultpages',
});
</script>
<template>
  <div>
    <div class="container mx-auto">
      <h1>[Colors]</h1>

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
        <div class="space-y-4">
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
