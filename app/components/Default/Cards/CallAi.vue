<script setup lang="ts">
const { locale } = useI18n();
import { ref } from 'vue';
import MarkdownIt from 'markdown-it';

const reply = ref('');
const loading = ref(false);
const userMessage = ref('');

const sendMessageFollowUp = async () => {
  loading.value = true;
  const md = new MarkdownIt();
  const data = await $fetch('/api/gemini', {
    method: 'POST',
    body: { message: userMessage.value },
  });
  loading.value = false;
  reply.value = md.render(data);
  console.log(reply.value);
};
</script>

<template>
  <div class="px-2 mt-10">
    <h2>Explain with Artificial Intelligence.</h2>

    <UDrawer
      title="Drawer with description"
      description="Lorem ipsum dolor sit amet, consectetur adipiscing elit."
      :ui="{
        content: 'rounded-t-4xl',
      }"
    >
      <div class="cursor-pointer container mx-auto relative w-16 h-16 mt-3">
        <!-- Masked icon container -->
        <div
          class="absolute inset-0"
          style="
            -webkit-mask: url('https://api.iconify.design/streamline/artificial-intelligence-spark-remix.svg')
              no-repeat center / contain;
            mask: url('https://api.iconify.design/streamline/artificial-intelligence-spark-remix.svg')
              no-repeat center / contain;
            overflow: hidden;
          "
        >
          <!-- Rotating gradient layer, bigger than icon -->
          <div
            class="absolute -top-10 -left-10 w-[calc(100%+80px)] h-[calc(100%+80px)]"
            style="
              background: conic-gradient(#e10ac8, #220760, #76f8d2, #e10ac8);
              animation: spin 4s ease-in-out infinite;
            "
          ></div>
        </div>
      </div>
      <template #content>
        <!-- <Placeholder class="h-48 m-4" /> -->
        <div>
          <h2 class="py-2">AI Explain</h2>
          <div class="h-[50vh] overflow-y-auto pt-4">
            <div>
              <DefaultCardsCallAiGenerate />
            </div>
            <div class="py-6">
              <div v-if="loading">Gemini is thinking... please wait.</div>
              <div
                v-if="reply"
                class="md box prose dark:prose-invert py-3 px-4 bg-[var(--surface-container-high)] rounded-lg"
                v-html="reply"
              ></div>
            </div>
          </div>
          <div class="pt-4">
            <h3>Do you have any questions?</h3>
            <div class="flex flex-col mb-10">
              <UInput
                v-model="userMessage"
                placeholder="What would you like to ask?"
                :ui="{
                  base: 'my-2 py-2 text-lg bg-[var(--surface-container-high)] border-0 text-[var(--on-surface-container)]', // Set a custom background color for the input field
                  // You can also target specific states like focus or hover:
                  // focus: 'ring-red-500',
                  // hover: 'bg-red-300'
                }"
              />

              <UButton
                :disabled="!userMessage"
                @click="sendMessageFollowUp"
                size="xl"
                variant="solid"
                :ui="{
                  base: 'cursor-pointer bg-[var(--primary)]/95 text-[var(--on-primary)]/90 hover:bg-[var(--primary)] hover:text-[var(--on-primary)] w-full rounded-full justify-center py-4 text-xl',
                }"
                >Ask Gemini</UButton
              >
            </div>
          </div>
        </div>
      </template>
    </UDrawer>
  </div>
</template>
<style lang="css" scoped>
@reference 'tailwindcss';
@keyframes spin {
  0% {
    transform: rotate(0deg);
  }
  100% {
    transform: rotate(360deg);
  }
}
</style>
