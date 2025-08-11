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
    <!-- Left -->
    <div class="mobile-layout my-5">
      <div class="flex flex-col sm:flex-row gap-2">
        <div
          class="bg-[var(--background)] w-full xs:w-1/2 border-4 border-[var(--outline)] rounded-xl py-4 px-2"
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
            <h3 class="font-serif">Today</h3>
            <span class="bg-[var(--secondary-container)] px-3 rounded-full">
              <UIcon
                name="material-symbols:person-3-rounded"
                class="size-5 max-w-[40px] text-right mt-1 bg-[var(--on-secondary-container)]"
            /></span>
          </div>

          <div
            class="flex items-center bg-[var(--tertiary-container)] text-[var(--on-tertiary-container)] rounded-3xl p-3 mb-6"
          >
            <UIcon
              name="material-symbols:lightbulb-2-outline-rounded"
              class="size-5 w-[40px] justify-center"
            />
            <p class="px-2">
              During the winter your plants slow down and need less water.
            </p>
          </div>

          <div
            class="bg-[var(--surface-container)] w-full rounded-3xl p-4 mb-3 bg-[url('/images/theme/plants1.png')] bg-no-repeat bg-right-bottom bg-contain"
          >
            <h4 class="text-[var(--primary)] font-serif">Living Room</h4>
            <ul>
              <li><UCheckbox default-value /> Water</li>
              <li><UCheckbox default-value /> Feed</li>
            </ul>
          </div>

          <div
            class="bg-[var(--surface-container)] w-full rounded-3xl p-4 mb-3 bg-[url('/images/theme/plants2.png')] bg-no-repeat bg-right-bottom bg-contain"
          >
            <h4 class="text-[var(--primary)] font-serif">Kitchen</h4>
            <ul>
              <li><UCheckbox /> Water</li>
              <li><UCheckbox default-value /> Feed</li>
            </ul>
          </div>

          <div
            class="bg-[var(--surface-container)] w-full rounded-3xl p-4 mb-3 bg-[url('/images/theme/plants3.png')] bg-no-repeat bg-right-bottom bg-contain"
          >
            <h4 class="text-[var(--primary)] font-serif">Bedroom</h4>
            <ul>
              <li><UCheckbox default-value /> Water</li>
              <li><UCheckbox /> Feed</li>
            </ul>
          </div>
        </div>
        <!-- Right -->
        <div
          class="bg-[var(--background)] w-full xs:w-1/2 border-4 border-[var(--outline)] rounded-xl py-4 px-2"
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
            <UIcon
              name="material-symbols:arrow-back-rounded"
              class="size-7 max-w-[40px] text-right mt-1 bg-[var(--on-surface)]"
            />

            <UIcon
              name="material-symbols:atr"
              class="size-7 max-w-[40px] text-right mt-1 bg-[var(--on-surface)]"
            />
          </div>

          <div class="text-center text-[var(--primary)] p-3">
            <h1 class="font-serif">Monstera Unique</h1>
          </div>

          <div
            class="bg-green-300 w-[60%] md:w-[50%] mx-auto rounded-[3rem] sm:rounded-[3rem] md:rounded-[3rem] mb-3"
          >
            <NuxtImg src="/images/theme/plants1.png" class="w-full" />
          </div>

          <div class="flex gap-5 overflow-hidden">
            <div
              class="flex flex-col bg-[var(--tertiary-container)] text-[var(--on-tertiary-container)] rounded-3xl p-3 mb-6"
            >
              <UIcon
                name="material-symbols:star-shine-outline-rounded"
                class="size-5"
              />
              <span class="font-serif">Most popular</span>
              <span class="caption">This is a popular plant in our store</span>
            </div>
            <div
              class="flex flex-col bg-[var(--tertiary-container)] text-[var(--on-tertiary-container)] rounded-3xl p-3 mb-6"
            >
              <UIcon
                name="material-symbols:note-stack-outline-rounded"
                class="size-5"
              />
              <span class="font-serif">Easy Care</span>
              <span class="caption">This is a popular plant in our store</span>
            </div>
            <div
              class="flex flex-col bg-[var(--tertiary-container)] text-[var(--on-tertiary-container)] rounded-3xl p-3 mb-6"
            >
              <UIcon
                name="material-symbols:notifications-outline-rounded"
                class="size-5"
              />
              <span class="font-serif">Faux Avar</span>
              <span class="caption"
                >Get the best plant with less maintenance</span
              >
            </div>
          </div>
          <div class="flex flex-col gap-5">
            <div class="flex flex-col">
              <h4 class="font-serif">Care</h4>
              <span class="flex items-center"
                ><UIcon name="material-symbols:water" class="size-5 mr-2" />
                Water every Tuesday</span
              >
              <span class="flex items-center"
                ><UIcon
                  name="material-symbols:nest-eco-leaf"
                  class="size-5 mr-2"
                />
                Feed once monthly</span
              >
            </div>
            <div class="flex flex-col">
              <h4 class="font-serif">About</h4>
              <span class="flex items-center"
                ><UIcon
                  name="material-symbols:sunny-rounded"
                  class="size-5 mr-2"
                />
                Moderate light</span
              >
              <span class="flex items-center"
                ><UIcon
                  name="material-symbols:potted-plant-outline"
                  class="size-5 mr-2"
                />
                Low maintenance</span
              >
            </div>
          </div>
        </div>
      </div>
    </div>

    <div class="container mx-auto mt-10">
      <h2>Inspirations</h2>
      <NuxtImg
        src="/images/theme/Material-3-Expressive-Google-apps.webp"
        class="w-full"
      />
      <NuxtImg
        src="/images/theme/Material-3-Expressive-Fitbit-2.webp"
        class="w-full"
      />
      <NuxtImg
        src="/images/theme/Material-3-Experssive-media-app-concept.webp"
        class="w-full"
      />
      <NuxtImg
        src="/images/theme/google-material-3-expressive-design_dezeen_2364_hero-1536x864.webp"
        class="w-full"
      />
      <NuxtImg
        src="/images/theme/google-material-3-expressive-design_dezeen_1704_col_5-852x425.webp"
        class="w-full"
      />
      <NuxtImg
        src="/images/theme/Material-3-Expressive-toolbars-3.webp"
        class="w-full"
      />
      <NuxtImg
        src="/images/theme/collapsed-and-expanded-navigation-rails.webp"
        class="w-full"
      />
      <NuxtImg
        src="/images/theme/Material-3-Expressive-flexible-navigation-rail-2.webp"
        class="w-full"
      />
    </div>

    <div class="flex flex-row gap-2">
      <div class="w-1/2">
        <NuxtImg src="/images/theme/gui.png" class="w-[100%]" />
      </div>
      <div class="w-1/2">
        <NuxtImg src="/images/theme/summary-cheat-sheet.png" class="w-[100%]" />
      </div>
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
.mobile-layout {
  h4 {
    @apply mb-2;
  }
  ul {
    li {
      @apply flex gap-2 items-center;
    }
  }
}
</style>
