export default defineNuxtRouteMiddleware(async () => {
  const startTime = Date.now();

  // const user = useSupabaseUser();
  // if (!user.value) {
  //   return navigateTo('../accounts/');
  // }

  const supabase = useSupabaseClient();
  const { data } = await supabase.auth.getClaims();
  const user = data?.claims;
  // console.log(user);

  if (!user) {
    // return navigateTo('/accounts/');
    window.location.href = '/accounts/';
  }
  console.log(`Finished: ${Date.now() - startTime}ms`);
});
