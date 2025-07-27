<script setup lang="ts">
definePageMeta({
  middleware: 'auth',
  layout: 'default',
});
const supabase = useSupabaseClient();
// const {
//   data: { claims },
// } = await supabase.auth.getClaims();
const { data } = await supabase.auth.getClaims();
const user = data?.claims;

const { data: profileData, error } = await supabase
  .from('profiles')
  .select()
  .eq('user_id', user?.sub)
  .single();

// const user = useSupabaseUser();
const config = useRuntimeConfig();
useSeoMeta({
  title: 'Manage/Index',
  ogTitle: 'Manage/Index' + ' | ' + config.public.appName,
  description: 'Manage/Index description',
  ogDescription: 'Manage/Index description for social media',
  ogUrl: config.public.appUrl + '/account/',
  ogType: 'website',
  ogSiteName: config.public.appName,
  ogImage: config.public.imageCdnUrl + '/icons/android-chrome-512x512.png',
  twitterCard: 'summary_large_image',
});
</script>
<template>
  <section
    v-if="profileData.role === 'manager' || profileData.role === 'superuser'"
  >
    <div class="page">
      <h1>Manage/index {{ $t('language') }}</h1>
      <h2>
        {{ $t('welcome') }} <span v-if="user?.email">{{ user?.email }}</span
        ><span v-else>{{ user?.phone }}</span>
      </h2>
    </div>
  </section>
  <section v-else>
    <DefaultAccessDenied />
  </section>
</template>
