<script lang="ts" setup>
defineProps({
  data: { type: Object, default: '' },
});
</script>
<template>
  <section>
    <div class="page">
      <small>/Default/Pages/Blogs.vue</small>
      <div>
        <h1>{{ data.title }}</h1>
        <h2>{{ $t('welcome') }}</h2>
        <p>{{ data.description }}</p>
      </div>
    </div>
  </section>
</template>
