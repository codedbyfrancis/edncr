<script setup lang="ts">
definePageMeta({
  middleware: 'auth',
  layout: 'default',
});
const supabase = useSupabaseClient();
// const {
//   data: { user },
// } = await supabase.auth.getUser();
const { data } = await supabase.auth.getClaims();
const user = data?.claims;

console.log(data);

const { data: profileData, error } = await supabase.from('profiles').select();

const config = useRuntimeConfig();
useSeoMeta({
  title: 'Profile',
  ogTitle: 'Profile' + ' | ' + config.public.appName,
  description: 'Profile description',
  ogDescription: 'Profile description for social media',
  ogUrl: config.public.appUrl + '/account/',
  ogType: 'website',
  ogSiteName: config.public.appName,
  ogImage: config.public.imageCdnUrl + '/icons/android-chrome-512x512.png',
  twitterCard: 'summary_large_image',
});
</script>
<template>
  <section>
    <div class="page">
      <h1>Profile {{ $t('language') }}</h1>
      <h2>{{ $t('welcome') }}</h2>
      <div>Modified: {{ useTimeAgo(profileData[0].modified_at) }}</div>
      <div>
        Modified:
        {{
          useDateFormat(
            profileData[0].modified_at,
            'dddd, MMMM D, YYYY [at] hh:mm A'
          )
        }}
      </div>
      <pre>{{ profileData }}</pre>
      <pre>{{ data }}</pre>
    </div>
  </section>
</template>
