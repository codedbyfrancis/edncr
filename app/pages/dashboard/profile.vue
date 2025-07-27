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

const { data: profileData, error } = await supabase
  .from('profiles')
  .select()
  .eq('user_id', user.sub)
  .single();

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
      <div v-if="profileData">
        <div>Modified: {{ useTimeAgo(profileData.modified_at) }}</div>
        <div>
          Modified:
          {{
            useDateFormat(
              profileData.modified_at,
              'dddd, MMMM D, YYYY [at] hh:mm A'
            )
          }}
        </div>
        <pre>{{ profileData }}</pre>
      </div>
      <div v-else-if="error">
        <p>Could not load profile: {{ error.message }}</p>
      </div>
      <pre>{{ data }}</pre>
    </div>
  </section>
</template>
