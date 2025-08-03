import tailwindcss from '@tailwindcss/vite';
import { defineNuxtConfig } from 'nuxt/config';

// https://nuxt.com/docs/api/configuration/nuxt-config
export default defineNuxtConfig({
  compatibilityDate: '2025-05-15',
  devtools: { enabled: true },
  future: {
    compatibilityVersion: 4,
  },
  components: true,
  modules: [
    '@nuxt/image',
    '@nuxt/ui',
    '@nuxt/scripts',
    '@nuxtjs/supabase',
    '@nuxtjs/i18n',
    '@vueuse/nuxt',
    '@nuxt/fonts',
  ],
  css: ['~/assets/css/main.css'],
  runtimeConfig: {
    public: {
      appName: '',
      appUrl: '',
      imageCndUrl: '',
      googleClientId: process.env.NUXT_PUBLIC_GOOGLE_CLIENT_ID,
      // supabaseUrl: process.env.NUXT_PUBLIC_SUPABASE_URL,
      // supabaseKey: process.env.NUXT_PUBLIC_SUPABASE_KEY,
    },
  },
  app: {
    head: {
      // titleTemplate: '%s | ' + process.env.NUXT_PUBLIC_APP_NAME,
      link: [
        { rel: 'icon', type: 'image/x-icon', href: '/icons/favicon.ico' },

        // Standard sizes
        {
          rel: 'icon',
          type: 'image/png',
          sizes: '16x16',
          href: '/icons/favicon-16x16.png',
        },
        {
          rel: 'icon',
          type: 'image/png',
          sizes: '32x32',
          href: '/icons/favicon-32x32.png',
        },

        // Apple devices
        {
          rel: 'apple-touch-icon',
          sizes: '180x180',
          href: '/icons/apple-touch-icon.png',
        },

        // Android devices
        {
          rel: 'icon',
          type: 'image/png',
          sizes: '192x192',
          href: '/icons/android-chrome-192x192.png',
        },
        {
          rel: 'icon',
          type: 'image/png',
          sizes: '512x512',
          href: '/icons/android-chrome-512x512.png',
        },

        // Web App Manifest
        // { rel: 'manifest', href: '/site.webmanifest' },
      ],
    },
    pageTransition: { name: 'page', mode: 'out-in' },
  },
  // Supabase module configuration
  supabase: {
    url: process.env.NUXT_PUBLIC_SUPABASE_URL,
    key: process.env.NUXT_PUBLIC_SUPABASE_KEY,
    // serviceKey: process.env.NUXT_SUPABASE_SERVICE_KEY,
    redirect: false, // This is not force the app to always use login page
    redirectOptions: {
      login: '/accounts',
      callback: '/accounts/confirm',
      include: undefined,
      exclude: [],
      saveRedirectToCookie: false,
    },
  },

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

  //i18n Configuration
  i18n: {
    baseUrl: process.env.NUXT_PUBLIC_APP_URL,
    strategy: 'prefix_except_default',
    defaultLocale: 'en',
    locales: [
      {
        code: 'en',
        language: 'en-US',
        name: 'English',
        dir: 'ltr',
        file: 'en.json',
        flagicon: 'flag:gb-4x3',
      },
      {
        code: 'ar',
        language: 'ar-SA',
        name: 'عربي',
        dir: 'rtl',
        file: 'ar.json',
        flagicon: 'flag:ae-4x3',
      },
      {
        code: 'nl',
        language: 'nl-NL',
        name: 'Dutch',
        dir: 'ltr',
        file: 'nl.json',
        flagicon: 'flag:nl-4x3',
      },
    ],
    bundle: {},
  },

  ui: {
    // colorMode: false,
  },

  fonts: {
    families: [
      // specify specific font data - this will bypass any providers
      { name: 'Dirham Font', src: '/fonts/dirham-font.woff2' },
      { name: 'Inika', provider: 'google' },
    ],
  },

  vite: {
    plugins: [tailwindcss()],
  },
});
