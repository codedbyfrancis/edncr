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
  title: 'Dashboard/Upload Campaign',
  ogTitle: 'Dashboard/Upload Campaign' + ' | ' + config.public.appName,
  description: 'Dashboard/Upload Campaign description',
  ogDescription: 'Dashboard/Upload Campaign description for social media',
  ogUrl: config.public.appUrl + '/dashboard/upload-campaign',
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
</script>
<template>
  <div>
    <h1>Upload Campaign</h1>
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
        <div class="mt-3">
          <UButton
            label="Submit campaign"
            :ui="{
              base: 'cursor-pointer bg-[var(--primary)]/95 text-[var(--on-primary)]/90 hover:bg-[var(--primary)] hover:text-[var(--on-primary)] w-full rounded-full justify-center py-4 text-xl',
            }"
          />
        </div>
      </div>
    </div>
  </div>
</template>
