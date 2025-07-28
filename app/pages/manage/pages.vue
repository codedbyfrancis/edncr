<script setup lang="ts">
definePageMeta({
  middleware: 'auth',
  layout: 'default',
});

const supabase = useSupabaseClient();
const { data } = await supabase.auth.getClaims();
const user = data?.claims;

if (!user?.sub) {
  throw createError({
    statusCode: 401,
    statusMessage: 'Authentication required',
  });
}

const { data: profileData } = await supabase
  .from('profiles')
  .select('*')
  .eq('user_id', user.sub)
  .in('role', ['contributor', 'editor', 'manager', 'superuser'])
  .single();

// Fetch all pages data
const { data: pagesData } = await supabase
  .from('pages')
  .select(`
    id,
    slug,
    status,
    created_at,
    user_id,
    pages_translations!inner(*)
  `)
  .order('created_at', { ascending: false });

const config = useRuntimeConfig();
useSeoMeta({
  title: 'Manage Pages',
  ogTitle: 'Manage Pages' + ' | ' + config.public.appName,
  description: 'Manage all pages in the system',
  ogDescription: 'Manage all pages in the system',
  ogUrl: config.public.appUrl + '/manage/pages',
  ogType: 'website',
  ogSiteName: config.public.appName,
  ogImage: config.public.imageCdnUrl + '/icons/android-chrome-512x512.png',
  twitterCard: 'summary_large_image',
});

const getStatusColor = (status: string) => {
  switch (status) {
    case 'approved':
      return 'success';
    case 'for_review':
      return 'warning';
    case 'editing':
      return 'info';
    case 'for_modification':
      return 'warning';
    case 'deleted':
      return 'error';
    default:
      return 'neutral';
  }
};

const formatDate = (dateString: string) => {
  if (!dateString) return 'N/A';
  return new Date(dateString).toLocaleDateString('en-US', {
    year: 'numeric',
    month: 'short',
    day: 'numeric',
  });
};
</script>

<template>
  <section
    v-if="
      profileData?.role === 'manager' ||
      profileData?.role === 'superuser' ||
      profileData?.role === 'editor'
    "
  >
    <div class="container mx-auto px-4 py-8">
      <div class="flex justify-between items-center mb-6">
        <h1 class="text-3xl font-bold text-gray-900 dark:text-white">
          Manage Pages
        </h1>
        <UButton
          color="primary"
          size="lg"
          to="/manage/pages/create"
          icon="i-heroicons-plus"
        >
          Create New Page
        </UButton>
      </div>

      <div v-if="pagesData && pagesData.length > 0" class="space-y-4">
        <UCard
          v-for="page in pagesData"
          :key="page.id"
          class="hover:shadow-lg transition-shadow"
        >
          <div class="flex justify-between items-start">
            <div class="flex-1">
              <div class="flex items-center gap-3 mb-2">
                <h3 class="text-xl font-semibold text-gray-900 dark:text-white">
                  {{ page.pages_translations[0]?.title }}
                </h3>
                <UBadge
                  :color="getStatusColor(page.status)"
                  variant="subtle"
                  size="sm"
                >
                  {{ page.status.replace('_', ' ') }}
                </UBadge>
              </div>

              <p
                v-if="page.pages_translations[0]?.sub_title"
                class="text-gray-600 dark:text-gray-300 mb-3"
              >
                {{ page.pages_translations[0]?.sub_title }}
              </p>

              <div class="flex flex-wrap gap-2 mb-3">
                <UBadge color="blue" variant="soft" size="sm">
                  {{ page.pages_translations[0]?.category }}
                </UBadge>
                <UBadge
                  v-if="page.pages_translations[0]?.sub_category"
                  color="purple"
                  variant="soft"
                  size="sm"
                >
                  {{ page.pages_translations[0]?.sub_category }}
                </UBadge>
              </div>

              <div class="text-sm text-gray-500 dark:text-gray-400 space-y-1">
                <div class="flex items-center gap-2">
                  <UIcon name="i-heroicons-calendar" class="w-4 h-4" />
                  <span>Created: {{ formatDate(page.created_at) }}</span>
                </div>

                <div v-if="page.pages_translations[0]?.modified_at" class="flex items-center gap-2">
                  <UIcon name="i-heroicons-pencil-square" class="w-4 h-4" />
                  <span>Modified: {{ formatDate(page.pages_translations[0]?.modified_at) }}</span>
                </div>

                <div v-if="page.pages_translations[0]?.approved_at" class="flex items-center gap-2">
                  <UIcon name="i-heroicons-check-circle" class="w-4 h-4" />
                  <span>Approved: {{ formatDate(page.pages_translations[0]?.approved_at) }}</span>
                </div>
              </div>
            </div>

            <div class="flex items-center gap-2 ml-4">
              <UButton
                color="gray"
                variant="ghost"
                size="sm"
                :to="`/page/${page.slug}`"
                icon="i-heroicons-eye"
              >
                View
              </UButton>

              <UButton
                v-if="
                  profileData?.role === 'manager' ||
                  profileData?.role === 'superuser' ||
                  page.user_id === user.sub
                "
                color="primary"
                variant="ghost"
                size="sm"
                :to="`/manage/pages/edit/${page.id}`"
                icon="i-heroicons-pencil"
              >
                Edit
              </UButton>

              <UDropdown
                v-if="
                  profileData?.role === 'manager' ||
                  profileData?.role === 'superuser'
                "
                :items="[
                  [
                    {
                      label: 'Approve',
                      icon: 'i-heroicons-check-circle',
                      disabled: page.status === 'approved',
                    },
                    {
                      label: 'Request Changes',
                      icon: 'i-heroicons-exclamation-triangle',
                    },
                    {
                      label: 'Delete',
                      icon: 'i-heroicons-trash',
                      color: 'red',
                    },
                  ],
                ]"
              >
                <UButton
                  color="gray"
                  variant="ghost"
                  icon="i-heroicons-ellipsis-vertical"
                  size="sm"
                />
              </UDropdown>
            </div>
          </div>
        </UCard>
      </div>

      <div v-else class="text-center py-12">
        <UIcon
          name="i-heroicons-document-text"
          class="w-16 h-16 text-gray-400 mx-auto mb-4"
        />
        <h3 class="text-lg font-medium text-gray-900 dark:text-white mb-2">
          No pages found
        </h3>
        <p class="text-gray-500 dark:text-gray-400 mb-6">
          Get started by creating your first page.
        </p>
        <UButton
          color="primary"
          to="/manage/pages/create"
          icon="i-heroicons-plus"
        >
          Create New Page
        </UButton>
      </div>
    </div>
  </section>

  <section v-else>
    <DefaultAccessDenied />
  </section>
</template>