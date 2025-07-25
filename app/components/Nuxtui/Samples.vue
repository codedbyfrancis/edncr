<template>
  <div>
    <div class="flex flex-col gap-4">
      <UButton>Button</UButton>
      <UButton label="Button" />
      <UButton color="neutral">Button</UButton>
      <UButton color="neutral" variant="outline">Button</UButton>
      <UButton size="xl">Button</UButton>
      <UButton icon="i-lucide-rocket" size="md" color="primary" variant="solid"
        >Button</UButton
      >
      <UButton trailing-icon="i-lucide-arrow-right" size="md">Button</UButton>
      <UButton
        icon="i-lucide-search"
        size="md"
        color="primary"
        variant="solid"
      />
      <UButton
        :avatar="{
          src: 'https://github.com/nuxt.png',
        }"
        size="md"
        color="neutral"
        variant="outline"
      >
        Button
      </UButton>
      <UButton
        :avatar="{
          src: 'https://github.com/nuxt.png',
        }"
        size="md"
        color="neutral"
        variant="outline"
      />
      <UButton to="https://github.com/nuxt/ui" target="_blank">Button</UButton>
      <UButton
        active
        color="neutral"
        variant="outline"
        active-color="primary"
        active-variant="solid"
      >
        Button
      </UButton>
      <UButton active active-class="font-bold" inactive-class="font-light"
        >Button</UButton
      >
      <UButton loading>Button</UButton>
      <UButton disabled>Button</UButton>
      <UButton class="text-lg font-normal rounded-full py-2 px-5"
        >Button</UButton
      >
      <UButton
        icon="i-lucide-rocket"
        color="neutral"
        variant="outline"
        :ui="{
          leadingIcon: 'text-primary',
        }"
      >
        Button
      </UButton>
    </div>
    <div>
      <NuxtTime :datetime="Date.now()" :locale="$t('language-code')" />
    </div>
  </div>
</template>
