<template>
  <div class="footer">
    <div>
      <div class="copyright">
        <LogoCbf :fill="`var(--logo-fill)`" :width="18" :height="18" />
        <span>Copyright</span>
      </div>
      <div class="cbf">
        <span>CodedbyFrancis</span>
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
    @apply flex flex-row items-center justify-center gap-2;
  }
  .cbf {
    @apply text-sm;
  }
}
</style>
