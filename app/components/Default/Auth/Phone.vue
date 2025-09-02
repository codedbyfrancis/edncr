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
  return /^5\d{8}$/.test(phoneDigits); // For UAE numbers
  // return /^3\d{11}$/.test(phoneDigits); // For Italy numbers
}

async function signInWithOtp() {
  try {
    loading_phone.value = true;
    errorMsg.value = null;
    successMsg.value = null;
    const { data, error } = await supabase.auth.signInWithOtp({
      phone: phone.value,
    });
    if (error) {
      errorMsg.value = error.message;
    } else {
      // router.push('/account');
      successMsg.value =
        `Please check your phone for the OTP. ` + JSON.stringify(data);
      console.log('OTP sent.');
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
    const { data, error } = await supabase.auth.verifyOtp({
      phone: phone.value,
      token: password.value.join(''),
      type: 'sms',
    });
    if (error) {
      errorMsg.value = error.message;
    } else {
      successMsg.value = 'OTP verified successfully!' + JSON.stringify(data);
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
      <h3>{{ $t('log-in-with-uae-registered-phone') }}</h3>
    </div>
    <div class="note">
      <!-- <div>393662536579</div> -->

      <select v-model="phone" class="select">
        <option value="">Select a test user</option>
        <optgroup label="Company 1">
          <option value="500000100">Manager 1</option>
          <option value="500000101">Manager 2</option>
          <option value="500000110">Supervisor 1</option>
          <option value="500000120">Supervisor 2</option>
          <option value="500000111">Agent 1</option>
          <option value="500000112">Agent 2</option>
          <option value="500000113">Agent 3</option>
        </optgroup>
        <optgroup label="Company 2">
          <option value="500000200">Manager 1</option>
          <option value="500000201">Manager 2</option>
          <option value="500000210">Supervisor 1</option>
          <option value="500000220">Supervisor 2</option>
          <option value="500000211">Agent 1</option>
          <option value="500000212">Agent 2</option>
          <option value="500000213">Agent 3</option>
        </optgroup>
        <optgroup label="Users">
          <option value="500000001">User 1</option>
          <option value="500000002">User 2</option>
          <option value="500000003">User 3</option>
        </optgroup>
      </select>
    </div>
    <div class="flex flex-col gap-2">
      <div>
        <UInput
          placeholder="56 123 4567"
          class="input-phone"
          v-model="phone"
          :ui="{
            base: 'px-4 py-2 text-center text-lg',
          }"
        >
          <!-- <template #leading>
            <p class="hidden text-sm text-muted pl-18">+971</p>
          </template> -->
        </UInput>
      </div>

      <div class="flex justify-center">
        <UButton
          :disabled="!isValidPhone() || loading_phone"
          @click="signInWithOtp"
          class="auth-button rounded-form-buttons"
          ><span>
            {{ loading_phone ? 'Sending login OTP...' : $t('send-otp') }}</span
          >
        </UButton>
      </div>

      <div>
        <UPinInput
          otp
          :length="6"
          v-model="password"
          type="number"
          class="auth-button pin rounded-full"
        />
      </div>

      <div class="flex justify-center">
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
          title: 'text-left',
          description: 'text-left',
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
          title: 'text-left',
          description: 'text-left',
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
