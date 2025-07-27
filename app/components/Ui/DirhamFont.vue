<template>
  <section class="ui">
    <h1>Dirham Font</h1>
    <div class="text-9xl text-[var(--primary)]">
      <span class="font-dirhams">&#x00EA;</span>
    </div>
    <div class="text-[var(--on-surface-container)]">
      <span class="dirham-symbol">&#xea;</span>
      <span class="amount">10,000</span>
    </div>
  </section>
</template>
<style lang="css" scoped>
@reference 'tailwindcss';
@font-face {
  font-family: 'UAESymbol';
  src: url('/fonts/dirham-font.woff2') format('woff2'),
    url('/fonts/dirham-font.woff') format('woff'),
    url('/fonts/dirham-font.ttf') format('truetype');
}

section,
.ui {
  .font-dirhams {
    /* <span class="font-dirhams text-2xl">&#x00EA;</span> */
    font-family: 'Dirham Font';
    font-size: inherit;
    color: inherit;
  }

  .dirham-symbol {
    font-family: 'UAESymbol', sans-serif;
    color: inherit;
    @apply text-[1rem] pr-1;
    /* font-size: inherit; */
    /* font-size: 2rem; */
  }
  .amount {
    @apply text-[1.5rem];
  }
}
</style>
