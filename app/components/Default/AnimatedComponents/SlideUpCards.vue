<template>
  <div class="group max-w-sm">
    <div
      class="relative overflow-hidden rounded-2xl bg-[var(--surface-container)] shadow-elevated transition-all duration-300 ease-material group-hover:shadow-hovered group-hover:-translate-y-1"
    >
      <div class="p-6">
        <h3 class="font-semibold mb-2 text-[var(--on-surface-container)]">
          <slot name="title"><h1>Feature Title</h1></slot>
        </h3>
        <p
          class="text-[var(--on-surface-container)] transition-opacity duration-250 ease-material"
        >
          <slot name="description"
            ><p>
              This description fades in and the card lifts subtly to draw
              attention.
            </p>
          </slot>
        </p>
        <div class="mt-4">
          <slot name="action">
            <DefaultAnimatedComponentsExpressiveButton
              >Action</DefaultAnimatedComponentsExpressiveButton
            >
          </slot>
        </div>
      </div>
      <div
        class="absolute top-0 right-0 m-3 flex items-center space-x-2 opacity-0 group-hover:opacity-100 animate-slide-up-fade"
      >
        <div
          class="bg-[var(--secondary)] px-2 py-1 text-xs rounded-full text-[var(--on-secondary)]"
        >
          New
        </div>
      </div>
    </div>
  </div>
</template>
