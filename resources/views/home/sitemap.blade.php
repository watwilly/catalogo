<?php echo '<?xml version="1.0" encoding="UTF-8"?>'; ?>

<urlset
      xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">

<url>
  <loc>https://www.distlooktucuman.com.ar/</loc>
  <lastmod>{{ $now->toAtomString() }}</lastmod>
  <priority>1.00</priority>
</url>

<url>
  <loc>https://www.distlooktucuman.com.ar/todas-las-categorias</loc>
  <lastmod>{{ $now->toAtomString() }}</lastmod>
  <priority>0.80</priority>
</url>

<url>
  <loc>https://www.distlooktucuman.com.ar/auth/user/register</loc>
  <lastmod>{{ $now->toAtomString() }}</lastmod>
  <priority>1.00</priority>
</url>
<url>
  <loc>https://www.distlooktucuman.com.ar/auth/user/login</loc>
  <lastmod>{{ $now->toAtomString() }}</lastmod>
  <priority>0.80</priority>
</url>



@foreach($pub as $pubs)
	<url>
	  <loc>https://www.distlooktucuman.com.ar/publicacion/{{str_slug($pubs->name)}}/{{str_slug($pubs->title, '-')}}/{{$pubs->id}}</loc>
	  <lastmod>{{ $now->toAtomString() }}</lastmod>
	  <priority>0.80</priority>
	</url>
@endforeach


@foreach($categorias as $categoria)
	<url>
	  <loc>https://www.distlooktucuman.com.ar/categoria/{{$categoria->id}}/{{str_slug($categoria->name, '-')}}</loc>
	  <lastmod>{{ $now->toAtomString() }}</lastmod>
	  <priority>0.80</priority>
	</url>
@endforeach

</urlset>