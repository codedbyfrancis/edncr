<template>
  <div>Default Dashboard Menu</div>
  <div class="flex gap-3">
    <NuxtLinkLocale :to="{ name: 'dashboard' }">Dashboard</NuxtLinkLocale>
    <NuxtLinkLocale :to="{ name: 'dashboard-campaign-create' }"
      >Create Campaign</NuxtLinkLocale
    >
  </div>
</template>
