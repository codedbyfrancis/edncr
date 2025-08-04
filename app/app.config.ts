export default defineAppConfig({
  app: {
    name: 'Nuxt 4 Boilerplate SB NuxtUi TW',
    description: 'Nuxt 4 Boilerplate SB NuxtUi TW',
  },
  ui: {},
  theme: {
    extend: {
      transitionTimingFunction: {
        material: 'cubic-bezier(0.4, 0, 0.2, 1)',
      },
      keyframes: {
        'slide-up-fade': {
          '0%': { opacity: '0', transform: 'translateY(6px)' },
          '100%': { opacity: '1', transform: 'translateY(0)' },
        },
        ripple: {
          '0%': { transform: 'scale(0)', opacity: '0.3' },
          '80%': { transform: 'scale(1)', opacity: '0' },
          '100%': { opacity: '0' },
        },
      },
      animation: {
        'slide-up-fade':
          'slide-up-fade 250ms var(--tw-transition-timing-function) both',
        ripple: 'ripple 600ms ease-out both',
      },
      boxShadow: {
        elevated: '0px 4px 20px rgba(0,0,0,0.12)',
        hovered: '0px 8px 30px rgba(0,0,0,0.16)',
      },
    },
  },
});
