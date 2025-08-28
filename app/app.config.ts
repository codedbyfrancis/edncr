export default defineAppConfig({
  app: {
    name: 'Nuxt 4 Boilerplate SB NuxtUi TW',
    description: 'Nuxt 4 Boilerplate SB NuxtUi TW',
  },
  ui: {
    input: {
      slots: {
        base: 'bg-red-900',
      },
    },
    tooltip: {
      slots: {
        content:
          'bg-[var(--surface-container-high)]  ring-0 text-white text-base py-4',
        text: 'text-[var(--on-surface)]',
      },
    },
    checkbox: {
      slots: {
        base: 'bg-[var(--surface-container-high)] ring-0 text-white text-base ',
      },
    },
    drawer: {
      slots: {
        handle: ['shrink-0 !bg-[var(--primary)]', 'transition-opacity'],
        container: 'bg-[var(--surface-container)]',
        content: 'rounded-t-4xl bg-[var(--surface-container)]  px-4 ring-0',
        overlay:
          'bg-[var(--surface-container)]/75 backdrop-filter backdrop-grayscale backdrop-blur-lg backdrop-contrast-100',
      },
    },
  },
  theme: {
    extend: {
      keyframes: {},
      animation: {},
      boxShadow: {},
    },
  },
});
