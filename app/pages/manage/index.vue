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

const { data: profileData, error } = await supabase
  .from('profiles')
  .select()
  .eq('user_id', user.sub)
  .in('role', ['contributor', 'editor', 'manager', 'superuser'])
  .single();

// Fetch all pages and blogs
const { data: allPages } = await supabase
  .from('pages_translations')
  .select('status');

const { data: allBlogs } = await supabase
  .from('blogs_translations')
  .select('status');

// Group by status in JavaScript
const pagesStats =
  allPages?.reduce((acc, page) => {
    acc[page.status] = (acc[page.status] || 0) + 1;
    return acc;
  }, {} as Record<string, number>) || {};

const blogsStats =
  allBlogs?.reduce((acc, blog) => {
    acc[blog.status] = (acc[blog.status] || 0) + 1;
    return acc;
  }, {} as Record<string, number>) || {};

const totalPages = allPages?.length || 0;
const totalBlogs = allBlogs?.length || 0;

const approvedPages = pagesStats.approved || 0;
const approvedBlogs = blogsStats.approved || 0;

const deletedPages = pagesStats.deleted || 0;
const deletedBlogs = blogsStats.deleted || 0;

const forReviewPages = pagesStats.for_review || 0;
const forReviewBlogs = blogsStats.for_review || 0;

const draftPages = pagesStats.draft || 0;
const draftBlogs = blogsStats.draft || 0;

const rejectedPages = pagesStats.rejected || 0;
const rejectedBlogs = blogsStats.rejected || 0;

const config = useRuntimeConfig();
useSeoMeta({
  title: 'Dashboard',
  ogTitle: `Dashboard | ${config.public.appName || 'App'}`,
  description: 'Content management dashboard',
  ogDescription: 'Content management dashboard for pages and blogs',
  ogUrl: `${config.public.appUrl || ''}/manage/`,
  ogType: 'website',
  ogSiteName: config.public.appName || 'App',
  ogImage: `${
    config.public.imageCdnUrl || ''
  }/icons/android-chrome-512x512.png`,
  twitterCard: 'summary_large_image',
});
</script>
<template>
  <section
    v-if="profileData?.role === 'manager' || profileData?.role === 'superuser'"
  >
    <div class="container mx-auto px-4 py-8">
      <h1 class="text-3xl font-bold text-gray-900 dark:text-white mb-8">
        Content Management Dashboard
      </h1>

      <!-- Stats Overview -->
      <div
        class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-6 xl:grid-cols-6 gap-6 mb-8"
      >
        <UCard>
          <div class="text-center">
            <h3 class="text-2xl font-bold text-blue-600">{{ totalPages }}</h3>
            <p class="text-gray-600 dark:text-gray-300">Total Pages</p>
          </div>
        </UCard>

        <UCard>
          <div class="text-center">
            <h3 class="text-2xl font-bold text-blue-500">
              {{ draftPages }}
            </h3>
            <p class="text-gray-600 dark:text-gray-300">Pages Draft</p>
          </div>
        </UCard>

        <UCard>
          <div class="text-center">
            <h3 class="text-2xl font-bold text-red-500">
              {{ rejectedPages }}
            </h3>
            <p class="text-gray-600 dark:text-gray-300">Pages Rejected</p>
          </div>
        </UCard>

        <UCard>
          <div class="text-center">
            <h3 class="text-2xl font-bold text-orange-600">
              {{ forReviewPages }}
            </h3>
            <p class="text-gray-600 dark:text-gray-300">Pages for Review</p>
          </div>
        </UCard>

        <UCard>
          <div class="text-center">
            <h3 class="text-2xl font-bold text-green-600">
              {{ approvedPages }}
            </h3>
            <p class="text-gray-600 dark:text-gray-300">Approved Pages</p>
          </div>
        </UCard>

        <UCard>
          <div class="text-center">
            <h3 class="text-2xl font-bold text-gray-500">
              {{ deletedPages }}
            </h3>
            <p class="text-gray-600 dark:text-gray-300">Pages Deleted</p>
          </div>
        </UCard>

        <UCard>
          <div class="text-center">
            <h3 class="text-2xl font-bold text-purple-600">{{ totalBlogs }}</h3>
            <p class="text-gray-600 dark:text-gray-300">Total Blogs</p>
          </div>
        </UCard>

        <UCard>
          <div class="text-center">
            <h3 class="text-2xl font-bold text-blue-500">
              {{ draftBlogs }}
            </h3>
            <p class="text-gray-600 dark:text-gray-300">Blogs Draft</p>
          </div>
        </UCard>

        <UCard>
          <div class="text-center">
            <h3 class="text-2xl font-bold text-red-500">
              {{ rejectedBlogs }}
            </h3>
            <p class="text-gray-600 dark:text-gray-300">Blogs Rejected</p>
          </div>
        </UCard>

        <UCard>
          <div class="text-center">
            <h3 class="text-2xl font-bold text-orange-600">
              {{ forReviewBlogs }}
            </h3>
            <p class="text-gray-600 dark:text-gray-300">Blogs for Review</p>
          </div>
        </UCard>

        <UCard>
          <div class="text-center">
            <h3 class="text-2xl font-bold text-green-600">
              {{ approvedBlogs }}
            </h3>
            <p class="text-gray-600 dark:text-gray-300">Approved Blogs</p>
          </div>
        </UCard>

        <UCard>
          <div class="text-center">
            <h3 class="text-2xl font-bold text-gray-500">
              {{ deletedBlogs }}
            </h3>
            <p class="text-gray-600 dark:text-gray-300">Blogs Deleted</p>
          </div>
        </UCard>
      </div>

      <!-- Quick Actions -->
      <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
        <UCard>
          <template #header>
            <h2 class="text-xl font-semibold">Manage Pages</h2>
          </template>

          <div class="space-y-4">
            <p class="text-gray-600 dark:text-gray-300">
              Manage all website pages and content.
            </p>
            <div class="flex gap-3">
              <NuxtLinkLocale to="/manage/pages">
                <UButton
                  color="primary"
                  icon="i-heroicons-document-text"
                  class="cursor-pointer"
                >
                  View All Pages
                </UButton>
              </NuxtLinkLocale>
              <NuxtLinkLocale to="/manage/pages/create">
                <UButton
                  color="secondary"
                  variant="outline"
                  icon="i-heroicons-plus"
                  class="cursor-pointer"
                >
                  Create Page
                </UButton>
              </NuxtLinkLocale>
            </div>
          </div>
        </UCard>

        <UCard>
          <template #header>
            <h2 class="text-xl font-semibold">Manage Blogs</h2>
          </template>

          <div class="space-y-4">
            <p class="text-gray-600 dark:text-gray-300">
              Manage all blog posts and articles.
            </p>
            <div class="flex gap-3">
              <NuxtLinkLocale to="/manage/blogs">
                <UButton
                  color="primary"
                  icon="i-heroicons-newspaper"
                  class="cursor-pointer"
                >
                  View All Blogs
                </UButton>
              </NuxtLinkLocale>
              <NuxtLinkLocale to="/manage/blogs/create">
                <UButton
                  color="secondary"
                  variant="outline"
                  icon="i-heroicons-plus"
                  class="cursor-pointer"
                >
                  Create Blog
                </UButton>
              </NuxtLinkLocale>
            </div>
          </div>
        </UCard>
      </div>
    </div>
  </section>

  <section v-else>
    <DefaultAccessDenied />
  </section>
</template>
