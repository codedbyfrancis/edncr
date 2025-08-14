<script lang="ts" setup>
definePageMeta({
  layout: 'defaultpages',
});
const config = useRuntimeConfig();
useSeoMeta({
  title: 'Typography',
  ogTitle: 'Typography' + ' | ' + config.public.appName,
  description: 'Typography description',
  ogDescription: 'Typography description for social media',
  ogUrl: config.public.appUrl + '/account/',
  ogType: 'website',
  ogSiteName: config.public.appName,
  ogImage: config.public.imageCdnUrl + '/icons/android-chrome-512x512.png',
  twitterCard: 'summary_large_image',
});
</script>

<template>
  <div>
    <div class="container mx-auto">
      <h1>[Typography]</h1>

      <div>
        <div class="my-5 w-full md:w-1/2 flex flex-col gap-3">
          <h1 class="display">Display Lorem ipsum dolor sit amet.</h1>
          <h1>Heading 1 Lorem ipsum dolor sit amet.</h1>
          <h2>Heading 2 Lorem ipsum dolor sit amet.</h2>
          <h3>Heading 3 Lorem ipsum dolor sit amet.</h3>
          <h4>Heading 4 Lorem ipsum dolor sit amet.</h4>
          <h5>Heading 5 Lorem ipsum dolor sit amet.</h5>
          <h6>Heading 6 Lorem ipsum dolor sit amet.</h6>
        </div>

        <div class="my-5 w-full md:w-1/2 flex flex-col gap-5">
          <p>
            This is a paragraph of text. It is used to display long-form
            content. Lorem, ipsum dolor sit amet consectetur adipisicing elit.
            Doloremque aliquam tempora placeat quod, accusantium, natus
            excepturi, officiis autem exercitationem obcaecati quaerat
            voluptatum accusamus atque non dolores fugiat sit sint! Laborum
            deleniti magni delectus esse et cumque non, sunt, eligendi iste rem
            omnis perferendis aut aliquam debitis porro commodi quidem dolorem
            minus, perspiciatis nulla pariatur ullam minima. Magni odit vero
            amet quaerat quas aut quo tenetur perspiciatis labore, modi quod
            vitae non tempora hic aliquid incidunt fugiat commodi sapiente
            reiciendis fuga saepe deleniti. Quam magnam fugiat similique, odio
            voluptatibus deserunt laboriosam blanditiis laborum ipsam,
            asperiores assumenda voluptates qui quos eaque harum minus sit ad
            aliquam. Sint doloremque non esse officiis ea eligendi aspernatur
            quidem tempora explicabo vitae nisi, eos libero error cupiditate
            amet soluta vero fugit magnam culpa enim? Facilis eaque aspernatur
            repudiandae alias veritatis, maiores sint ullam quaerat, enim earum
            aliquid! Mollitia impedit eaque nesciunt aliquam odit recusandae,
            odio voluptatem aperiam delectus libero, magnam consectetur quas?
            Molestiae omnis aperiam officiis ea nemo placeat iste accusamus eum,
            eveniet animi! Necessitatibus alias eos impedit, vero dicta aperiam
            omnis, voluptatum nulla pariatur maiores maxime quo eligendi optio
            nisi? Illo dolorum nisi, alias quis laborum quod perspiciatis
            repellat quos odio distinctio commodi facilis expedita explicabo in
            eveniet magni pariatur et? Odit architecto corporis enim quo ipsa
            commodi, delectus praesentium numquam sequi officia magnam animi
            blanditiis rem voluptatum possimus fugiat autem quia aliquid dicta
            quae soluta eaque, nam iste sint!
          </p>
          <p class="secondary-body">
            This is a secondary body text. It has a slightly larger font size.
            Lorem ipsum dolor sit amet consectetur adipisicing elit. Eum culpa
            dolorum repellat sint, velit quis odio molestias consectetur placeat
            doloribus mollitia iste voluptate aliquam fugit expedita eligendi
            ipsa id. Voluptatem recusandae provident, hic perspiciatis culpa
            quasi! Numquam quae atque minus rem, commodi molestias laudantium ab
            odio accusamus animi maxime voluptatem, reiciendis itaque labore
            aspernatur, repudiandae id autem inventore sunt. Dolorem illum
            corrupti velit molestias magni omnis doloribus saepe deleniti
            nesciunt, quibusdam alias cum minima quas?
          </p>
          <p class="caption">
            This is a caption. It is used for short descriptions or labels.
            Lorem ipsum dolor sit amet consectetur adipisicing elit. Quidem id,
            consectetur iure sapiente velit incidunt! Aut adipisci corrupti
            nihil placeat?
          </p>
          <p class="overline">
            This is an overline. It is used for small headings or labels.
          </p>
        </div>
      </div>

      <div class="my-5">
        <h2>Inline Elements</h2>
        <p>
          This is a paragraph with <strong>strong text</strong>,
          <em>emphasized text</em>, <a href="#">a link</a>,
          <code>inline code</code>, <mark>marked text</mark>,
          <small>small text</small>, <ins>inserted text</ins>, and
          <del>deleted text</del>.
        </p>
      </div>

      <div class="my-5">
        <h2>Blockquote</h2>
        <blockquote>
          <p>
            This is a blockquote. It is used to quote text from another source.
          </p>
          <cite>- Author</cite>
        </blockquote>
      </div>

      <div class="my-5">
        <h2>Lists</h2>
        <div>
          <div>
            <h3>Unordered List</h3>
            <ul>
              <li>Item 1</li>
              <li>Item 2</li>
              <li>Item 3</li>
            </ul>
          </div>
          <div>
            <h3>Ordered List</h3>
            <ol>
              <li>First item</li>
              <li>Second item</li>
              <li>Third item</li>
            </ol>
          </div>
        </div>
      </div>

      <div class="my-5">
        <h2>Code Block</h2>
        <pre><code>&lt;template&gt;
  &lt;div&gt;
    Hello, World!
  &lt;/div&gt;
&lt;/template&gt;</code></pre>
      </div>
    </div>
  </div>
</template>

<script setup></script>

<style scoped></style>
