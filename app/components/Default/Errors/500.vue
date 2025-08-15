<script lang="ts" setup>
const config = useRuntimeConfig();
const mail = useMail();
const props = defineProps({
  error: Object,
});

mail.send({
  from: config.public.email,
  subject:
    config.public.appName +
    ': ' +
    props.error?.statusCode +
    ': ' +
    props.error?.message,
  text:
    'Error: ' +
    props.error?.statusCode +
    ' ' +
    props.error?.message +
    '\nTime: ' +
    new Date().toLocaleString(),
});
</script>
<template>
  <div>
    <h1>500 from /Default/Errors/500.vue</h1>
  </div>
</template>
