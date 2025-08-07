<template>
  <UDrawer
    title="Drawer with title"
    :ui="{
      overlay: 'bg-[var(--background)]/70 backdrop-blur-md',
      content: 'rounded-4xl bg-[var(--background)]',
    }"
  >
    <UButton
      label="Open Drawer"
      variant="subtle"
      trailing-icon="i-lucide-chevron-up"
      :ui="{ base: 'rounded-full px-4 py-2 text-lg cursor-pointer' }"
    />

    <!-- <button
      class="group relative inline-flex h-12 items-center justify-center overflow-hidden rounded-md bg-[var(--primary)] px-6 font-medium text-[var(--on-secondary)] transition hover:scale-110"
    >
      <span>Open drawer</span>
      <div
        class="absolute inset-0 flex h-full w-full justify-center [transform:skew(-12deg)_translateX(-100%)] group-hover:duration-1000 group-hover:[transform:skew(-12deg)_translateX(100%)]"
      >
        <div class="relative h-full w-8 bg-white/20"></div>
      </div>
    </button> -->

    <template #body>
      <Placeholder class="h-64 w-full" />
      <div>
        Lorem ipsum dolor sit amet consectetur adipisicing elit. Dignissimos,
        molestiae ullam! Laborum, facilis suscipit ex voluptates adipisci ipsum
        totam officiis atque nam laboriosam nulla mollitia ducimus hic rerum
        modi voluptatem id velit ullam porro fugit tempore? Veritatis ab
        perspiciatis, rem esse quibusdam magni aspernatur reiciendis placeat
        aliquid quas quae animi commodi dolorem deleniti ea sequi nobis! Quam
        eius aliquam velit blanditiis obcaecati porro vero placeat, ullam
        delectus corporis voluptate voluptates dolore alias excepturi quaerat
        beatae nostrum corrupti? Ab sint rerum vel harum sapiente maxime qui
        impedit odit illo eligendi beatae inventore in, molestiae libero dolore
        laborum, consequuntur at quo fuga.
      </div>
      <div>
        <img
          class="w-full"
          :src="`https://picsum.photos/1920/1080?random=${Math.floor(
            Math.random() * 100
          )}`"
          alt="random image"
        />
      </div>
    </template>
  </UDrawer>
</template>
