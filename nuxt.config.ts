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
    'nuxt-svgo',
    'nuxt-mail',
  ],

  css: ['~/assets/css/main.css'],
  runtimeConfig: {
    public: {
      appName: '',
      appUrl: '',
      appEnv: '',
      imageCndUrl: '',
      googleClientId: '',
      googleTagManager: '',
      // supabaseUrl: process.env.NUXT_PUBLIC_SUPABASE_URL,
      // supabaseKey: process.env.NUXT_PUBLIC_SUPABASE_KEY,
    },
    mail: {
      message: {
        to: process.env.NUXT_PUBLIC_EMAIL,
      },
      smtp: {
        host: process.env.NUXT_PUBLIC_SMTP_HOST,
        port: process.env.NUXT_PUBLIC_SMTP_PORT,
        auth: {
          user: process.env.NUXT_PUBLIC_EMAIL,
          pass: process.env.NUXT_PUBLIC_PASSWORD,
        },
      },
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
      script: [
        {
          hid: 'gtm-script',
          innerHTML: `(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':
          new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],
          j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src=
          'https://www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);
          })(window,document,'script','dataLayer','${process.env.NUXT_PUBLIC_GOOGLE_TAG_MANAGER}');`,
          type: 'text/javascript',
        },
      ],
      noscript: [
        {
          hid: 'gtm-noscript',
          innerHTML: `<iframe src="https://www.googletagmanager.com/ns.html?id=${process.env.NUXT_PUBLIC_GOOGLE_TAG_MANAGER}"
          height="0" width="0" style="display:none;visibility:hidden"></iframe>`,
          pbody: true,
        },
      ],
    },
    pageTransition: { name: 'page', mode: 'out-in' },
    // required to allow innerHTML
    vue: {
      compilerOptions: {
        isCustomElement: () => true,
      },
    },
    hooks: {
      'app:rendered'(ctx) {
        // Prevent Vue from escaping innerHTML
        ctx.ssrContext?.event.res.setHeader(
          'Content-Security-Policy',
          "script-src 'unsafe-inline'"
        );
      },
    },
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
