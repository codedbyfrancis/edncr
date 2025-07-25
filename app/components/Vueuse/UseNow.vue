<script lang="ts" setup>
import { useNow } from '@vueuse/core';
const { now, pause, resume } = useNow({ controls: true });
</script>
<template>
  <ClientOnly>
    <section>
      {{ now }}
      <button @click="pause()">Pause</button>
      <button @click="resume()">Resume</button>
    </section>
  </ClientOnly>
</template>
