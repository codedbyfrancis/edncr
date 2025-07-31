'''
<script setup lang="ts">
import { useI18n } from 'vue-i18n';

definePageMeta({
  layout: 'defaultpages',
});

const config = useRuntimeConfig();
const { locale } = useI18n();
const supabase = useSupabaseClient();

const pageData = ref<any>(null);
const error = ref<any>(null);

async function fetchPage() {
  try {
    const { data, error: supabaseError } = await supabase
      .from('pages')
      .select(
        `
        slug,
        translations:pages_translations (
          lang,
          title,
          sub_title,
          content,
          featured_image
        )
      `
      )
      .eq('slug', 'contact-us')
      .single();

    if (supabaseError) {
      throw new Error(supabaseError.message);
    }

    if (data) {
      const translation = data.translations.find(
        (t: any) => t.lang === locale.value
      );
      pageData.value =
        translation || data.translations.find((t: any) => t.lang === 'en');
    }
  } catch (err) {
    error.value = err;
  }
}

onMounted(fetchPage);

watch(locale, fetchPage);

useSeoMeta({
  title: () => pageData.value?.title || 'Contact',
  ogTitle: () =>
    (pageData.value?.title || 'Contact') + ' | ' + config.public.appName,
  description: () => pageData.value?.sub_title || 'Contact description',
  ogDescription: () =>
    pageData.value?.sub_title || 'Contact description for social media',
  ogUrl: () => config.public.appUrl + '/contacts',
  ogType: 'website',
  ogSiteName: config.public.appName,
  ogImage: () =>
    pageData.value?.featured_image ||
    config.public.imageCdnUrl + '/icons/android-chrome-512x512.png',
  twitterCard: 'summary_large_image',
});
</script>

<template>
  <section>
    <div v-if="error">
      <p>Error loading page: {{ error.message }}</p>
    </div>
    <div v-else-if="pageData">
      <DefaultPagesMain
        :data="{
          title: pageData.title,
          description: pageData.sub_title,
          content: pageData.content,
        }"
      />
    </div>
    <div v-else>
      <p>Loading...</p>
    </div>
  </section>
</template>
