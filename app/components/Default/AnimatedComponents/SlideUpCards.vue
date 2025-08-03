<template>
  <div class="group max-w-sm">
    <div
      class="relative overflow-hidden rounded-2xl bg-white shadow-elevated transition-all duration-300 ease-material group-hover:shadow-hovered group-hover:-translate-y-1"
    >
      <div class="p-6">
        <h3 class="text-lg font-semibold mb-2">
          <slot name="title">Feature Title</slot>
        </h3>
        <p
          class="text-sm text-gray-600 transition-opacity duration-250 ease-material"
        >
          <slot name="description">
            This description fades in and the card lifts subtly to draw
            attention.
          </slot>
        </p>
        <div class="mt-4">
          <slot name="action">
            <DefaultExpressiveButton>Action</DefaultExpressiveButton>
          </slot>
        </div>
      </div>
      <div
        class="absolute top-0 right-0 m-3 flex items-center space-x-2 opacity-0 group-hover:opacity-100 animate-slide-up-fade"
      >
        <div class="bg-accent px-2 py-1 text-xs rounded-full text-white">
          New
        </div>
      </div>
    </div>
  </div>
</template>
