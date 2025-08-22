<script lang="ts" setup>
const supabase = useSupabaseClient();
const user = useSupabaseUser();
const config = useRuntimeConfig();

const loading = ref(false);

const signInWithGoogle = async () => {
  loading.value = true;
  const { error } = await supabase.auth.signInWithOAuth({
    provider: 'google',
    options: {
      redirectTo: config.public.appUrl + '/accounts/confirm',
      // redirectTo: window.location.origin + '/accounts/confirm',
    },
  });
  if (error) {
    loading.value = false;
    console.log(error);
  } else console.log('Redirecting to Google for authentication');
};
</script>
<template>
  <section class="auth-card">
    <div>
      <h3>{{ $t('log-in-with-google') }}</h3>
    </div>

    <UButton
      icon="mdi:google"
      size="md"
      color="primary"
      variant="solid"
      @click="signInWithGoogle"
      class="rounded-form-buttons"
    >
      {{
        loading
          ? 'Redirecting to Google for authentication'
          : $t('log-in-with-google')
      }}
    </UButton>
  </section>
</template>
<style lang="css" scoped>
@reference 'tailwindcss';
section,
.auth-card {
  @apply flex flex-col justify-center items-center;
}
</style>
