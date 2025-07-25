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

async function signOut() {
  const { error } = await supabase.auth.signOut();
  if (!error) {
    user.value = null;
    isOpen.value = false;
    router.push('/accounts');
  }
}
</script>

<template>
  <div>
    <nav class="flex flex-row justify-between items-center">
      <!-- Always visible items in the nav bar -->
      <ul>
        <li>
          <a href="https://threkk.com">threkk.com</a>
        </li>
      </ul>
      <!-- The hamburger menu -->
      <span>
        <label for="menu" tabindex="0"> 🍔 </label>
        <input id="menu" type="checkbox"
      /></span>
      <!-- The collapsable menu -->
      <ul>
        <!-- <li><a href="https://mastodon.social/@threkk">Mastodon</a></li>
        <li><a href="https://twitter.com/threkk">Twitter</a></li>
        <li><a href="https://github.com/threkk">Github</a></li> -->
        <li>
          <NuxtLinkLocale to="/" class="text-white hover:text-gray-300">
            Home
          </NuxtLinkLocale>
        </li>

        <li>
          <NuxtLinkLocale to="/about" class="text-white hover:text-gray-300">
            About
          </NuxtLinkLocale>
        </li>

        <li>
          <NuxtLinkLocale to="/contacts" class="text-white hover:text-gray-300">
            Contacts
          </NuxtLinkLocale>
        </li>

        <li v-if="user">
          <NuxtLinkLocale
            to="/dashboard"
            class="text-white hover:text-gray-300"
          >
            Dashboard
          </NuxtLinkLocale>
        </li>

        <li v-if="user">
          <NuxtLinkLocale
            @click="signOut"
            class="cursor-pointer text-white hover:text-gray-300"
          >
            Logout
          </NuxtLinkLocale>
        </li>

        <li v-if="!user">
          <NuxtLinkLocale to="/accounts" class="text-white hover:text-gray-300">
            Login
          </NuxtLinkLocale>
        </li>

        <li v-if="!user">
          <NuxtLinkLocale
            to="/accounts/signup"
            class="text-white hover:text-gray-300"
          >
            Sign up
          </NuxtLinkLocale>
        </li>

        <li v-if="user">
          <NuxtLinkLocale
            to="/dashboard/profile"
            class="text-white hover:text-gray-300"
            ><DefaultAvatar />
          </NuxtLinkLocale>
        </li>

        <li><DefaultLanguageSwitcher /></li>
      </ul>
    </nav>
  </div>
</template>

<style scoped>
.fade-enter-active,
.fade-leave-active {
  transition: opacity 0.3s ease;
}
.fade-enter-from,
.fade-leave-to {
  opacity: 0;
}

/* Here we start */
nav {
  background-color: SeaGreen;
  color: snow;
  display: flex;
  justify-content: space-between;
}

nav ul {
  /* Make the markers disappear */
  list-style-type: none;
}

nav ul li {
  /* Puts the elements in a single line */
  display: inline-flex;
  margin: 0.3em 1em;
}

/* These two lines make the checkbox and the label disappear when we are in desktop mode. */
nav input[type='checkbox'],
nav label {
  display: none;
}

/* This start to get interesting: we go into mobile phone mode */
@media (max-width: 768px) {
  /* Here is the magic: if the checkbox is not marked, the adjacent list is not displayed */
  input[type='checkbox']:not(:checked) + ul {
    display: none;
  }

  nav {
    flex-direction: row;
    flex-wrap: wrap;
    margin-left: 0;
    margin-right: 0;
  }

  /* Stlying the menu icon, the checkbox stays hidden */
  nav label {
    text-align: right;
    display: block;
    padding: 0.5em;
    line-height: 1.6em;
    align-self: center;
  }

  /* Because we are in mobile mode, we want to display it as a vertical list */
  nav ul {
    display: block;
  }

  /* We have two lists: the first one are the always visibile items in the 
        menu bar. The second one is the one that will be hidden */
  nav ul:last-child {
    width: 100%;
    flex-basis: 100%;
  }

  nav ul li {
    margin-bottom: 0;
    width: 100%;
    text-align: right;
    padding: 0.5em;
  }
}
</style>
