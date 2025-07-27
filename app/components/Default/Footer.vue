<template>
  <section class="footer">
    <div class="copyright">
      <span>ⓒ Copyright {{ new Date().getFullYear() }}</span>
    </div>
    <div class="cbf">
      <span
        >This website was CodedbyFrancis
        <LogoCbf :fill="`var(--logo-fill)`" :width="0.8" :height="0.8" />.</span
      >
    </div>

    <div class="datetime"><VueuseUseNow /></div>
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
    @apply flex flex-row justify-center items-center gap-2 text-sm;
  }
  .datetime {
    @apply flex flex-row justify-center items-center text-xs;
  }
}
</style>
