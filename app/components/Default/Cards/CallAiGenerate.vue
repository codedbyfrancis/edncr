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
  const data = await $fetch('/api/gemini', {
    method: 'POST',
    body: { message: chat },
  });
  loading.value = false;
  reply.value = md.render(data);
  // console.log(reply.value);
};

onMounted(() => {
  sendMessage();
});
</script>

<template>
  <div>
    <div v-if="loading">Gemini is thinking... please wait.</div>
    <p
      v-else
      class="md box prose dark:prose-invert py-3 px-4 bg-[var(--surface-container-high)] rounded-lg"
      v-html="reply"
    ></p>
  </div>
</template>
<style lang="css">
@reference "tailwindcss";
.md {
  p {
    @apply py-2;
  }
  hr {
    @apply py-2;
  }
  h3 {
    @apply py-2;
  }
  ol,
  ul,
  li {
    @apply py-2;
  }
}
</style>
