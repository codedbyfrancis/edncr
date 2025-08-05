<script lang="ts" setup></script>
<template>
  <div class="hero bg-[var(--primary)]/5">
    <div class="relative py-24 sm:py-32 md:py-40">
      <UContainer
        class="text-center flex flex-col items-center justify-between"
      >
        <h1
          class="display text-transparent font-extrabold bg-clip-text bg-gradient-to-r from-blue-500 via-red-500 to-yellow-500"
        >
          Your Awesome Hero Title
        </h1>
        <p>
          Anim aute id magna aliqua ad ad non deserunt sunt. Qui irure qui lorem
          cupidatat commodo. Elit sunt amet fugiat veniam occaecat fugiat
          aliqua.
        </p>
        <div class="mt-10 flex items-center justify-center gap-x-6">
          <UButton
            to="/accounts/signup"
            size="xl"
            class="bg-[var(--primary)] text-white"
            variant="solid"
            label="Get started"
          />
          <UButton
            to="/about"
            size="xl"
            class="bg-[var(--primary)] text-white"
            variant="link"
            label="Learn more"
            trailing-icon="i-heroicons-arrow-right-20-solid"
          />
        </div>
      </UContainer>
    </div>
  </div>
</template>
<style lang="css" scoped>
@reference 'tailwindcss';
.hero {
  p {
    @apply text-[clamp(0.9rem,1vw+.9rem,2rem)] leading-[1.5] tracking-normal;
  }
  .secondary-body {
    @apply text-[clamp(1.1rem,1.5vw+.9rem,1.25rem)] leading-[1.5] tracking-normal;
  }
  .caption {
    @apply text-[clamp(0.7rem,1vw+.6rem,0.8rem)] leading-[1.4] tracking-[0.02em];
  }
  .overline {
    @apply uppercase text-[clamp(0.55rem,0.8vw+.5rem,0.64rem)] leading-[1.3] tracking-[0.1em];
  }
  .display {
    @apply text-[clamp(2.5rem,5vw+.5rem,5.75rem)] leading-[1.1] tracking-[-0.04em];
  }
  h1 {
    @apply text-[clamp(2rem,4vw+.25rem,3.05rem)] leading-[1.15] tracking-[-0.03em];
  }
  h2 {
    @apply text-[clamp(1.6rem,3.5vw+.2rem,2.44rem)] leading-[1.2] tracking-[-0.025em];
  }
  h3 {
    @apply text-[clamp(1.3rem,3vw+.15rem,1.95rem)] leading-[1.25] tracking-[-0.02em];
  }
  h4 {
    @apply text-[clamp(1.1rem,2.5vw+.1rem,1.5625rem)] leading-[1.3] tracking-[-0.015em];
  }
}
</style>
