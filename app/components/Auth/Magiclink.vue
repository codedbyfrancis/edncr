<script setup lang="ts">
const supabase = useSupabaseClient();

const config = useRuntimeConfig();

const email = ref('');

const errorMsg = ref();
const successMsg = ref();

const loading = ref(true);
loading.value = false;

function isValidEmail() {
  // Simple email regex for validation
  return /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email.value);
}

async function signInWithOtp() {
  try {
    loading.value = true;
    errorMsg.value = null;
    successMsg.value = null;
    const { error } = await supabase.auth.signInWithOtp({
      email: email.value,
      options: {
        emailRedirectTo: window.location.origin + '/accounts/confirm',
      },
    });
    if (error) {
      errorMsg.value = error.message;
    } else {
      // router.push('/account');
      successMsg.value = 'Please check your email to login';
    }
  } catch (error) {
    errorMsg.value =
      error && typeof error === 'object' && 'message' in error
        ? (error as Error).message
        : String(error);
  } finally {
    loading.value = false;
  }
}
</script>
<template>
  <section class="auth-card">
    <div>
      <h3>Login with Magic Link</h3>
    </div>
    <div class="note">
      <div>No account registration needed.</div>
      <div>No password needed to log in.</div>
      <div>A link will be sent to your email.</div>
    </div>
    <div class="flex flex-col gap-2 w-full justify-center items-center">
      <UInput
        trailing-icon="i-lucide-at-sign"
        placeholder="Enter your email"
        size="md"
        v-model="email"
      />
      <UButton
        @click="signInWithOtp"
        class="auth-button rounded-form-buttons text-nowrap w-full"
        :disabled="!isValidEmail() || loading"
      >
        {{ loading ? 'Sending login email...' : 'Log in with Magic Link' }}
      </UButton>

      <UAlert
        v-if="errorMsg"
        color="error"
        title="Error"
        :description="errorMsg"
        icon="material-symbols:error-outline"
        class="alert"
      />
      <p v-if="errorMsg" class="form-error-message">{{ errorMsg }}.</p>
      <p v-if="successMsg" class="form-success-message">{{ successMsg }}.</p>
    </div>
  </section>
</template>
<style lang="css" scoped>
/* @reference "tailwindcss";
section {
  .auth-card {
    .note {
      @apply pb-3 text-pretty text-sm py-3;
    }
    button {
      @apply flex flex-row justify-center items-center bg-[color:var(--inverse-primary)] hover:bg-[color:var(--primary)] text-[color:var(--on-inverse-primary)] hover:text-[color:var(--on-primary)] px-6 p-2 rounded-full;
    }
  }
} */
</style>
