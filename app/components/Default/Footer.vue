<template>
  <div class="footer">
    <div>
      <div class="copyright">
        <span>ⓒ Copyright {{ new Date().getFullYear() }}</span>
      </div>
      <div class="cbf">
        <span
          >This website was CodedbyFrancis
          <LogoCbf
            :fill="`var(--logo-fill)`"
            :width="0.8"
            :height="0.8"
          />.</span
        >
      </div>
    </div>
    <ClientOnly>
      <div><VueuseUseNow /></div>
    </ClientOnly>
  </div>
</template>
<style lang="css" scoped>
@reference "tailwindcss";
.footer {
  @apply text-center py-5;
  .copyright {
    @apply flex flex-row items-center justify-center gap-2 text-base;
  }
  .cbf,
  span {
    @apply flex flex-row justify-center items-center gap-2 text-sm;
  }
}
</style>
