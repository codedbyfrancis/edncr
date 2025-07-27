<script setup lang="ts">
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

async function signOut() {
  const { error } = await supabase.auth.signOut();
  if (!error) {
    user.value = null;
    router.push('/accounts');
  }
}
</script>
<template>
  <nav class="p-4">
    <div><DefaultHeaderLogo /></div>

    <ul class="flex">
      <NuxtLinkLocale to="/" class="nav-items">
        <li>Home</li>
      </NuxtLinkLocale>

      <NuxtLinkLocale to="/about" class="nav-items"
        ><li>About</li></NuxtLinkLocale
      >

      <NuxtLinkLocale to="/contacts" class="nav-items">
        <li>Contacts</li>
      </NuxtLinkLocale>

      <NuxtLinkLocale to="/nuxtui" class="nav-items">
        <li>NuxtUi</li>
      </NuxtLinkLocale>

      <ClientOnly>
        <NuxtLinkLocale v-if="user" to="/dashboard" class="nav-items">
          <li>Dashboard</li>
        </NuxtLinkLocale>

        <NuxtLinkLocale v-if="user" to="/dashboard/profile" class="nav-items"
          ><li><DefaultAvatar /></li>
        </NuxtLinkLocale>

        <NuxtLinkLocale
          v-if="user"
          @click="signOut"
          class="cursor-pointer nav-items"
        >
          <li>Logout</li>
        </NuxtLinkLocale>

        <NuxtLinkLocale v-if="!user" to="/accounts" class="nav-items">
          <li>Login</li>
        </NuxtLinkLocale>

        <NuxtLinkLocale v-if="!user" to="/accounts/signup" class="nav-items">
          <li>Sign up</li>
        </NuxtLinkLocale>
      </ClientOnly>

      <!-- <li><DefaultLanguageSwitcher /></li>
      <li><DefaultColorModeButton /></li> -->
    </ul>
  </nav>
</template>
<style lang="css" scoped>
@reference 'tailwindcss';
nav {
  @apply flex items-center justify-between bg-[var(--surface-container-low)] text-[var(--on-surface-container)] p-4;
  .nav-items {
    @apply flex flex-row justify-end items-center gap-0 px-4 whitespace-nowrap font-[Inika] font-medium rounded-full hover:bg-[var(--surface-container-highest)] hover:text-[var(--on-surface-variant)] transition-colors duration-200 ease-in-out;
  }
  .nav-items-components {
    @apply py-2 px-4 rounded-full text-xl bg-[var(--transparent)] text-[var(--on-surface-container)] hover:bg-[var(--surface-container-highest)] hover:text-[var(--on-surface-variant)] transition-colors duration-200 ease-in-out;
  }
  .router-link-active {
    @apply rounded-full px-4 text-[var(--on-primary)] bg-[var(--on-primary-container)] hover:text-[var(--on-primary)] hover:bg-[var(--on-primary-container)];
  }
  .router-link-exact-active {
    @apply rounded-full px-4 text-[var(--on-primary)] bg-[var(--on-primary-container)] hover:text-[var(--on-primary)] hover:bg-[var(--on-primary-container)];
  }
}
</style>
