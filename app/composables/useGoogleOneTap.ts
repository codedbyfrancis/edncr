// Remove the url to allow
// chrome://settings/content/federatedIdentityApi

import { useHead, onMounted, useRuntimeConfig } from '#imports';
import { useSupabaseClient } from '#imports';

export function useGoogleOneTap(options?: {
  onSuccess?: (data: any) => void;
  onError?: (error: any) => void;
  redirectUrl?: string;
}) {
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
    supabase.auth
      .signInWithIdToken({
        provider: 'google',
        token: response.credential,
      })
      .then(({ error, data }) => {
        if (error) {
          options?.onError?.(error);
          if (!options?.onError) alert(error.message);
        } else {
          options?.onSuccess?.(data);
          if (options?.redirectUrl) {
            window.location.href = options.redirectUrl;
          }
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

    console.log('GoogleOneTap initialized.');

    // @ts-ignore
    window.google?.accounts.id.prompt();
  });
}
