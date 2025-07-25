<script setup>
const isVisible = ref(true);

function close() {
  isVisible.value = false;
}
</script>
<template>
  <section v-if="isVisible" class="px-4 md:block hidden py-2">
    <div class="flex items-center justify-between">
      <div
        class="flex flex-col md:flex-row justify-center md:justify-end items-center"
      >
        <div>Accessibility and website options:</div>
        <div class="flex items-center justify-center pl-2">
          <div class="nav-items-components"><DefaultColorModeButton /></div>
          <div class="nav-items-components"><DefaultLanguageSwitcherTop /></div>
          <!-- <DefaultTextSizeControl /> -->
        </div>
      </div>
      <button
        @click="close"
        class="hover:text-[var(--surface-container-variant)] text-[var(--on-surface-container)] font-bold text-xl cursor-pointer"
      >
        &times;
      </button>
    </div>
  </section>
</template>
