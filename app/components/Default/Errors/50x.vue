<script lang="ts" setup>
const config = useRuntimeConfig();
const mail = useMail();
const route = useRoute();
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
    new Date().toLocaleString() +
    '\nRoute: ' +
    JSON.stringify(route),
});
</script>
<template>
  <div>
    <h1>500 from /Default/Errors/500.vue</h1>
    <pre>Route: {{ route }}</pre>
  </div>
</template>
