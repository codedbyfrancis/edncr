<script lang="ts" setup></script>
<template>
  <section class="hero">
    <div class="relative py-24 sm:py-32 md:py-40">
      <UContainer
        class="text-center flex flex-col items-center justify-between"
      >
        <h1
          class="text-6xl md:text-9xl font-extrabold tracking-tight text-transparent bg-clip-text bg-gradient-to-r from-blue-500 via-red-500 to-yellow-500"
        >
          Your Awesome Hero Title
        </h1>
        <p
          class="w-1/2 mt-6 text-lg leading-8 text-gray-600 dark:text-gray-300"
        >
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
  </section>
</template>
<style lang="css" scoped>
@reference 'tailwindcss';
.hero {
  @apply font-[Inika];
}
</style>
