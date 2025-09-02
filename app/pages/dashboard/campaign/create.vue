<script setup lang="ts">
definePageMeta({
  middleware: 'auth',
  layout: 'defaultdashboard',
});
import { CalendarDate } from '@internationalized/date';
const supabase = useSupabaseClient();
// const {
//   data: { claims },
// } = await supabase.auth.getClaims();
const { data } = await supabase.auth.getClaims();
const user = data?.claims;

// const user = useSupabaseUser();
const config = useRuntimeConfig();
useSeoMeta({
  title: 'Dashboard/create Campaign',
  ogTitle: 'Dashboard/create Campaign' + ' | ' + config.public.appName,
  description: 'Dashboard/create Campaign description',
  ogDescription: 'Dashboard/create Campaign description for social media',
  ogUrl: config.public.appUrl + '/dashboard/campaign-create',
  ogType: 'website',
  ogSiteName: config.public.appName,
  ogImage: config.public.imageCdnUrl + '/icons/android-chrome-512x512.png',
  twitterCard: 'summary_large_image',
});
const name = ref('');
const details = ref('');
const target_area = ref('');
const today = new Date();
const daterange = ref({
  start: new CalendarDate(
    today.getFullYear(),
    today.getMonth() + 1,
    today.getDate()
  ),
  end: new CalendarDate(
    today.getFullYear(),
    today.getMonth() + 1,
    today.getDate() + 7
  ),
});
const database = ref('');

const fileUploadValidation = (file: File) => {
  const acceptedTypes = [
    'text/csv',
    'application/vnd.ms-excel',
    'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet',
  ];

  const acceptedSize = 5242880; // 5MB limit
  if (!acceptedTypes.includes(file.type)) {
    return {
      valid: false,
      message: 'Only csv and xslx files are allowed',
    };
  }
  if (file.size > acceptedSize) {
    return {
      valid: false,
      message: 'File size must be less than 5mb',
    };
  }
  return {
    valid: true,
  };
};

const onCreateCampaign = async () => {
  const validation = fileUploadValidation(database.value);
  if (validation.valid) {
    alert('success', validation.message);
  } else {
    alert('error', database.value);
  }
};
</script>
<template>
  <div>
    <h1>Create Campaign</h1>
    <div class="flex flex-col w-full lg:w-1/2 mx-auto gap-3">
      <div class="flex flex-col">
        <label for="name">Campaign name:</label
        ><UInput v-model="name" id="name" />
      </div>
      <div class="flex flex-col">
        <label for="details">Campaign details:</label>
        <UTextarea v-model="details" id="details" />
      </div>
      <div class="flex flex-col">
        <label for="target_area">Campaign target area:</label>
        <UInput v-model="target_area" id="target_area" />
      </div>
      <div class="flex flex-col">
        <label for="target_area">Campaign duration:</label>
        <div>
          <UCalendar
            range
            v-model="daterange"
            size="lg"
            :min-value="
              new CalendarDate(
                today.getFullYear(),
                today.getMonth() + 1,
                today.getDate()
              )
            "
            :max-value="
              new CalendarDate(
                today.getFullYear() + 1,
                today.getMonth(),
                today.getDate()
              )
            "
          />
        </div>
      </div>
      <div>
        <UFileUpload
          v-model="database"
          layout="list"
          label="Drop your data here"
          description="csv, xlsx (max. 5MB)"
          class="w-full"
          :ui="{
            base: 'min-h-16',
          }"
          :validation="fileUploadValidation"
        />
      </div>
      <div>
        <UButton
          @click="onCreateCampaign"
          label="Create campaign"
          :ui="{
            base: 'cursor-pointer bg-[var(--primary)]/95 text-[var(--on-primary)]/90 hover:bg-[var(--primary)] hover:text-[var(--on-primary)] w-full rounded-full justify-center py-4 text-xl',
          }"
        />
      </div>
      <!-- <div>{{ fileUploadValidation(database) }}</div> -->
    </div>
  </div>
</template>
