<script setup lang="ts">
import { ref } from 'vue';
const { locales } = useI18n();

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

const translation = ref({
  lang: 'en',
  title: '',
  sub_title: '',
  content: '',
  category: '',
  sub_category: '',
  user_id: user.sub,
  status: 'draft',
});

const blog = ref({
  slug: '',
  status: 'draft',
  user_id: user.sub,
});

console.log(blog);

const createBlog = async () => {
  try {
    // Insert into blogs table
    const { data: blogData, error: blogError } = await supabase
      .from('blogs')
      .insert(blog.value)
      .select('id')
      .single();

    if (blogError) throw blogError;

    // Insert into blogs_translations table
    const { error: translationError } = await supabase
      .from('blogs_translations')
      .insert({ ...translation.value, blog_id: blogData.id });

    if (translationError) throw translationError;

    // Redirect to the manage blogs page
    navigateTo('/manage/blogs');
  } catch (error) {
    console.error('Error creating blog:', error);
  }
};
const slugify = (text: string) => {
  return text
    .toLowerCase()
    .trim()
    .replace(/[^\w\s-]/g, '')
    .replace(/[\s_-]+/g, '-')
    .replace(/^-+/, '')
    .replace(/-+$/, '');
};
</script>

<template>
  <div class="min-h-screen">
    <div class="container mx-auto px-4 py-8 max-w-4xl">
      <!-- Header Section -->
      <div class="mb-8">
        <div class="flex items-center justify-between mb-4">
          <div class="flex items-center gap-3">
            <NuxtLinkLocale to="/manage/blogs">
              <UButton
                color="gray"
                variant="ghost"
                icon="i-heroicons-arrow-left"
                size="lg"
              >
                Back to Blogs
              </UButton>
            </NuxtLinkLocale>
          </div>
          <UBadge color="info" variant="soft" size="lg"> Draft </UBadge>
        </div>

        <h1 class="text-4xl font-bold mb-2">Create New Blog Post</h1>
        <p class="text-lg text-gray-600 dark:text-gray-300">
          Write and publish your next blog article
        </p>
      </div>

      <!-- Main Form -->
      <form @submit.prevent="createBlog" class="space-y-8">
        <!-- Basic Information -->
        <UCard class="shadow-lg">
          <template #header>
            <div class="flex items-center gap-2">
              <UIcon
                name="i-heroicons-document-text"
                class="w-5 h-5 text-primary-500"
              />
              <h2 class="text-xl font-semibold">Basic Information</h2>
            </div>
          </template>

          <div class="grid grid-cols-1 lg:grid-cols-2 gap-6">
            <div class="lg:col-span-2">
              <UFormGroup label="Language" description="Content language">
                <USelect
                  v-model="translation.lang"
                  :items="
                    Object.entries(locales).map(([locale, { name }]) => ({
                      label: name,
                      value: locale,
                    }))
                  "
                  placeholder="Select a language"
                  size="lg"
                  class="w-full"
                  required
                />
              </UFormGroup>
            </div>

            <div class="lg:col-span-2">
              <UFormGroup
                label="Blog Title"
                description="The main title of your blog post"
                required
              >
                <UInput
                  v-model="translation.title"
                  placeholder="Enter an engaging title..."
                  size="lg"
                  class="w-full"
                  required
                />
              </UFormGroup>
            </div>

            <div class="lg:col-span-2">
              <UFormGroup
                label="Subtitle"
                description="Optional subtitle or brief description"
              >
                <UInput
                  v-model="translation.sub_title"
                  placeholder="Add a subtitle..."
                  size="lg"
                  class="w-full"
                />
              </UFormGroup>
            </div>

            <div class="lg:col-span-2">
              <UFormGroup
                label="URL Slug"
                description="Used in the blog URL (auto-generated from title if empty)"
                required
              >
                <UInput
                  v-model="blog.slug"
                  :value="slugify(translation.title)"
                  placeholder="blog-url-slug"
                  class="w-full"
                  required
                  readonly
                />
              </UFormGroup>
            </div>
          </div>
        </UCard>

        <!-- Content Section -->
        <UCard class="shadow-lg">
          <template #header>
            <div class="flex items-center gap-2">
              <UIcon
                name="i-heroicons-pencil-square"
                class="w-5 h-5 text-primary-500"
              />
              <h2 class="text-xl font-semibold">Content</h2>
            </div>
          </template>

          <div class="space-y-6">
            <UFormGroup
              label="Blog Content"
              description="Write your blog post content here"
              required
            >
              <UTextarea
                v-model="translation.content"
                placeholder="Start writing your blog post..."
                :rows="12"
                resize
                class="w-full"
                required
              />
            </UFormGroup>
          </div>
        </UCard>

        <!-- Categories & Tags -->
        <UCard class="shadow-lg">
          <template #header>
            <div class="flex items-center gap-2">
              <UIcon name="i-heroicons-tag" class="w-5 h-5 text-primary-500" />
              <h2 class="text-xl font-semibold">Categories & Tags</h2>
            </div>
          </template>

          <div class="grid grid-cols-1 lg:grid-cols-2 gap-6">
            <UFormGroup
              label="Category"
              description="Main category for your blog post"
            >
              <USelect
                v-model="translation.category"
                :options="[
                  { label: 'Technology', value: 'technology' },
                  { label: 'Business', value: 'business' },
                  { label: 'Lifestyle', value: 'lifestyle' },
                  { label: 'Tutorial', value: 'tutorial' },
                  { label: 'News', value: 'news' },
                ]"
                placeholder="Select a category"
                size="lg"
                class="w-full"
              />
            </UFormGroup>

            <UFormGroup
              label="Subcategory"
              description="More specific categorization"
            >
              <UInput
                v-model="translation.sub_category"
                placeholder="e.g., web-development, startup"
                class="w-full"
              />
            </UFormGroup>
          </div>
        </UCard>

        <!-- Actions -->
        <div
          class="flex items-center justify-between pt-6 border-t border-gray-200 dark:border-gray-700"
        >
          <NuxtLinkLocale to="/manage/blogs">
            <UButton color="gray" variant="outline" size="lg"> Cancel </UButton>
          </NuxtLinkLocale>

          <div class="flex items-center gap-3">
            <UButton type="button" color="gray" variant="soft" size="lg">
              Save Draft
            </UButton>

            <UButton
              type="submit"
              color="primary"
              size="lg"
              icon="i-heroicons-paper-airplane"
            >
              Create Blog Post
            </UButton>
          </div>
        </div>
        <div v-if="error" class="text-red-500 mt-2">
          {{ error.message }}
        </div>
      </form>
    </div>
  </div>
</template>
