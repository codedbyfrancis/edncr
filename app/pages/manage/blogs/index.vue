<script setup lang="ts">
import { useI18n } from 'vue-i18n';

definePageMeta({
  middleware: 'auth',
  layout: 'defaultdashboard',
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

// Fetch all blogs data
const { data: blogsData } = await supabase
  .from('blogs')
  .select(
    `
    id,
    slug,
    status,
    created_at,
    user_id,
    blogs_translations!inner(*)
  `
  )
  .order('created_at', { ascending: false });

const config = useRuntimeConfig();
useSeoMeta({
  title: 'Manage Blogs',
  ogTitle: 'Manage Blogs' + ' | ' + config.public.appName,
  description: 'Manage all blogs in the system',
  ogDescription: 'Manage all blogs in the system',
  ogUrl: config.public.appUrl + '/manage/blogs',
  ogType: 'website',
  ogSiteName: config.public.appName,
  ogImage: config.public.imageCdnUrl + '/icons/android-chrome-512x512.png',
  twitterCard: 'summary_large_image',
});

const { locale } = useI18n();

const getTranslatedBlog = (blog: any) => {
  const translated = blog.blogs_translations.find(
    (t: any) => t.lang === locale.value
  );
  if (translated) {
    return translated;
  } else {
    // Fallback to English if current locale translation is not found
    return (
      blog.blogs_translations.find((t: any) => t.lang === 'en') ||
      blog.blogs_translations[0]
    );
  }
};

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
          Manage Blogs
        </h1>
        <UButton
          color="primary"
          size="lg"
          to="/manage/blogs/create"
          icon="i-heroicons-plus"
        >
          Create New Blog
        </UButton>
      </div>

      <div v-if="blogsData && blogsData.length > 0" class="space-y-4">
        <UCard
          v-for="blog in blogsData"
          :key="blog.id"
          class="hover:shadow-lg transition-shadow"
        >
          <div class="flex justify-between items-start">
            <div class="flex-1">
              <div class="flex items-center gap-3 mb-2">
                <h3 class="text-xl font-semibold text-gray-900 dark:text-white">
                  {{ getTranslatedBlog(blog)?.title }}
                </h3>
                <UBadge
                  :color="getStatusColor(blog.status)"
                  variant="subtle"
                  size="sm"
                >
                  {{ blog.status.replace('_', ' ') }}
                </UBadge>
              </div>

              <p
                v-if="getTranslatedBlog(blog)?.sub_title"
                class="text-gray-600 dark:text-gray-300 mb-3"
              >
                {{ getTranslatedBlog(blog)?.sub_title }}
              </p>

              <div class="flex flex-wrap gap-2 mb-3">
                <UBadge color="blue" variant="soft" size="sm">
                  {{ getTranslatedBlog(blog)?.category }}
                </UBadge>
                <UBadge
                  v-if="getTranslatedBlog(blog)?.sub_category"
                  color="purple"
                  variant="soft"
                  size="sm"
                >
                  {{ getTranslatedBlog(blog)?.sub_category }}
                </UBadge>
              </div>

              <div class="text-sm text-gray-500 dark:text-gray-400 space-y-1">
                <div class="flex items-center gap-2">
                  <UIcon name="i-heroicons-calendar" class="w-4 h-4" />
                  <span>Created: {{ formatDate(blog.created_at) }}</span>
                </div>

                <div
                  v-if="getTranslatedBlog(blog)?.modified_at"
                  class="flex items-center gap-2"
                >
                  <UIcon name="i-heroicons-pencil-square" class="w-4 h-4" />
                  <span
                    >Modified:
                    {{ formatDate(getTranslatedBlog(blog)?.modified_at) }}</span
                  >
                </div>

                <div
                  v-if="getTranslatedBlog(blog)?.approved_at"
                  class="flex items-center gap-2"
                >
                  <UIcon name="i-heroicons-check-circle" class="w-4 h-4" />
                  <span
                    >Approved:
                    {{ formatDate(getTranslatedBlog(blog)?.approved_at) }}</span
                  >
                </div>
              </div>
            </div>

            <div class="flex items-center gap-2 ml-4">
              <UButton
                color="gray"
                variant="ghost"
                size="sm"
                :to="`/blog/${blog.slug}`"
                icon="i-heroicons-eye"
              >
                View
              </UButton>

              <UButton
                v-if="
                  profileData?.role === 'manager' ||
                  profileData?.role === 'superuser' ||
                  blog.user_id === user.sub
                "
                color="primary"
                variant="ghost"
                size="sm"
                :to="`/manage/blogs/edit/${blog.id}`"
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
                      disabled: blog.status === 'approved',
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
          No blogs found
        </h3>
        <p class="text-gray-500 dark:text-gray-400 mb-6">
          Get started by creating your first blog post.
        </p>
        <UButton
          color="primary"
          to="/manage/blogs/create"
          icon="i-heroicons-plus"
        >
          Create New Blog
        </UButton>
      </div>
    </div>
  </section>

  <section v-else>
    <DefaultAccessDenied />
  </section>
</template>
