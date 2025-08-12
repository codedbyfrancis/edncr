<script lang="ts">
import { useHead, onMounted } from '#imports';
import { useSupabaseClient } from '#imports';

const supabase = useSupabaseClient();
const config = useRuntimeConfig();

useHead({
  script: [
    {
      src: 'https://accounts.google.com/gsi/client',
      async: true,
      defer: true,
    },
  ],
});

function handleGoogleCredentialResponse(response: any) {
  // Send the credential to Supabase
  supabase.auth
    .signInWithIdToken({
      provider: 'google',
      token: response.credential,
    })
    .then(({ error, data }) => {
      if (error) {
        // handle error
        alert(error.message);
      } else {
        // handle success, e.g., redirect
        window.location.href = '/dashboard';
      }
    });
}

onMounted(() => {
  // @ts-ignore
  window.handleGoogleCredentialResponse = handleGoogleCredentialResponse;

  // @ts-ignore
  window.google?.accounts.id.initialize({
    client_id: config.public.googleClientId,
    callback: handleGoogleCredentialResponse,
    auto_select: true,
    cancel_on_tap_outside: false,
  });

  // @ts-ignore
  window.google?.accounts.id.prompt();
});
console.log(
  'Google One Tap initialized with client ID:',
  config.public.googleClientId
);
</script>
<template>
  <div>
    <!-- Google One Tap will appear automatically, no button needed -->
  </div>
</template>
