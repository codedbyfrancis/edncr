<script lang="ts" setup>
const config = useRuntimeConfig();
import LogoMain from '~/assets/logo/logo.svg';
</script>

<template>
  <section class="footer">
    <div class="copyright">
      <span
        >ⓒ Copyright {{ new Date().getFullYear() }}
        {{ config.public.appName }}</span
      >
    </div>
    <div class="cbf">
      <span
        >This website was CodedbyFrancis
        <LogoMain class="text-[var(--logo-fill)]" />.
      </span>
    </div>

    <div class="datetime"><DevVueuseUseNow /></div>
  </section>
</template>
<style lang="css" scoped>
@reference "tailwindcss";
section,
.footer {
  @apply flex flex-col justify-center items-center text-center py-5 mb-12;
  .copyright {
    @apply flex flex-row items-center justify-center gap-2 text-base;
  }
  .cbf,
  span {
    @apply flex flex-row gap-1 justify-center items-center text-sm;
  }
  .datetime {
    @apply flex flex-row justify-center items-center text-xs;
  }
}
</style>
