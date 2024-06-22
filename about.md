---
layout: about
image: /assets/img/blog/hydejack-9.jpg
description: >
  A boutique Jekyll theme for hackers, nerds, and academics,
  with a focus on personal sites that are meant to impress.
hide_description: true
redirect_from:
  - /download/
---

# About


## Run locally

`bundler exec jekyll serve`

## Build 

`jekyll build`


## Choosing a blog layout
Hydejack features three layouts for showing your blog posts.

* The [`list` layout][posts] only shows the title and groups the posts by year of publication.
* The [`grid` layout][grid]\* is exclusive to the PRO Version and will show a content card (with `image`) for each post.
* The [`blog` layout][blog] is a traditional paginated layout and shows the title and an excerpt of each post.

[blog]: https://hydejack.com/blog/
[posts]: https://hydejack.com/posts/
[grid]: https://hydejack.com/blog/hydejack/

In order to use the `list` or `grid` layout add the following front-matter to a new markdown file:

~~~yml
---
layout: list # or `grid`
title:  Home
---
~~~

If you want to use the `blog` layout, you need to add `jekyll-paginate` to your `Gemfile` and to the `plugins` list in your config file:

```ruby
# file: `Gemfile`
gem "jekyll-paginate"
```

```yml
# file: `_config.yml`
plugins:
  - jekyll-paginate
```

You also need to add the `paginate` and `paginate_path` keys to your config file, e.g.

~~~yml
# file: `_config.yml`
paginate:      10
paginate_path: '/:num/'
~~~

The `blog` layout needs to be applied to a file with the `.html` file extension
and the `paginate_path` needs to match the path to the `index.html` file.
To match the `paginate_path` above, put a `index.html` with the following front matter in the root directory:

~~~yml
# file: `index.html`
---
layout: blog
title: Blog
---
~~~

For more information see [Pagination](https://jekyllrb.com/docs/pagination/).


### Using the `blog` layout in a subdirectory
If you want to use the blog layout at a URL like `/my-blog/`, create the following folder structure:

~~~
├── my-blog
│   └── index.html
└── _config.yml
~~~

You can use the same `index.html` as before and place it in the subdirectory.

~~~yml
# file: `my-blog/index.html`
---
layout: blog
title: Blog
---
~~~

In your config file, make sure the `paginate_path` matches the name of the subdirectory:

~~~yml
# file: `_config.yml`
paginate:      10
paginate_path: /my-blog/:num/ #!!
~~~

To add an entry in the sidebar to your blog directory, see [Adding an entry to the sidebar](./basics.md#adding-an-entry-to-the-sidebar).
