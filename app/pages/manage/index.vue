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
  .eq('user_id', user.sub)
  .in('role', ['contributor', 'editor', 'manager', 'superuser'])
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
    v-if="profileData?.role === 'manager' || profileData?.role === 'superuser'"
  >
    <div class="page">
      <NuxtLink
        to="/manage/pages"
        class="px-4 py-2 bg-blue-500 text-white rounded hover:bg-blue-600"
      >
        Pages
      </NuxtLink>
      <NuxtLink
        to="/manage/blogs"
        class="px-4 py-2 bg-blue-500 text-white rounded hover:bg-blue-600"
      >
        Blogs
      </NuxtLink>
    </div>
  </section>
  <section v-else>
    <DefaultAccessDenied />
  </section>
</template>
