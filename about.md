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



### Creating a new category or tag
By default, categories and tags are rendered as plain text. Further steps are necessary if you want them to link to a page that contains a list of all posts that belong to that category or tag.

For each featured category or tag, a file called `<category-name>.md` or `<tag-name>.md` has to be created inside the `_featured_tags` and `_featured_categories` folders, respectively. Each file in these folders is part of a [Jekyll Collection](https://jekyllrb.com/docs/collections/).

The meta data of a category or tag is set in the files front matter, e.g.

~~~yml
# file: `_featured_categories/hyde.md`
---
layout: list
title:  Hyde
slug:   hyde
description: >
  Hyde is a brazen two-column [Jekyll](http://jekyllrb.com) theme.
  It's based on [Poole](http://getpoole.com), the Jekyll butler.
---
~~~

`layout`
: Must either `list` or `grid`\*

`title`
: Used as title of the page, as well as name of the category or tag as part of the line below a blog post's title. Can be different from the name of the tag or category, as long as `slug` is identical to the name.

`slug`
: Must be identical to the key used in the blog's front matter, i.e. if you use `categories: [jekyll]` the `slug` must be `jekyll`. By default, the slug is derived from the title, but here it is recommended that you set it explicitly.

`description`
: A medium-length description, used on the tag or category's detail page and shown in a message box below the title.

`menu`
: Set to to `true` if you want the category or tag to appear in the sidebar. For more information, see [Adding an entry to the sidebar](#adding-an-entry-to-the-sidebar).

Once the file is created, the page can be found at `/category/<categoryname>/` or `/tag/<tagname>/`.




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
