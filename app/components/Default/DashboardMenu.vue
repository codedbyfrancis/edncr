<template>
  <div>Default Dashboard Menu</div>
  <div class="flex gap-3">
    <NuxtLinkLocale :to="{ name: 'dashboard' }">Dashboard</NuxtLinkLocale>
    <NuxtLinkLocale :to="{ name: 'dashboard-upload-campaign' }"
      >Upload Campaign</NuxtLinkLocale
    >
  </div>
</template>
