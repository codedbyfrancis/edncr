<template>
  <div class="flex flex-col pb-12 px-2">
    <div class="steps_container">
      <UIcon name="material-symbols:sms-outline-rounded" class="icons" />
      <span>Receive SMS with call details.</span>
    </div>
    <div>
      <UIcon
        name="material-symbols:arrow-cool-down-rounded"
        class="steps_dots"
      />
    </div>
    <div class="steps_container">
      <UIcon
        name="material-symbols:mobile-question-outline-rounded"
        class="icons"
      />
      <span>Choose to Accept / Ignore / Reschedule / eDNCR the call.</span>
    </div>
    <div>
      <UIcon
        name="material-symbols:arrow-cool-down-rounded"
        class="steps_dots"
      />
    </div>
    <div class="steps_container">
      <UIcon
        name="material-symbols:shield-question-outline-rounded"
        class="icons"
      />
      <span>Company will call or must block you from their database.</span>
    </div>
  </div>
</template>
<style lang="css" scoped>
@reference "tailwindcss";
.steps_container {
  @apply flex justify-center items-center gap-1 mx-auto bg-[var(--surface-container)] text-[var(--on-surface)] px-4 py-2 rounded-2xl;
}
.steps_dots {
  @apply flex justify-center items-center mx-auto size-5 p-5 my-1 text-[var(--on-surface)]/50;
}
.icons {
  @apply p-4 text-[var(--on-surface-variant)];
}
</style>
