<script setup lang="ts">
definePageMeta({
  middleware: 'auth',
  layout: 'defaultdashboard',
});
const supabase = useSupabaseClient();
const { data } = await supabase.auth.getClaims();
const user = data?.claims;

const { data: profileData, error } = await supabase
  .from('profiles')
  .select()
  .eq('user_id', user?.sub)
  .single();

async function role_update(newRole: string) {
  if (!user?.sub) {
    throw new Error('User not authenticated');
  }

  const { error } = await supabase
    .from('profiles')
    .update({ role: newRole })
    .eq('user_id', user.sub);

  if (error) {
    console.error('Error updating role:', error);
    showErrorToast();
    throw new Error('Failed to update role');
  }
  showToast();
  console.log('Role updated successfully');
}

const toast = useToast();

function showToast() {
  toast.add({
    title: 'Success',
    description: 'Role updated successfully',
    type: 'foreground',
  });
}

function showErrorToast() {
  toast.add({
    title: 'Error',
    color: 'error',
    description: 'Failed to update role',
    type: 'foreground',
  });
}

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
    <div class="container mx-auto">
      <h1>Profile {{ $t('language') }}</h1>
      <h2>{{ $t('welcome') }}</h2>
      {{ user?.sub }}
      <div>
        <select class="select" @change="role_update($event.target.value)">
          <option value="" selected disabled>Select role</option>
          <option
            v-for="role in [
              'user',
              'contributor',
              'editor',
              'manager',
              'superuser',
            ]"
            :key="role"
            :value="role"
            :selected="profileData?.role === role"
          >
            {{ role }}
          </option>
        </select>
      </div>
      <div v-if="profileData">
        <div>Modified: {{ useTimeAgo(profileData.modified_at) }}</div>
        <div>
          Registered:
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
