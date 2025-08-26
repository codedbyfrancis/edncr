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
      <div class="flex flex-col p-5 justify-center items-center">
        <UIcon
          name="streamline:artificial-intelligence-spark-remix"
          class="p-6 bg-[var(--primary-container)]/90 hover:bg-[var(--primary-container)]"
        />
      </div>
      <template #content>
        <!-- <Placeholder class="h-48 m-4" /> -->
        <div>
          <h2 class="py-2">AI Explain</h2>
          <div class="h-[50vh] overflow-y-auto pt-4">
            <div>
              <DefaultCardsCallAiGenerate />
            </div>
            <div class="py-6 px-4">
              <div v-if="loading">Gemini is thinking... please wait.</div>
              <div
                v-if="reply"
                class="md box prose dark:prose-invert p-8 bg-[var(--surface-container-high)] rounded-4xl"
                v-html="reply"
              ></div>
            </div>
          </div>
          <div class="pt-4">
            <h3>Do you have any questions?</h3>
            <div class="flex flex-col">
              <UInput
                v-model="userMessage"
                placeholder="What would you like to ask?"
                :ui="{
                  base: 'mt-2 py-2 text-lg bg-[var(--surface-container-high)] border-0 text-[var(--on-surface-container)]', // Set a custom background color for the input field
                  // You can also target specific states like focus or hover:
                  // focus: 'ring-red-500',
                  // hover: 'bg-red-300'
                }"
              />
              <button
                @click="sendMessageFollowUp"
                class="bg-[var(--primary-container)]/90 text-[var(--on-primary-container)] hover:bg-[var(--primary-container)] p-2 my-2 rounded-full"
              >
                Ask Gemini
              </button>
            </div>
          </div>
        </div>
      </template>
    </UDrawer>
  </div>
</template>
<style lang="css" scoped></style>
