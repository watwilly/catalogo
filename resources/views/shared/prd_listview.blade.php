<div class="col-11 col-sm-6 col-md-4 col-lg-3">
    <div class="card card-hover mx-2 list-product">
        <img src="{{Voyager::get_image($imagen, $cropp_type, $storage)}}" class="card-img-top" alt="{{$title}}" title="{{$title}}">
        <div class="card-body d-flex flex-column justify-content-between">
            <h5 class="card-title m-0  h6">{{$title}}</h5>
                <?php /*
                <small class="text-success section__title fw-bold"><?php echo $disccount ?>% OFF</small>
                <p class="card-text m-0 section__title fw-bold">
                    ARS $<?php echo $final ?>
                    <small class="text-decoration-line-through text-muted">$<?php echo $price ?></small>
                </p>
                 */ ?>
                <p class="card-text m-0 section__title fw-bold">
                    ARS ${{$precios}}
                </p>
        </div>
        <a href="/publicacion/{{str_slug($prd_catname, '-')}}/{{str_slug($title)}}/{{$id}}" class="stretched-link"></a>
    </div>
</div>




