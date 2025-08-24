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
  const { data } = await useFetch('/api/gemini', {
    method: 'POST',
    body: { message: userMessage.value },
  });
  loading.value = false;
  reply.value = md.render(data.value);
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
        handle: ['shrink-0 !bg-[var(--primary)]', 'transition-opacity'],
        container: 'bg-[var(--surface-container)]',
        content: 'bg-[var(--surface-container)] rounded-t-4xl px-4 ring-0',
        overlay:
          'bg-[var(--surface-container)]/75 backdrop-filter backdrop-grayscale backdrop-blur-lg backdrop-contrast-100',
      }"
    >
      <div class="flex flex-col p-5 justify-center items-center">
        <UIcon
          name="streamline:artificial-intelligence-spark-remix"
          class="p-10 bg-[var(--primary-container)]/90 hover:bg-[var(--primary-container)]"
        />
      </div>
      <template #content>
        <!-- <Placeholder class="h-48 m-4" /> -->
        <div class="py-8">
          <h2 class="py-2">AI Explain</h2>
          <div class="h-[50vh] overflow-y-auto pt-4">
            <div>
              <DefaultCardsCallAiGenerate />
            </div>
            <div class="py-6 px-4">
              <div v-if="loading">Gemini is thinking... please wait.</div>
              <div
                v-if="reply"
                class="box prose dark:prose-invert p-8 bg-[var(--surface-container-high)] rounded-4xl"
                v-html="reply"
              ></div>
            </div>
          </div>
          <div class="pt-4">
            <h3>Do you have any questions?</h3>
            <div class="flex flex-col">
              <input
                v-model="userMessage"
                placeholder="What would you like to ask..."
                class="border p-2"
              />
              <button
                @click="sendMessageFollowUp"
                class="bg-[var(--primary)] text-white p-2 my-2 rounded-full"
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
