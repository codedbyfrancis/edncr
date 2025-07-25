<script lang="ts" setup>
const supabase = useSupabaseClient();
const user = useSupabaseUser();

const loading = ref(false);

const signInWithGoogle = async () => {
  loading.value = true;
  const { error } = await supabase.auth.signInWithOAuth({
    provider: 'google',
    options: {
      redirectTo: window.location.origin + '/accounts/confirm',
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
    <div><h3>Log in with Google</h3></div>

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
          : 'Log in with Google'
      }}
    </UButton>
  </section>
</template>
<style lang="css" scoped>
/* @reference "tailwindcss";
section {
  .auth-card {
    .button {
      .icon {
        @apply p-3 mr-2;
      }
    }
  }
} */
</style>
