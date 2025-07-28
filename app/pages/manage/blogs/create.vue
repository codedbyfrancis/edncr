<script setup lang="ts">
import { ref } from 'vue';

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

const blog = ref({
  slug: '',
  status: 'editing',
  user_id: user.sub,
});

const translation = ref({
  lang: 'en',
  title: '',
  sub_title: '',
  content: '',
  category: '',
  sub_category: '',
  user_id: user.sub,
  status: 'editing',
});

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
</script>

<template>
  <div class="container mx-auto px-4 py-8">
    <h1 class="text-3xl font-bold text-gray-900 dark:text-white mb-6">Create New Blog</h1>
    <form @submit.prevent="createBlog" class="space-y-6">
      <UCard>
        <div class="space-y-4">
          <UFormGroup label="Slug">
            <UInput v-model="blog.slug" required />
          </UFormGroup>
          <UFormGroup label="Title">
            <UInput v-model="translation.title" required />
          </UFormGroup>
          <UFormGroup label="Subtitle">
            <UInput v-model="translation.sub_title" />
          </UFormGroup>
          <UFormGroup label="Content">
            <UTextarea v-model="translation.content" required />
          </UFormGroup>
          <UFormGroup label="Category">
            <UInput v-model="translation.category" />
          </UFormGroup>
          <UFormGroup label="Subcategory">
            <UInput v-model="translation.sub_category" />
          </UFormGroup>
        </div>
        <template #footer>
          <UButton type="submit" color="primary">Create Blog</UButton>
        </template>
      </UCard>
    </form>
  </div>
</template>
