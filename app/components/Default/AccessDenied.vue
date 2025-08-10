<template>
  <section class="page">
    <h1>Access denied</h1>
    <p>You don't have permission to access this page.</p>
  </section>
</template>

<style lang="css" scoped>
@reference 'tailwindcss';
.page {
  @apply flex flex-col items-center justify-center h-[70vh] text-2xl text-center font-bold;
  color: var(--on-surface);
  p {
    @apply text-xl font-normal;
  }
}
</style>
