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
      // transitionTimingFunction: {
      //   material: 'cubic-bezier(0.4, 0, 0.2, 1)',
      // },
      keyframes: {
        'gradient-shimmer': {
          '0%': { 'background-position': '200% 0%' },
          '100%': { 'background-position': '-200% 0%' },
        },
      },
      animation: {
        'gradient-shimmer': 'gradient-shimmer 3s linear infinite',
      },
      boxShadow: {
        elevated: '0px 4px 20px rgba(0,0,0,0.12)',
        hovered: '0px 8px 30px rgba(0,0,0,0.16)',
      },
      backgroundSize: {
        '200%': '200% 100%',
      },
    },
  },
});
