<script setup lang="ts">
const supabase = useSupabaseClient();
const router = useRouter();
const email = ref();

const show = ref(false);
const password = ref();
const errorMsg = ref();

const loading = ref(true);
loading.value = false;

function isValidEmailAndPassword() {
  const emailValid = /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email.value || '');
  const passwordValid =
    typeof password.value === 'string' && password.value.length >= 6;
  return emailValid && passwordValid;
}

async function signInWithEmail() {
  try {
    loading.value = true;
    errorMsg.value = null;
    const { error } = await supabase.auth.signInWithPassword({
      email: email.value,
      password: password.value,
    });
    if (error) {
      errorMsg.value = error.message;
    } else {
      router.push('/dashboard');
    }
  } catch (error) {
    alert('Error in catch');
    if (error instanceof Error) {
      errorMsg.value = error.message;
    } else {
      errorMsg.value = String(error);
    }
  } finally {
    loading.value = false;
  }
}
</script>
<template>
  <section class="auth-card">
    <h3>Login with Email and Password</h3>
    <UInput
      trailing-icon="i-lucide-at-sign"
      placeholder="Enter your email"
      size="md"
      v-model="email"
      :ui="{ base: 'w-full' }"
    />
    <UInput
      v-model="password"
      placeholder="Password"
      :type="show ? 'text' : 'password'"
      :ui="{ trailing: 'pe-1' }"
    >
      <template #trailing>
        <UButton
          color="neutral"
          variant="link"
          size="lg"
          :icon="show ? 'i-lucide-eye-off' : 'i-lucide-eye'"
          :aria-label="show ? 'Hide password' : 'Show password'"
          :aria-pressed="show"
          aria-controls="password"
          @click="show = !show"
          class="see-password"
        />
      </template>
    </UInput>

    <UButton
      @click="signInWithEmail"
      class="auth-button rounded-form-buttons"
      :disabled="!isValidEmailAndPassword() || loading"
    >
      {{ loading ? 'Signing in with email...' : 'Sign In with Email' }}
    </UButton>

    <UAlert
      v-if="errorMsg"
      color="error"
      title="Error"
      :description="errorMsg"
      icon="material-symbols:error-outline"
      class="alert"
    />
  </section>
</template>
<style lang="css" scoped>
@reference "tailwindcss";

/* section,
.auth-card {
  @apply flex flex-col gap-3;
  .note {
    @apply pb-3 text-pretty text-sm py-3;
  }
  input {
    @apply w-full bg-amber-200;
  }
  button {
    @apply flex flex-row justify-center items-center px-2 p-2 rounded-full;
    .see-password {
      @apply p-0;
    }
  }
} */
</style>
