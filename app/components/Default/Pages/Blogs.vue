<script lang="ts" setup>
defineProps({
  data: { type: Object, default: '' },
});
</script>
<template>
  <section>
    <div class="page">
      <small>/Default/Pages/Blogs.vue</small>
      <div class="container mx-auto">
        <h1>{{ data.title }}</h1>
        <h2>{{ $t('welcome') }}</h2>
        <p class="secondary-body">{{ data.description }}</p>
      </div>
      <div class="container mx-auto">
        <div class="w-full lg:w-1/2">
          Lorem ipsum dolor sit amet consectetur adipisicing elit. Pariatur
          blanditiis expedita natus animi sit impedit! Necessitatibus fugit sit
          labore nam dignissimos id dolorum culpa totam itaque odit ipsa dolorem
          error facere, in aspernatur laudantium commodi impedit accusantium
          nostrum iure? Ipsam quas nulla, numquam, tenetur eos voluptate nobis
          fugiat quo fuga assumenda vel mollitia alias asperiores dolorum porro,
          vero itaque ipsum odit. Odit vitae doloremque doloribus illum corrupti
          quas assumenda perspiciatis neque ex, quos qui sapiente eius deleniti
          aperiam! Dicta, rem amet? Temporibus fuga quisquam dolore voluptatibus
          ea magnam reprehenderit inventore provident, qui distinctio vero
          praesentium voluptas deleniti! Quo fuga omnis natus voluptas quae
          fugiat, illum, sit recusandae ad architecto impedit dolorum possimus
          quasi ratione id pariatur. Odio consequuntur excepturi iure sunt
          laboriosam eaque voluptates aspernatur, vero consectetur nobis
          cupiditate dolores vel eligendi numquam exercitationem quisquam vitae
          molestias error non perspiciatis nisi animi ad minus. Quo minima,
          distinctio dolorum laborum nam doloremque nihil vitae repellat veniam
          quis ipsam, corporis, non delectus aliquam beatae placeat. Dicta odio
          expedita, quae impedit suscipit aliquam quasi non quos incidunt ea,
          consectetur soluta. Dolorem deleniti rem ut magni in voluptatem
          necessitatibus totam incidunt. Blanditiis nemo, ducimus autem minima
          hic, tempore iure eum iste quia sed quod error, reiciendis voluptates.
          Quis, quos quae? Iste magni, a amet, unde fugit eligendi pariatur
          error reprehenderit illo enim perferendis nemo in assumenda molestias
          cupiditate? Totam, neque blanditiis iusto animi quisquam corrupti ea
          odit modi fugiat, doloribus perspiciatis molestiae quo a voluptatem
          et? Adipisci blanditiis voluptas voluptatum laudantium provident
          inventore quisquam iure expedita eius labore quam deleniti, amet,
          corporis cum, reprehenderit magnam? Exercitationem enim maxime velit
          iure molestias ducimus tempora quisquam temporibus delectus rerum sed
          at placeat asperiores quo odio distinctio minus eaque, repudiandae
          laudantium quaerat quasi adipisci quis fugiat. Est cupiditate quas
          possimus fuga excepturi. Qui rerum recusandae veniam tempora!
        </div>
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
    </div>
  </section>
</template>
