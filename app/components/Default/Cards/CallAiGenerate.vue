<script setup lang="ts">
import { ref } from 'vue';
import MarkdownIt from 'markdown-it';

const userMessage = ref('');
const reply = ref('');
const reply2 = ref('');
const chat =
  'Focus in UAE. In less than 10 sentences, tell me about, Real Estate in Dubai, 2 bedroom in Dubai Marina.';
const loading = ref(false);
const loading2 = ref(false);

const sendMessage = async () => {
  loading.value = true;
  const md = new MarkdownIt();
  const { data } = await useFetch('/api/gemini', {
    method: 'POST',
    body: { message: chat },
  });
  reply.value = md.render(data.value);
  loading.value = false;
};

const sendMessageFollowUp = async () => {
  loading2.value = true;
  const md = new MarkdownIt();
  const { data } = await useFetch('/api/gemini', {
    method: 'POST',
    body: { message: chat + ' ' + userMessage.value },
  });
  reply2.value = md.render(data.value);
  loading2.value = false;
};

onMounted(() => {
  sendMessage();
});
</script>

<template>
  <div class="p-4">
    <div v-if="loading">Gemeni is thinking... please wait.</div>
    <div
      v-if="reply"
      class="box prose dark:prose-invert p-8 bg-[var(--surface-container-high)] rounded-4xl"
      v-html="reply"
    ></div>

    <div class="py-6">
      <!-- <div class="mt-4"><strong>Gemini:</strong> {{ reply }}</div> -->
      <div
        v-if="reply2"
        class="box prose dark:prose-invert p-8 bg-[var(--surface-container-high)] rounded-4xl"
        v-html="reply2"
      ></div>
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
