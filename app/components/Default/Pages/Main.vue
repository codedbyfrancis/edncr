<script lang="ts" setup>
defineProps({
  data: { type: Object, default: '' },
});
const head = useLocaleHead({
  addDirAttribute: true,
  identifierAttribute: 'id',
  addSeoAttributes: true,
});
</script>
<template>
  <section>
    <div class="page">
      <small>/Default/Pages/Index.vue</small>
      <div>
        <h1 :dir="head.htmlAttrs.dir">{{ data.title }}</h1>
        <h2 :dir="head.htmlAttrs.dir">{{ $t('welcome') }}</h2>
        <p :dir="head.htmlAttrs.dir">{{ data.description }}</p>
      </div>
    </div>
  </section>
</template>
