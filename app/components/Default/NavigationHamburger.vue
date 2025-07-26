<script lang="ts" setup>
const router = useRouter();
const supabase = useSupabaseClient();
import type { User } from '@supabase/supabase-js';

const user = ref<User | null>(null);

const getUser = async () => {
  const { data } = await supabase.auth.getUser();
  user.value = data.user;
};

onMounted(async () => {
  await getUser();
  supabase.auth.onAuthStateChange(() => {
    getUser();
  });
});

const config = useRuntimeConfig();
//Mobile Menu
const isOpen = ref(false);
const navRef = ref<HTMLElement | null>(null);

async function signOut() {
  const { error } = await supabase.auth.signOut();
  if (!error) {
    user.value = null;
    isOpen.value = false;
    router.push('/accounts');
  }
}

function handleClickOutside(event: MouseEvent) {
  if (navRef.value && !navRef.value.contains(event.target as Node)) {
    isOpen.value = false;
  }
}

onMounted(() => {
  document.addEventListener('mousedown', handleClickOutside);
});
onBeforeUnmount(() => {
  document.removeEventListener('mousedown', handleClickOutside);
});
</script>

<template>
  <nav ref="navRef">
    <div class="logo">
      <DefaultHeaderLogo />
    </div>
    <!-- Hamburger Icon -->
    <button
      @click="isOpen = !isOpen"
      class="md:hidden px-2 focus:outline-none"
      aria-label="Menu"
    >
      <svg
        v-if="!isOpen"
        class="w-10 h-10"
        fill="none"
        stroke="currentColor"
        stroke-width="2"
        viewBox="0 0 24 24"
        stroke-linecap="round"
        stroke-linejoin="round"
      >
        <path d="M4 6h16M4 12h16M4 18h16" />
      </svg>
      <svg
        v-else
        class="w-10 h-10"
        fill="none"
        stroke="currentColor"
        stroke-width="2"
        viewBox="0 0 24 24"
        stroke-linecap="round"
        stroke-linejoin="round"
      >
        <path d="M6 18L18 6M6 6l12 12" />
      </svg>
    </button>

    <!-- Mobile Menu -->
    <transition name="fade">
      <div
        v-if="isOpen"
        class="absolute top-18 left-0 w-full bg-[var(--surface-container-low)] text-[var(--on-surface-variant)] shadow-md md:hidden z-50"
      >
        <ul class="flex flex-col p-4">
          <NuxtLinkLocale @click="isOpen = false" to="/" class="nav-items">
            <li>Home</li>
          </NuxtLinkLocale>

          <NuxtLinkLocale @click="isOpen = false" to="/about" class="nav-items">
            <li>About</li>
          </NuxtLinkLocale>

          <NuxtLinkLocale
            @click="isOpen = false"
            to="/contacts"
            class="nav-items"
          >
            <li>Contacts</li>
          </NuxtLinkLocale>

          <NuxtLinkLocale
            @click="isOpen = false"
            to="/nuxtui"
            class="nav-items"
          >
            <li>NuxtUi</li>
          </NuxtLinkLocale>

          <NuxtLinkLocale
            v-if="user"
            @click="isOpen = false"
            to="/dashboard"
            class="nav-items"
          >
            <li>Dashboard</li>
          </NuxtLinkLocale>

          <!-- <NuxtLinkLocale
            v-if="user"
            @click="isOpen = false"
            to="/dashboard/profile"
          >
            <li class="nav-items-avatar">
              <span>
                <DefaultAvatar />
              </span>
              <span>{{ user.email }}</span>
            </li>
          </NuxtLinkLocale> -->

          <NuxtLinkLocale
            v-if="!user"
            @click="isOpen = false"
            to="/accounts"
            class="nav-items"
          >
            <li>Login</li>
          </NuxtLinkLocale>

          <NuxtLinkLocale
            v-if="!user"
            @click="isOpen = false"
            to="/accounts/signup"
            class="nav-items"
          >
            <li>Sign up</li>
          </NuxtLinkLocale>

          <div
            class="bg-[var(--surface-container-lowest)] text-[var(--on-surface-container)] rounded-2xl mt-4"
          >
            <li class="nav-component" v-if="user">
              <div class="py-2">Profile:</div>
              <div class="flex justify-between gap-3 items-center">
                <div>
                  <NuxtLinkLocale
                    class="flex items-center gap-3 py-2 px-4 rounded-full font-medium hover:bg-[var(--surface-container-highest)] hover:text-[var(--on-surface-variant)] transition-colors duration-200 ease-in-out"
                    v-if="user"
                    @click="isOpen = false"
                    to="/dashboard/profile"
                  >
                    <DefaultAvatar />
                    <span>{{ user.email }}</span>
                  </NuxtLinkLocale>
                </div>
                <div>
                  <NuxtLinkLocale
                    v-if="user"
                    @click="signOut"
                    class="cursor-pointer nav-items"
                  >
                    <li>Logout</li>
                  </NuxtLinkLocale>
                </div>
              </div>
            </li>

            <li class="nav-component">
              <div class="py-2">Select your language:</div>
              <DefaultLanguageSwitcher />
            </li>
            <li class="nav-component">
              <div class="flex justify-between">
                <div class="py-2">Select your theme:</div>
                <div class="py-2">Select text size:</div>
              </div>

              <div class="flex justify-between">
                <DefaultColorModeButton />
                <DefaultTextSizeControl />
              </div>
            </li>
          </div>
        </ul>
      </div>
    </transition>
  </nav>
</template>

<style scoped>
@reference "tailwindcss";

nav {
  @apply flex items-center justify-between py-2;
  .logo {
    @apply pl-2;
  }
  .nav-items {
    @apply rounded-full py-4 px-8 hover:bg-[var(--surface-container-highest)] hover:text-[var(--on-surface-variant)] transition-colors duration-200 ease-in-out;
  }
  .router-link-active {
    @apply rounded-full px-8 font-semibold text-[var(--on-primary)] bg-[var(--on-primary-container)] hover:text-[var(--on-primary)] hover:bg-[var(--on-primary-container)];
  }
  .router-link-exact-active {
    @apply rounded-full px-8 font-semibold text-[var(--on-primary)] bg-[var(--on-primary-container)] hover:text-[var(--on-primary)] hover:bg-[var(--on-primary-container)];
  }
  .nav-items-avatar {
    @apply flex gap-3 items-center pl-3 py-2 font-medium;
    .router-link-active {
      @apply -space-x-2;
    }
  }
  .nav-component {
    @apply p-4;
  }

  .fade-enter-active,
  .fade-leave-active {
    transition: opacity 0.3s ease;
  }
  .fade-enter-from,
  .fade-leave-to {
    opacity: 0;
  }
}
</style>
