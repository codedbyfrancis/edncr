<template>
  <section>
    <h1>Dirham Font</h1>
    <div class="text-6xl text-[var(--primary)]">
      <span class="font-dirhams">&#x00EA;</span>
    </div>
    <div class="text-4xl text-[var(--on-surface-container)]">
      <span class="dirham-symbol">&#xea;</span> 10,000
    </div>
  </section>
</template>
<style lang="css" scoped>
.font-dirhams {
  /* <span class="font-dirhams text-2xl">&#x00EA;</span> */
  font-family: 'Dirham Font';
  font-size: inherit;
  color: inherit;
}

@font-face {
  font-family: 'UAESymbol';
  src: url('/fonts/dirham-font.woff2') format('woff2'),
    url('/fonts/dirham-font.woff') format('woff'),
    url('/fonts/dirham-font.ttf') format('truetype');
}

.dirham-symbol {
  font-family: 'UAESymbol', sans-serif;
  color: inherit;
  font-size: inherit;
}
</style>
