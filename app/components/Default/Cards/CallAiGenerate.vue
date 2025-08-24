<script setup lang="ts">
import { ref } from 'vue';
import MarkdownIt from 'markdown-it';

const userMessage = ref('');
const reply = ref('');
const chat =
  'In UAE. In less than 3 sentences, tell me about, Real Estate in Dubai, 2 bedroom in Dubai Marina.';
const loading = ref(false);

const sendMessage = async () => {
  loading.value = true;
  const md = new MarkdownIt();
  const { data } = await useFetch('/api/gemini', {
    method: 'POST',
    body: { message: chat },
  });
  loading.value = false;
  reply.value = md.render(data.value);
};

onMounted(() => {
  sendMessage();
});
</script>

<template>
  <div class="p-4">
    <div v-if="loading">Gemini is thinking... please wait.</div>
    <div
      v-else
      class="box prose dark:prose-invert p-8 bg-[var(--surface-container-high)] rounded-4xl"
      v-html="reply"
    ></div>
  </div>
</template>
