<script lang="ts" setup>
const route = useRoute();
const { locale } = useI18n();
// console.log(route);
</script>

<template>
  <div class="navigation-bottom py-4">
    <!-- <pre>{{ route }}</pre> -->
    <ul>
      <NuxtLinkLocale to="/" class="icon">
        <li>
          <span class="icon">
            <UIcon
              name="material-symbols:home"
              class="size-7"
              v-if="route.name === 'index___' + locale"
            />
            <UIcon v-else name="material-symbols:home-outline" class="size-7" />
          </span>
          <span class="name">Home</span>
        </li>
      </NuxtLinkLocale>

      <NuxtLinkLocale to="/about" class="icon">
        <li>
          <span class="icon">
            <UIcon
              v-if="route.name === 'about___' + locale"
              name="material-symbols:chat-info"
              class="size-7"
            />
            <UIcon
              v-else
              name="material-symbols:chat-info-outline"
              class="size-7"
            />
          </span>
          <span class="name">About</span>
        </li>
      </NuxtLinkLocale>

      <NuxtLinkLocale to="/contacts" class="icon">
        <li>
          <span class="icon">
            <UIcon
              v-if="route.name === 'contacts___' + locale"
              name="material-symbols:location-away"
              class="size-7"
            />
            <UIcon
              v-else
              name="material-symbols:location-away-outline"
              class="size-7"
            />
          </span>
          <span class="name">Contacts</span>
        </li>
      </NuxtLinkLocale>

      <NuxtLinkLocale to="/manage" class="icon">
        <li>
          <span class="icon">
            <UIcon
              v-if="route.name === 'manage___' + locale"
              name="material-symbols:settings-applications"
              class="size-7"
            />
            <UIcon
              v-else
              name="material-symbols:settings-applications-outline"
              class="size-7"
            />
          </span>
          <span class="name">Manage</span>
        </li>
      </NuxtLinkLocale>
    </ul>
  </div>
</template>
<style lang="css" scoped>
@reference "tailwindcss";

.navigation-bottom {
  @apply flex justify-center items-center w-full h-18 bg-[var(--surface-container-low)] text-[var(--on-surface-variant)] bottom-0 fixed z-100;
  ul {
    @apply flex items-center justify-center gap-5;
    li {
      @apply flex flex-col justify-center items-center;
      .icon {
        @apply px-4 pt-1 w-15 h-10 rounded-full hover:bg-[var(--on-surface-variant)]/10  hover:text-[var(--on-surface-variant)];
      }
      .name {
        @apply text-xs;
      }
    }
  }
  .router-link-active {
    .icon {
      @apply bg-[var(--primary-container)] hover:bg-[var(--primary-container)] text-[var(--on-primary-container)] hover:text-[var(--on-primary-container)];
    }
    .name {
      @apply text-[var(--primary-container-fixed)] font-semibold;
    }
  }
  .router-link-exact-active {
    .icon {
      @apply bg-[var(--primary-container)] hover:bg-[var(--primary-container)] text-[var(--on-primary-container)] hover:text-[var(--on-primary-container)];
    }
    .name {
      @apply text-[var(--primary-container-fixed)] font-semibold;
    }
  }
}
</style>
