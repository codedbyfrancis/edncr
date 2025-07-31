<script lang="ts" setup>
definePageMeta({
  layout: 'defaultpages',
});
</script>

<template>
  <div>
    <h1>Typography</h1>

    <div>
      <div>
        <h0 class="font-extrabold">Heading 0</h0>
        <h1>Heading 1</h1>
        <h2>Heading 2</h2>
        <h3>Heading 3</h3>
        <h4>Heading 4</h4>
        <h5>Heading 5</h5>
        <h6>Heading 6</h6>
      </div>

      <div>
        <p>
          This is a paragraph of text. It is used to display long-form content.
        </p>
        <p class="secondary-body">
          This is a secondary body text. It has a slightly larger font size.
        </p>
        <p class="caption">
          This is a caption. It is used for short descriptions or labels.
        </p>
        <p class="overline">
          This is an overline. It is used for small headings or labels.
        </p>
      </div>
    </div>

    <div>
      <h2>Inline Elements</h2>
      <p>
        This is a paragraph with <strong>strong text</strong>,
        <em>emphasized text</em>, <a href="#">a link</a>,
        <code>inline code</code>, <mark>marked text</mark>,
        <small>small text</small>, <ins>inserted text</ins>, and
        <del>deleted text</del>.
      </p>
    </div>

    <div>
      <h2>Blockquote</h2>
      <blockquote>
        <p>
          This is a blockquote. It is used to quote text from another source.
        </p>
        <cite>- Author</cite>
      </blockquote>
    </div>

    <div>
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

    <div>
      <h2>Code Block</h2>
      <pre><code>&lt;template&gt;
  &lt;div&gt;
    Hello, World!
  &lt;/div&gt;
&lt;/template&gt;</code></pre>
    </div>
  </div>
</template>

<script setup></script>

<style scoped></style>
