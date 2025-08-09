<template>
  <div class="">
    <h2>Color Scheme</h2>
    <div class="scheme flex flex-row gap-2">
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
    <div class="scheme flex flex-row gap-2">
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
    <div class="scheme flex flex-row gap-2">
      <span class="bg-[var(--surface-dim)]">Surface Dim</span>
      <span class="bg-[var(--surface)]">Surface</span>
      <span class="bg-[var(--surface-bright)]">Surface Bright</span>
    </div>
    <div class="scheme flex flex-row gap-2">
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
    <div class="scheme flex flex-row gap-2">
      <span class="bg-[var(--on-surface)] text-[var(--surface)]"
        >On Surface</span
      >
      <span class="bg-[var(--on-surface-variant)] text-[var(--surface)]"
        >On Surface Var.</span
      >
      <span class="bg-[var(--outline)] text-[var(--surface)]">Outline</span>
      <span class="bg-[var(--outline-variant)]">Outline Variant</span>
    </div>
    <div class="scheme flex flex-row gap-2">
      <span class="bg-[var(--error)] text-[var(--on-error)]"
        >Error, on Error</span
      >
      <span class="bg-[var(--error-container)] text-[var(--on-error-container)]"
        >Error Container, on Error Container</span
      >
    </div>
    <div class="scheme flex flex-row gap-2">
      <span class="bg-[var(--inverse-surface)] text-[var(--inverse-on-surface)]"
        >Inverse Surface, Inverse On Surface</span
      >
      <span class="bg-[var(--inverse-primary)] text-[var(--inverse-on-primary)]"
        >Inverse Primary</span
      >
    </div>
    <div class="scheme flex flex-row gap-2">
      <span class="bg-[var(--scrim)] text-white"
        >Scim - do not put text. Scrim is on top of content.</span
      >
      <span class="bg-[var(--shadow)] text-white">Shadow</span>
    </div>
    <!-- Mobile layout -->
    <div class="my-5">
      <div class="flex gap-2">
        <div
          class="bg-[var(--background)] w-1/2 border-4 border-[var(--outline)] rounded-xl py-4 px-2"
        >
          <div class="flex flex-row justify-between items-start mb-10">
            <span>12:11</span>
            <span>
              <UIcon
                name="material-symbols:signal-wifi-4-bar"
                class="size-5 max-w-[40px] text-right"
              />
              <UIcon
                name="material-symbols:signal-cellular-3-bar-rounded"
                class="size-5 max-w-[40px] text-right"
              />
              <UIcon
                name="material-symbols:battery-5-bar"
                class="size-5 max-w-[40px] text-right"
              />
            </span>
          </div>
          <div class="flex flex-row justify-between items-start mb-6">
            <h3>Today</h3>
            <UIcon
              name="material-symbols:person-3-rounded"
              class="size-5 max-w-[40px] text-right"
            />
          </div>

          <div
            class="flex items-center bg-[var(--tertiary-container)] text-[var(--on-tertiary-container)] rounded-3xl p-3 mb-6"
          >
            <UIcon
              name="material-symbols:lightbulb-2"
              class="size-5 max-w-[40px]"
            />
            <p class="w-3/4 px-2">
              During the winter your plants slow down and need less water.
            </p>
          </div>

          <div
            class="bg-[var(--surface-container)] w-full rounded-3xl p-4 mb-3"
          >
            <h4 class="text-[var(--primary)]">Living Room</h4>
            <ul>
              <li>Water</li>
              <li>Feed</li>
            </ul>
          </div>

          <div
            class="bg-[var(--surface-container)] w-full rounded-3xl p-4 mb-3"
          >
            <h4 class="text-[var(--primary)]">Kitchen</h4>
            <ul>
              <li>Water</li>
              <li>Feed</li>
            </ul>
          </div>

          <div
            class="bg-[var(--surface-container)] w-full rounded-3xl p-4 mb-3"
          >
            <h4 class="text-[var(--primary)]">Bedroom</h4>
            <ul>
              <li>Water</li>
              <li>Feed</li>
            </ul>
          </div>
        </div>
        <div class="bg-[var(--background)] w-1/2">test</div>
      </div>
    </div>

    <div class="flex flex-row gap-2">
      <NuxtImg src="/images/theme/gui.png" width="100%" />
      <NuxtImg src="/images/theme/summary-cheat-sheet.png" width="100%" />
    </div>
  </div>
</template>
<style lang="css" scoped>
@reference 'tailwindcss';
.scheme {
  span {
    @apply w-full py-2 mb-2 px-2;
  }
}
</style>
