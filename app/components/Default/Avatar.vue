<script lang="ts" setup>
const supabase = useSupabaseClient();
const {
  data: { user },
} = await supabase.auth.getUser();
</script>
<template>
  <div class="flex justify-center items-center">
    <div v-if="user && user.email">
      <UTooltip
        :text="user?.user_metadata?.name + ' - ' + user?.user_metadata?.email"
      >
        <UIcon
          name="material-symbols:account-circle-outline"
          class="size-7 mt-2"
      /></UTooltip>
    </div>
    <div v-else-if="user && user.phone">
      <UTooltip :text="user.phone">
        <UIcon name="material-symbols:contact-phone" class="size-7 mt-2"
      /></UTooltip>
    </div>
    <div v-else>
      <UTooltip :text="user?.email">
        <UIcon
          name="material-symbols:person-outline-rounded"
          class="size-7 mt-2"
        />
      </UTooltip>
    </div>
  </div>
</template>
