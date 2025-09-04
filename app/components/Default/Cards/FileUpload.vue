<template>
  <form @submit.prevent="submitFile" class="my-5">
    <div class="flex flex-col gap-3">
      <h2>Upload file</h2>
      <label for="file">Select a file:</label>
      <input
        type="file"
        id="file"
        @change="fileSelected"
        :disabled="submitButton"
      />

      <UButton
        :disabled="submitButton"
        type="submit"
        :ui="{
          base: 'cursor-pointer bg-[var(--primary)]/95 text-[var(--on-primary)]/90 hover:bg-[var(--primary)] hover:text-[var(--on-primary)] w-full rounded-full justify-center py-4 text-xl',
        }"
        >Submit</UButton
      >
    </div>
    <div v-if="error">{{ error }}</div>
    <div v-if="success">
      <div>File uploaded successfully!</div>
      <div>File URL: {{ filePublicUrl }}</div>
      <div v-if="signedUrl">
        Signed URL: {{ JSON.stringify(signedUrl) }} (expires in 60seconds)
      </div>
    </div>
  </form>
</template>

<script setup>
import { ref } from 'vue';
const supabase = useSupabaseClient();

const fileInput = ref(null);
const file = ref(null);
const error = ref(null);
const success = ref(false);
const filePublicUrl = ref(null);
const submitButton = ref(false);
const signedUrl = ref('');

function fileSelected(event) {
  file.value = event.target.files[0];
}

function validateFile() {
  if (!file.value) return true;
  const isCsv =
    file.value.type === 'text/csv' ||
    file.value.type ===
      'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet';
  const isUnder5mb = file.value.size < 5 * 1024 * 1024;
  if (!isCsv) {
    error.value = 'Please select a CSV file';
    return false;
  }
  if (!isUnder5mb) {
    error.value = 'Please select a file under 5MB in size';
    return false;
  }
  return true;
}

async function submitFile() {
  error.value = null;
  success.value = null;
  if (!validateFile()) return;

  if (!file.value) {
    error.value = 'Please select a file';
    return;
  }

  const filePath = `${Date.now()}_${file.value.name}`;
  const { data, error: uploadError } = await supabase.storage
    .from('campaigns')
    .upload(filePath, file.value, { upsert: true });

  if (uploadError) {
    error.value = uploadError.message;
  } else {
    // Generate public URL
    const { data: publicData } = supabase.storage
      .from('campaigns')
      .getPublicUrl(filePath);
    submitButton.value = true;
    success.value = true;
    filePublicUrl.value = publicData.publicUrl;
    signedUrl.value = createSignedUrl(filePath);
  }
}

async function createSignedUrl(filePath) {
  const { data, error } = await supabase.storage
    .from('campaigns')
    .createSignedUrl(filePath, 60); // 60 = expires in 60 seconds

  if (data) {
    // console.log('Signed URL:', data.signedUrl);
    signedUrl.value = data.signedUrl;
    return data.signedUrl;
  }
}
</script>
