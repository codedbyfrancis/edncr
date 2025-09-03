<template>
  <form @submit.prevent="submitFile" class="my-5">
    <div class="flex flex-col gap-3">
      <h2>Upload file</h2>
      <label for="file">Select a file:</label>
      <input type="file" id="file" @change="fileSelected" />

      <UButton
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

function fileSelected(event) {
  file.value = event.target.files[0];
}

async function submitFile() {
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
      .from('files')
      .getPublicUrl(filePath);

    success.value = true;
    filePublicUrl.value = publicData.publicUrl;
  }
}
</script>
