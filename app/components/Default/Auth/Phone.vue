<script setup lang="ts">
const supabase = useSupabaseClient();
const router = useRouter();
const phone = ref('');
const password = ref<number[]>([]);

const errorMsg = ref();
const successMsg = ref();

const loading_phone = ref(true);
loading_phone.value = false;

const loading_otp = ref(true);
loading_otp.value = false;

function isValidPhone() {
  // Example: UAE phone numbers (9 digits, starts with 5)
  // Adjust the regex as needed for your requirements
  const phoneDigits = phone.value.replace(/\D/g, '');
  // return /^5\d{8}$/.test(phoneDigits); // For UAE numbers
  return /^3\d{11}$/.test(phoneDigits); // For Italy numbers
}

async function signInWithOtp() {
  try {
    loading_phone.value = true;
    errorMsg.value = null;
    successMsg.value = null;
    const { error } = await supabase.auth.signInWithOtp({
      phone: phone.value,
    });
    if (error) {
      errorMsg.value = error.message;
    } else {
      // router.push('/account');
      successMsg.value = 'Please check your phone for the OTP';
    }
  } catch (error) {
    errorMsg.value =
      error && typeof error === 'object' && 'message' in error
        ? (error as Error).message
        : String(error);
  } finally {
    loading_phone.value = false;
  }
}

async function verifyOtp() {
  try {
    loading_otp.value = true;
    errorMsg.value = null;
    successMsg.value = null;
    const {
      data: { session },
      error,
    } = await supabase.auth.verifyOtp({
      phone: phone.value,
      token: password.value.join(''),
      type: 'sms',
    });
    if (error) {
      errorMsg.value = error.message;
    } else {
      successMsg.value = 'OTP verified successfully!' + session;
      router.push('/dashboard');
    }
  } catch (error) {
    errorMsg.value =
      error && typeof error === 'object' && 'message' in error
        ? (error as Error).message
        : String(error);
  } finally {
    loading_otp.value = false;
  }
}
</script>
<template>
  <section class="auth-card">
    <div>
      <h3>Login with Phone</h3>
    </div>
    <div class="note">
      <div>No account registration needed.</div>
      <div>No password needed to log in.</div>
      <div>An OTP will be sent to your phone.</div>
      <div>393662536579</div>
    </div>
    <div class="flex flex-col gap-2">
      <div>
        <UInput
          placeholder="56 123 4567"
          class="input-phone"
          v-model="phone"
          :ui="{
            base: 'px-4 py-2 pl-22',
            leading: 'pointer-events-none',
          }"
        >
          <template #leading>
            <p class="text-sm text-muted pl-18">+971</p>
          </template>
        </UInput>
      </div>

      <div class="flex justify-center">
        <UButton
          :disabled="!isValidPhone() || loading_phone"
          @click="signInWithOtp"
          class="auth-button rounded-form-buttons"
          ><span>
            {{ loading_phone ? 'Sending login OTP...' : 'Send OTP' }}</span
          >
        </UButton>
      </div>

      <div>
        <UPinInput
          otp
          :length="6"
          v-model="password"
          type="number"
          class="auth-button pin"
        />
      </div>

      <div>
        <UButton
          @click="verifyOtp"
          class="auth-button rounded-form-buttons"
          :disabled="loading_otp"
          v-if="password && password.length > 0"
        >
          {{ loading_otp ? 'Verifying OTP...' : 'Login' }}
        </UButton>
      </div>

      <UAlert
        v-if="errorMsg"
        color="error"
        title="Error"
        :description="errorMsg"
        icon="material-symbols:error-outline"
        :ui="{
          icon: 'size-10',
        }"
      />
      <UAlert
        v-if="successMsg"
        color="success"
        title="Success"
        :description="successMsg"
        icon="material-symbols:check-circle"
        :ui="{
          icon: 'size-10',
        }"
      />
      <!-- <p v-if="errorMsg" class="form-error-message">{{ errorMsg }}.</p>
      <p v-if="successMsg" class="form-success-message">{{ successMsg }}.</p> -->
    </div>
  </section>
</template>
<style lang="css" scoped>
/* @reference "tailwindcss";

.auth-card {
  @apply w-full;
  .note {
    @apply pb-3 text-pretty text-sm py-3;
  }
  button {
    @apply flex flex-row justify-center items-center bg-[color:var(--inverse-primary)] hover:bg-[color:var(--primary)] text-[color:var(--on-inverse-primary)] hover:text-[color:var(--on-primary)] px-6 p-2 rounded-full;
  }
} */
</style>
