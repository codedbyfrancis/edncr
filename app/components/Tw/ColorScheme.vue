<template>
  <div class="">
    <h2>Color Scheme</h2>
    <div class="flex flex-row gap-2">
      <span class="bg-[var(--primary)] text-[var(--on-primary)]"
        >Primary, on Primary</span
      >
      <span class="bg-[var(--secondary)] text-[var(--on-secondary)]"
        >Secondary, on Secondary</span
      >
      <span class="bg-[var(--tertiary)] text-[var(--on-tertiary)]"
        >Tertiary, on Tertiary</span
      >
    </div>
    <div class="flex flex-row gap-2">
      <span
        class="bg-[var(--primary-container)] text-[var(--on-primary-container)]"
        >Primary Container, on Primary Container</span
      >
      <span
        class="bg-[var(--secondary-container)] text-[var(--on-secondary-container)]"
        >Secondary Container, on Secondary Container</span
      >
      <span
        class="bg-[var(--tertiary-container)] text-[var(--on-tertiary-container)]"
        >Tertiary Container, on Tertiary Container</span
      >
    </div>
    <div class="flex flex-row gap-2">
      <span class="bg-[var(--surface-dim)]">Surface Dim</span>
      <span class="bg-[var(--surface)]">Surface</span>
      <span class="bg-[var(--surface-bright)]">Surface Bright</span>
    </div>
    <div class="flex flex-row gap-2">
      <span class="bg-[var(--surface-container-lowest)]"
        >Surf. Container Lowest</span
      >
      <span class="bg-[var(--surface-container-low)]">Surf. Container Low</span>
      <span class="bg-[var(--surface-container)]">Surf. Container</span>
      <span class="bg-[var(--surface-container-high)]"
        >Surf. Container High</span
      >
      <span class="bg-[var(--surface-container-highest)]"
        >Surf. Container Highest</span
      >
    </div>
    <div class="flex flex-row gap-2">
      <span class="bg-[var(--on-surface)] text-[var(--surface)]"
        >On Surface</span
      >
      <span class="bg-[var(--on-surface-variant)] text-[var(--surface)]"
        >On Surface Var.</span
      >
      <span class="bg-[var(--outline)] text-[var(--surface)]">Outline</span>
      <span class="bg-[var(--outline-variant)]">Outline Variant</span>
    </div>
    <div class="flex flex-row gap-2">
      <span class="bg-[var(--error)] text-[var(--on-error)]"
        >Error, on Error</span
      >
      <span class="bg-[var(--error-container)] text-[var(--on-error-container)]"
        >Error Container, on Error Container</span
      >
    </div>
    <div class="flex flex-row gap-2">
      <span class="bg-[var(--inverse-surface)] text-[var(--inverse-on-surface)]"
        >Inverse Surface, Inverse On Surface</span
      >
      <span class="bg-[var(--inverse-primary)] text-[var(--inverse-on-primary)]"
        >Inverse Primary</span
      >
    </div>
    <div class="flex flex-row gap-2">
      <span class="bg-[var(--scrim)] text-white"
        >Scim - do not put text. Scrim is on top of content.</span
      >
      <span class="bg-[var(--shadow)] text-white">Shadow</span>
    </div>
    <div class="flex flex-row gap-2">
      <NuxtImg src="/images/theme/gui.png" width="100%" />
      <NuxtImg src="/images/theme/summary-cheat-sheet.png" width="100%" />
    </div>
  </div>
</template>
<style lang="css" scoped>
@reference 'tailwindcss';
div,
span {
  @apply w-full py-2 px-2;
}
</style>
