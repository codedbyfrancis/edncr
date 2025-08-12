<script setup lang="ts">
const { locale, locales, setLocale } = useI18n();
import type { DropdownMenuItem } from '@nuxt/ui';
const route = useRoute();
const router = useRouter();

const items: DropdownMenuItem[] = locales.value.map((locale) => ({
  label: locale.name,
  value: locale.code,
  icon: locale.flagicon,
  onClick: () => setLocale(locale.code),
}));
</script>

<template>
  <section>
    <UDropdownMenu
      :items="items"
      :ui="{ content: 'w-48' }"
      class="hidden md:block"
      aria-label="Language Switcher"
    >
      <UButton
        rounded-full
        icon="material-symbols:keyboard-previous-language-outline"
        class="nav-items-components-scoped cursor-pointer"
        size="xl"
        aria-label="Language Switcher"
      />
    </UDropdownMenu>

    <div
      class="mobile-language-switcher md:hidden flex items-center justify-center flex-row"
    >
      <div v-for="item in items" :key="item.value">
        <button
          @click="item.onClick"
          :class="locale === item.value ? 'active-locale' : ''"
          class="locale-buttons flex flex-row gap-1 items-center text-normal"
          aria-label="Language Switcher Mobile"
        >
          <UIcon :name="item.icon" class="size-5" />
          <span>{{ item.label }}</span>
        </button>
      </div>
      test
      <!-- <pre>{{ router }}</pre> -->
    </div>
  </section>
</template>

<style lang="css" scoped>
@reference "tailwindcss";
.nav-items-components-scoped {
  @apply py-2 px-4 rounded-full text-xl bg-[var(--transparent)] text-[var(--on-surface-container)] hover:bg-[var(--surface-container-highest)] hover:text-[var(--on-surface-variant)] transition-colors duration-200 ease-in-out;
}

.mobile-language-switcher {
  @apply cursor-pointer;
  .locale-buttons {
    @apply bg-[var(--ui-transparent)] hover:bg-[var(--surface-container-highest)] hover:text-[var(--on-surface)] font-medium rounded-full px-4 py-2 cursor-pointer;
    span {
      @apply font-normal;
    }
  }
  .active-locale {
    @apply text-[var(--on-primary-container)] bg-[var(--primary-container)] hover:text-[var(--on-primary-container)] hover:bg-[var(--primary-container)] rounded-full px-4 py-2 cursor-pointer;
    span {
      @apply font-medium;
    }
  }
}
</style>
