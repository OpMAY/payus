<%--
  Created by IntelliJ IDEA.
  User: zlzld
  Date: 2021-01-25
  Time: 오전 4:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href='http://fonts.googleapis.com/css?family=Poppins:300,300i,400,400i,500,500i,600,700,900%7CRuthie%7CAbril+Fatface'
          rel='stylesheet' type='text/css'>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;700&display=swap"
          rel="stylesheet">
    <script src="../../../resources/assets/js/jquery-2.2.4.min.js"></script>

    <!-- Stylesheets
        ============================================= -->
    <link href="../../../resources/assets/css/bootstrap.min.css" rel="stylesheet">

    <link href="../../../resources/assets/css/external.css" rel="stylesheet">
    <link href="../../../resources/assets/css/style.css" rel="stylesheet">

    <!-- RS5.0 Main Stylesheet -->
    <link rel="stylesheet" type="text/css" href="../../../resources/assets/revolution/css/settings.css">
    <link rel="stylesheet" type="text/css" href="../../../resources/assets/revolution/css/layers.css">
    <link rel="stylesheet" type="text/css" href="../../../resources/assets/revolution/css/navigation.css">

    <!-- HTML5 shim, for IE6-8 support of HTML5 elements. All other JS at the end of file. -->
    <!--[if lt IE 9]>
    <script src="../../../resources/assets/js/html5shiv.js"></script>
    <script src="../../../resources/assets/js/respond.min.js"></script>
    <![endif]-->

    <!-- Document Title
    ============================================= -->

    <!-- Option 2: jQuery, Popper.js, and Bootstrap JS
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js" integrity="sha384-w1Q4orYjBQndcko6MimVbzY0tgp4pWB4lZ7lr30WKz0vr/aWKhXdBNmNb5D92v7s" crossorigin="anonymous"></script>
    -->
    <link rel="stylesheet" type="text/css" href="../../../resources/css/custom_element.css">

    <title>Element</title>
</head>
<body style="background-color: white !important;">
<div class="preloader">
    <div class="spinner">
        <div class="bounce1"></div>
        <div class="bounce2"></div>
        <div class="bounce3"></div>
    </div>
</div>
<%--Header--%>
<div id="wrapper" class="wrapper clearfix">
    <header id="navbar-spy"
            class="header header-5 header-2 header-topbar header-transparent header-transparent-topbar header-fixed">
        <div id="top-bar" class="top-bar topbar-transparent">
            <div class="container">
                <div class="container-bordered">
                    <div class="row">
                        <div class="col-xs-12 col-sm-6 col-md-6 top--contact hidden-xs">
                            <ul class="list-inline mb-0 ">
                                <li>
                                    <i class="fa fa-map-marker"></i><span>Tanta AlGharbia, Egypt.</span>
                                </li>
                                <li>
                                    <i class="fa fa-phone"></i> <span>+ 2 0106 5370701</span>
                                </li>
                            </ul>
                        </div>
                        <!-- .col-md-6 end -->
                        <div class="col-xs-12 col-sm-6 col-md-6 top--social text-right text-center-xs">
                            <span>즐겨찾기 추가</span>
                            <a class="facebook" href="#"><i class="fa fa-facebook"></i></a>
                            <a class="twitter" href="#"><i class="fa fa-instagram"></i></a>
                            <a class="instagram" href="#"><i class="fa fa-notion"><img class="position-relative"
                                                                                       style="top: -2px;"
                                                                                       src="../../../resources/custom/icons/icon-naver.svg"/></i></a>
                            <a class="tripadvisor" href="#"><i class="fa fa-naver"><img class="position-relative"
                                                                                        style="top: -2px;"
                                                                                        src="../../../resources/custom/icons/icon-notion.svg"/></i></a>
                        </div>
                        <!-- .col-md-6 end -->
                    </div>
                </div>
            </div>
        </div>
        <nav id="primary-menu" class="navbar navbar-fixed-top">
            <div class="container">
                <!-- Brand and toggle get grouped for better mobile display -->
                <div class="navbar-header position-relative">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                            data-target="#navbar-collapse-1" aria-expanded="false">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="logo position-absolute" style="top: 0;left: 0;" href="#">
                        <img class="logo-light position-absolute" style="top: -55px;left: -180px"
                             src="http://via.placeholder.com/160x180" alt="Steakin Logo"
                             draggable="false">
                        <img class="logo-dark" src="../../../resources/assets/images/logo/logo-dark.png"
                             alt="Steakin Logo"
                             draggable="false">
                    </a>
                </div>

                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse pull-right" id="navbar-collapse-1">
                    <ul class="nav navbar-nav nav-pos-right navbar-left">
                        <!-- Home Menu -->
                        <li class="has-dropdown mega-dropdown active">
                            <a href="#" data-toggle="dropdown" class="dropdown-toggle menu-item">home</a>
                            <ul class="dropdown-menu mega-dropdown-menu">
                                <li>
                                    <div class="container">
                                        <div class="row">
                                            <!-- Column #1 -->
                                            <div class="col-md-3">
                                                <ul>
                                                    <li>
                                                        <a href="#">home main</a>
                                                    </li>
                                                    <li>
                                                        <a href="#">homeoage 2</a>
                                                    </li>
                                                    <li>
                                                        <a href="#">homeoage 3</a>
                                                    </li>
                                                    <li>
                                                        <a href="#">homeoage 4</a>
                                                    </li>
                                                </ul>
                                            </div>
                                            <!-- .col-md-3 end -->

                                            <!-- Column #2 -->
                                            <div class="col-md-3">
                                                <ul>
                                                    <li>
                                                        <a href="#">homepage 5</a>
                                                    </li>
                                                    <li>
                                                        <a href="#">homepage 6</a>
                                                    </li>
                                                    <li>
                                                        <a href="#">homepage 7</a>
                                                    </li>
                                                    <li>
                                                        <a href="#">homepage 8</a>
                                                    </li>
                                                </ul>
                                            </div>
                                            <!-- .col-md-2 end -->

                                            <!-- Column #3 -->
                                            <div class="col-md-3">
                                                <ul>
                                                    <li>
                                                        <a href="#">homepage 9 (boxed)</a>
                                                    </li>
                                                    <li>
                                                        <a href="#">homepage 10 (wide)</a>
                                                    </li>
                                                    <li>
                                                        <a href="#">homepage 11 (dark)</a>
                                                    </li>
                                                    <li>
                                                        <a href="#">homepage 12 (shop)</a>
                                                    </li>
                                                </ul>
                                            </div>
                                            <!-- .col-md-3 end -->

                                            <!-- Column #3 -->
                                            <div class="col-md-3">
                                                <ul>
                                                    <li>
                                                        <a href="#">homepage RTL</a>
                                                    </li>
                                                    <li>
                                                        <a href="#">homepage Arabic</a>
                                                    </li>
                                                </ul>
                                            </div>
                                            <!-- .col-md-3 end -->
                                        </div>
                                        <!-- .row end -->
                                    </div>
                                    <!-- container end -->
                                </li>
                            </ul>
                            <!-- .mega-dropdown-menu end -->
                        </li>
                        <!-- li end -->

                        <!-- About Menu -->
                        <li class="has-dropdown">
                            <a href="#" data-toggle="dropdown" class="dropdown-toggle menu-item">About</a>
                            <ul class="dropdown-menu">
                                <li>
                                    <a href="#">our story</a>
                                </li>
                                <li>
                                    <a href="#">our chefs</a>
                                </li>
                                <li>
                                    <a href="#">contact us</a>
                                </li>
                                <li>
                                    <a href="#">FAQs</a>
                                </li>
                                <li>
                                    <a href="#">guestbook</a>
                                </li>
                                <li>
                                    <a href="#">gallery</a>
                                </li>

                            </ul>
                        </li>
                        <!-- li end -->

                        <!-- About Menu -->
                        <li class="has-dropdown">
                            <a href="#" data-toggle="dropdown" class="dropdown-toggle  menu-item" data-hover="pages">Menu</a>
                            <ul class="dropdown-menu">
                                <li>
                                    <a href="#">menu board</a>
                                </li>
                                <li>
                                    <a href="#">menu classic</a>
                                </li>
                                <li>
                                    <a href="#">menu gallery</a>
                                </li>
                                <li>
                                    <a href="#">menu grid</a>
                                </li>
                                <li>
                                    <a href="#">menu simple</a>
                                </li>
                            </ul>
                        </li>
                        <!-- li end -->

                        <li>
                            <a class="menu-item" href="page-book-table.html">book a table</a>
                        </li>

                        <!-- Features Menu-->
                        <li class="has-dropdown">
                            <a href="#" data-toggle="dropdown" class="dropdown-toggle menu-item">features</a>
                            <ul class="dropdown-menu">
                                <li class="dropdown-submenu">
                                    <a href="#" data-toggle="dropdown" class="dropdown-toggle">revolution sliders</a>
                                    <ul class="dropdown-menu">
                                        <li class="has-dropdown">
                                            <a href="#" data-toggle="dropdown" class="dropdown-toggle">Sliders 1</a>
                                            <ul class="dropdown-menu">
                                                <li>
                                                    <a href="#">slider 1</a>
                                                </li>
                                                <li>
                                                    <a href="#">slider 2</a>
                                                </li>
                                                <li>
                                                    <a href="#">slider 3</a>
                                                </li>
                                                <li>
                                                    <a href="#">slider 4</a>
                                                </li>
                                            </ul>
                                        </li>
                                        <li class="has-dropdown">
                                            <a href="#" data-toggle="dropdown" class="dropdown-toggle">Sliders 2</a>
                                            <ul class="dropdown-menu">
                                                <li>
                                                    <a href="#">slider 5</a>
                                                </li>
                                                <li>
                                                    <a href="#">slider 6</a>
                                                </li>
                                                <li>
                                                    <a href="#">slider 7</a>
                                                </li>
                                                <li>
                                                    <a href="#">slider 8</a>
                                                </li>
                                                <li>
                                                    <a href="#">slider 9</a>
                                                </li>
                                            </ul>
                                        </li>
                                    </ul>
                                </li>
                                <li class="dropdown-submenu">
                                    <a href="#" data-toggle="dropdown" class="dropdown-toggle">Headers</a>
                                    <ul class="dropdown-menu">
                                        <li class="has-dropdown">
                                            <a href="#" data-toggle="dropdown" class="dropdown-toggle">transparent</a>
                                            <ul class="dropdown-menu">
                                                <li>
                                                    <a href="#">transparent 2</a>
                                                </li>
                                                <li>
                                                    <a href="#">transparent 3</a>
                                                </li>
                                                <li>
                                                    <a href="#">transparent 5</a>
                                                </li>
                                                <li>
                                                    <a href="#">transparent 6</a>
                                                </li>
                                                <li>
                                                    <a href="#">transparent 7</a>
                                                </li>
                                                <li>
                                                    <a href="#">transparent 8</a>
                                                </li>
                                            </ul>
                                        </li>
                                        <li class="has-dropdown">
                                            <a href="#" data-toggle="dropdown" class="dropdown-toggle">centered</a>
                                            <ul class="dropdown-menu">
                                                <li>
                                                    <a href="#">centered 1</a>
                                                </li>
                                                <li>
                                                    <a href="#">centered 2</a>
                                                </li>
                                            </ul>
                                        </li>
                                        <li class="has-dropdown">
                                            <a href="#" data-toggle="dropdown" class="dropdown-toggle">with topbar</a>
                                            <ul class="dropdown-menu">
                                                <li>
                                                    <a href="#">topbar 1</a>
                                                </li>
                                            </ul>
                                        </li>
                                        <li class="has-dropdown">
                                            <a href="#" data-toggle="dropdown" class="dropdown-toggle">fixed top</a>
                                            <ul class="dropdown-menu">
                                                <li>
                                                    <a href="header-1.html">fixed 1</a>
                                                </li>
                                                <li>
                                                    <a href="header-2.html">fixed 2</a>
                                                </li>
                                            </ul>
                                        </li>
                                        <li class="has-dropdown">
                                            <a href="#" data-toggle="dropdown" class="dropdown-toggle">bordered</a>
                                            <ul class="dropdown-menu">
                                                <li>
                                                    <a href="#">bordered 8</a>
                                                </li>
                                            </ul>
                                        </li>
                                    </ul>
                                </li>
                                <li class="dropdown-submenu">
                                    <a href="#" data-toggle="dropdown" class="dropdown-toggle">Footers</a>
                                    <ul class="dropdown-menu">
                                        <li>
                                            <a href="#">Footer 1</a>
                                        </li>
                                        <li>
                                            <a href="#">Footer 2</a>
                                        </li>
                                        <li>
                                            <a href="#">Footer 3</a>
                                        </li>
                                        <li>
                                            <a href="#">Footer 4</a>
                                        </li>
                                        <li>
                                            <a href="#">Footer 5</a>
                                        </li>
                                        <li>
                                            <a href="#">Footer 6</a>
                                        </li>
                                        <li>
                                            <a href="#">Footer 7</a>
                                        </li>
                                        <li>
                                            <a href="#">Footer 8</a>
                                        </li>
                                    </ul>
                                </li>
                                <li class="dropdown-submenu">
                                    <a href="#" data-toggle="dropdown" class="dropdown-toggle">page titels</a>
                                    <ul class="dropdown-menu">
                                        <li>
                                            <a href="#">page title 1</a>
                                        </li>
                                        <li>
                                            <a href="#">page title 2</a>
                                        </li>
                                        <li>
                                            <a href="#">page title 3</a>
                                        </li>
                                        <li>
                                            <a href=#>page title 4</a>
                                        </li>
                                        <li>
                                            <a href="page-title-5.html">page title 5</a>
                                        </li>
                                        <li>
                                            <a href="page-title-6.html">page title 6</a>
                                        </li>
                                        <li>
                                            <a href="page-title-7.html">page title 7</a>
                                        </li>
                                        <li>
                                            <a href="page-title-8.html">page title 8</a>
                                        </li>
                                        <li>
                                            <a href="page-title-9.html">page title 9</a>
                                        </li>
                                        <li>
                                            <a href="page-title-10.html">page title 10</a>
                                        </li>
                                        <li>
                                            <a href="page-title-11.html">page title 11</a>
                                        </li>
                                    </ul>
                                </li>
                                <li class="dropdown-submenu">
                                    <a href="#" data-toggle="dropdown" class="dropdown-toggle">widgets</a>
                                    <ul class="mega-menu">
                                        <li>
                                            <ul>
                                                <li>
                                                    <a href="elements-widgets.html">flickr stream</a>
                                                </li>
                                                <li>
                                                    <a href="elements-widgets.html">search</a>
                                                </li>
                                                <li>
                                                    <a href="elements-widgets.html">last tweets</a>
                                                </li>
                                                <li>
                                                    <a href="elements-widgets.html">Filter</a>
                                                </li>
                                                <li>
                                                    <a href="elements-widgets.html">recent posts</a>
                                                </li>
                                            </ul>
                                        </li>
                                        <li>
                                            <ul>
                                                <li>
                                                    <a href="elements-widgets.html">Advertisement</a>
                                                </li>
                                                <li>
                                                    <a href="elements-widgets.html">Recent Items</a>
                                                </li>
                                                <li>
                                                    <a href="elements-widgets.html">tag clouds</a>
                                                </li>
                                                <li>
                                                    <a href="elements-widgets.html">categories</a>
                                                </li>
                                            </ul>
                                        </li>
                                    </ul>
                                </li>
                                <li class="dropdown-submenu">
                                    <a href="#" data-toggle="dropdown" class="dropdown-toggle">untility pages</a>
                                    <ul class="dropdown-menu">
                                        <li>
                                            <a href="page-404.html">page 404</a>
                                        </li>
                                        <li>
                                            <a href="page-soon.html">coming soon</a>
                                        </li>
                                        <li>
                                            <a href="page-maintenance.html">maintenance</a>
                                        </li>
                                    </ul>
                                </li>
                                <li class="dropdown-submenu">
                                    <a href="#" data-toggle="dropdown" class="dropdown-toggle">page tempalates</a>
                                    <ul class="dropdown-menu">
                                        <li>
                                            <a href="page-layout-fullwidth.html">fullwidth</a>
                                        </li>
                                        <li>
                                            <a href="page-layout-fullwidth-wide.html">fullwidth wide</a>
                                        </li>
                                        <li>
                                            <a href="page-layout-sidebar-right.html">right sidebar</a>
                                        </li>
                                        <li>
                                            <a href="page-layout-sidebar-left.html">left sidebar</a>
                                        </li>

                                        <li>
                                            <a href="page-layout-blank.html">blank page</a>
                                        </li>
                                    </ul>
                                </li>
                                <li>
                                    <a href="landing.html">landing page</a>
                                </li>
                            </ul>
                        </li>
                        <!-- li end -->

                        <!-- Blog Menu-->
                        <li class="has-dropdown">
                            <a href="#" data-toggle="dropdown" class="dropdown-toggle menu-item">Blog</a>
                            <ul class="dropdown-menu">
                                <li>
                                    <a href="blog-carousel.html">blog carousel</a>
                                </li>
                                <li>
                                    <a href="blog-grid.html">blog grid</a>
                                </li>
                                <li>
                                    <a href="blog-standard.html">blog standard</a>
                                </li>
                                <li>
                                    <a href="blog-single.html">blog single</a>
                                </li>
                            </ul>
                        </li>
                        <!-- li end -->

                        <!-- shop Menu -->
                        <li class="has-dropdown">
                            <a href="#" data-toggle="dropdown" class="dropdown-toggle menu-item"
                               data-hover="shop">shop</a>
                            <ul class="dropdown-menu">
                                <li>
                                    <a href="shop-4cols.html">shop 4 columns</a>
                                </li>
                                <li>
                                    <a href="shop-products.html">shop products</a>
                                </li>
                                <li>
                                    <a href="shop-single.html">shop single</a>
                                </li>
                                <li>
                                    <a href="shop-cart.html">shop cart</a>
                                </li>
                            </ul>
                        </li>
                        <!-- li end -->

                        <!-- Elements Menu -->
                        <li class="has-dropdown mega-dropdown">
                            <a href="#" data-toggle="dropdown" class="dropdown-toggle menu-item">elements</a>
                            <ul class="dropdown-menu mega-dropdown-menu">
                                <li>
                                    <div class="container">
                                        <div class="row">
                                            <!-- Column #1 -->
                                            <div class="col-md-3">
                                                <a href="#">interactive elements</a>
                                                <ul>
                                                    <li>
                                                        <a href="elements-testimonials.html"><i
                                                                class="fa fa-quote-right"></i>testimonials</a>
                                                    </li>
                                                    <li>
                                                        <a href="elements-blockquotes.html"><i
                                                                class="fa fa-quote-left"></i>blockquotes</a>
                                                    </li>
                                                    <li>
                                                        <a href="elements-video-buttons.html"><i
                                                                class="fa fa-toggle-right"></i>video buttons</a>
                                                    </li>
                                                    <li>
                                                        <a href="elements-clients.html"><i class="fa fa-user"></i>clients</a>
                                                    </li>
                                                    <li>
                                                        <a href="elements-clients-carousel.html"><i
                                                                class="fa fa-users"></i>clients carousel</a>
                                                    </li>
                                                    <li>
                                                        <a href="elements-daily-specials.html"><i
                                                                class="fa fa-newspaper-o"></i>Daily Specials</a>
                                                    </li>
                                                </ul>
                                            </div>
                                            <!-- .col-md-3 end -->

                                            <!-- Column #2 -->
                                            <div class="col-md-3">
                                                <a href="#">standard elements</a>
                                                <ul>
                                                    <li>
                                                        <a href="elements-accordion.html"><i class="fa fa-server"></i>accordion</a>
                                                    </li>
                                                    <li>
                                                        <a href="elements-cta.html"><i class="fa fa-child"></i>call to
                                                            action</a>
                                                    </li>
                                                    <li>
                                                        <a href="elements-contact-form.html"><i
                                                                class="fa fa-desktop"></i>contact form</a>
                                                    </li>
                                                    <li>
                                                        <a href="elements-team.html"><i class="fa fa-group"></i>team
                                                            variations</a>
                                                    </li>
                                                    <li>
                                                        <a href="elements-tabs.html"><i class="fa fa-ellipsis-h"></i>tabs</a>
                                                    </li>
                                                    <li>
                                                        <a href="elements-reservation.html"><i class="fa fa-laptop"></i>reservation</a>
                                                    </li>
                                                </ul>
                                            </div>
                                            <!-- .col-md-3 end -->

                                            <!-- Column #3 -->
                                            <div class="col-md-3">
                                                <a href="#">infographics elements</a>
                                                <ul>
                                                    <li>
                                                        <a href="elements-counters.html"><i class="fa fa-dashboard"></i>counters</a>
                                                    </li>
                                                    <li>
                                                        <a href="elements-dividers.html"><i
                                                                class="fa fa-dot-circle-o"></i>dividers</a>
                                                    </li>
                                                    <li>
                                                        <a href="elements-pricing.html"><i class="fa fa-exchange"></i>pricing</a>
                                                    </li>
                                                    <li>
                                                        <a href="elements-list.html"><i class="fa fa-list"></i>list</a>
                                                    </li>
                                                    <li>
                                                        <a href="elements-progress-bars.html"><i
                                                                class="fa fa-hourglass-half"></i>progress bars</a>
                                                    </li>
                                                    <li>
                                                        <a href="elements-interactive-banners.html"><i
                                                                class="fa fa-laptop"></i>interactive banners</a>
                                                    </li>
                                                </ul>
                                            </div>
                                            <!-- .col-md-3 end -->

                                            <!-- Column #4 -->
                                            <div class="col-md-3">
                                                <a href="#">typography</a>
                                                <ul>
                                                    <li>
                                                        <a href="elements-buttons.html"><i class="fa fa-suitcase"></i>buttons</a>
                                                    </li>
                                                    <li>
                                                        <a href="elements-heading.html"><i
                                                                class="fa fa-sort-alpha-asc"></i>heading</a>
                                                    </li>
                                                    <li>
                                                        <a href="elements-columns-grids.html"><i class="fa fa-th"></i>columns
                                                            grids</a>
                                                    </li>
                                                    <li>
                                                        <a href="elements-icon-text.html"><i class="fa fa-sliders"></i>icon
                                                            text</a>
                                                    </li>

                                                    <li>
                                                        <a href="elements-typography.html"><i
                                                                class="fa fa-text-height"></i>typography</a>
                                                    </li>
                                                </ul>
                                            </div>
                                            <!-- .col-md-3 end -->
                                        </div>
                                        <!-- .row end -->
                                    </div>
                                    <!-- container end -->
                                </li>
                            </ul>
                            <!-- .mega-dropdown-menu end -->
                        </li>
                    </ul>
                    <!-- Module Reservation  -->
                    <div class="module module-reservation pull-left">
                        <a class="btn-popup btn-popup-theme" data-toggle="modal" data-target="#reservationModule">Book A
                            Table</a>
                        <div class="modal fade reservation-popup" tabindex="-1" role="dialog" id="reservationModule">
                            <div class="modal-dialog modal-lg" role="document">
                                <div class="modal-content">
                                    <div class="modal-body">
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><i
                                                class="fa fa-times"></i></button>
                                        <div class="row reservation reservation-1">
                                            <div class="col-xs-12 col-sm-12 col-md-12">
                                                <div class="reservation-form mb-30 text-center">
                                                    <div class="reservation-bordered">
                                                        <div class="heading heading-1 text-center">
                                                            <p class="heading--subtitle">Reservation</p>
                                                            <h2 class="heading--title">Book Your Table</h2>
                                                            <div class="divider--shape-4"></div>
                                                        </div>
                                                        <div class="reservation--dec">
                                                            You can Book a table online easily in just a couple of
                                                            minutes. We take reservations for lunch and dinner, just
                                                            check the availability of your table & book it now!
                                                        </div>
                                                        <form method="post"
                                                              action="../../../resources/assets/php/reservationpopup.php"
                                                              class="reservationPopupForm mb-0">
                                                            <div class="row">
                                                                <div class="col-xs-12 col-sm-12 col-md-4">
                                                                    <div class="form-select">
                                                                        <i class="fa fa-angle-down"></i>
                                                                        <select class="form-control" name="people"
                                                                                id="numPopup" required>
                                                                            <option value="">Number of people</option>
                                                                            <option value="2">2 People</option>
                                                                            <option value="3">3 People</option>
                                                                            <option value="4">4 People</option>
                                                                            <option value="5">5 People</option>
                                                                            <option value="6">6 People</option>
                                                                            <option value="8">8 People</option>
                                                                            <option value="10">10 People</option>
                                                                        </select>
                                                                    </div>
                                                                </div>
                                                                <div class="col-xs-12 col-sm-12 col-md-4">
                                                                    <div class="form-select">
                                                                        <i class="fa fa-angle-down"></i>
                                                                        <select class="form-control" name="day"
                                                                                id="dayPopup" required>
                                                                            <option value="">Date</option>
                                                                            <option value="november 23">November 23,
                                                                                2018
                                                                            </option>
                                                                            <option value="november 24">November 24,
                                                                                2018
                                                                            </option>
                                                                            <option value="november 25">November 25,
                                                                                2018
                                                                            </option>
                                                                            <option value="november 26">November 26,
                                                                                2018
                                                                            </option>
                                                                            <option value="november 27">November 27,
                                                                                2018
                                                                            </option>
                                                                        </select>
                                                                    </div>
                                                                </div>
                                                                <div class="col-xs-12 col-sm-12 col-md-4">
                                                                    <div class="form-select">
                                                                        <i class="fa fa-angle-down"></i>
                                                                        <select class="form-control" name="time"
                                                                                id="timePopup" required>
                                                                            <option value="">Time</option>
                                                                            <option value="8:00">8:00 PM</option>
                                                                            <option value="9:00">9:00 PM</option>
                                                                            <option value="10:00">10:00 PM</option>
                                                                            <option value="11:00">11:00 PM</option>
                                                                            <option value="12:00">12:00 AM</option>
                                                                        </select>
                                                                    </div>
                                                                </div>
                                                                <div class="col-xs-12 col-sm-12 col-md-12">
                                                                    <button type="submit" id="submit-message"
                                                                            class="btn btn--secondary btn--block">Find
                                                                        Table
                                                                    </button>
                                                                </div>
                                                                <div class="col-xs-12 col-sm-12 col-md-12">
                                                                    <!--Alert Message-->
                                                                    <div class="reservation-result"></div>
                                                                </div>
                                                            </div>
                                                            <!-- .row end -->

                                                        </form>
                                                        <!-- form end -->
                                                    </div>
                                                </div>
                                                <!-- .contact-form end -->
                                            </div>
                                            <!-- .col-md-8 end -->
                                            <div class="col-xs-12 col-sm-12 col-md-12">
                                                <div class="text-uppercase text-center">
                                                    <strong><span class="text-white">Reservation Powered by</span> <a
                                                            href="#">Opentable</a></strong>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- .row end -->
                                    </div>
                                </div>
                                <!-- /.modal-content -->
                            </div>
                            <!-- /.modal-dialog -->
                        </div>
                        <!-- /.modal -->
                    </div>
                    <!-- Module Cart -->
                    <div class="module module-cart pull-left">
                        <div class="module-icon cart-icon">
                            <i class="fa fa-shopping-cart"></i>
                            <span class="title">shop cart</span>
                            <label class="module-label">2</label>
                        </div>
                        <div class="module-content module-box cart-box">
                            <div class="cart-overview">
                                <ul class="list-unstyled">
                                    <li>
                                        <img class="img-responsive"
                                             src="../../../resources/assets/images/shop/thumb/6.jpg" alt="product"/>
                                        <div class="product-meta">
                                            <h5 class="product-title">Red Tape Shoes</h5>
                                            <p class="product-price">1 x $ 34.00</p>
                                        </div>
                                        <a class="cart-cancel" href="#">cancel</a>
                                    </li>
                                    <li>
                                        <img class="img-responsive"
                                             src="../../../resources/assets/images/shop/thumb/7.jpg" alt="product"/>
                                        <div class="product-meta">
                                            <h5 class="product-title">Brave Sweater</h5>
                                            <p class="product-price">1 x $ 32.00</p>
                                        </div>
                                        <a class="cart-cancel" href="#">cancel</a>
                                    </li>
                                </ul>
                            </div>
                            <div class="cart-total">
                                <div class="total-desc">
                                    Subtotal:
                                </div>
                                <div class="total-price">
                                    $73.00
                                </div>
                            </div>
                            <div class="clearfix">
                            </div>
                            <div class="cart--control">
                                <a class="btn btn--primary btn--block btn--rounded mb-10" href="#">view cart</a>
                                <a class="btn btn--white btn--bordered btn--rounded btn--block" href="#">Checkout</a>
                            </div>
                        </div>
                    </div>
                    <!-- .module-cart end -->
                    <!-- Module Search -->
                    <div class="module module-search pull-left">
                        <div class="module-icon search-icon">
                            <i class="fa fa-search"></i>
                            <span class="title">search</span>
                        </div>
                        <div class="module-content module-fullscreen module--search-box">
                            <div class="pos-vertical-center">
                                <div class="container">
                                    <div class="row">
                                        <div class="col-xs-12 col-sm-12 col-md-8 col-md-offset-2">
                                            <form class="form-search">
                                                <input type="text" class="form-control"
                                                       placeholder="Type Search Words Then Enter">
                                                <button class="btn" type="button"><i class="fa fa-search"></i></button>
                                            </form>
                                            <!-- .form-search end -->
                                        </div>
                                        <!-- .col-md-8 end -->
                                    </div>
                                    <!-- .row end -->
                                </div>
                                <!-- .container end -->
                            </div>
                            <a class="module-cancel" href="#"><i class="fa fa-times"></i></a>
                        </div>
                    </div>
                    <!-- .module-search end -->
                    <!-- Module Side NAV -->
                    <div class="module module-side-nav pull-left">
                        <div class="module-icon side-nav-icon">
                            <i class="fa fa-bars"></i>
                            <span class="title">Side Navigation</span>
                        </div>
                        <div class="module-content module-hamburger">
                            <div class="hamburger-panel module-widgets">

                                <!-- Recent Posts
============================================= -->
                                <div class="widget widget-recent-posts">
                                    <div class="widget--title">
                                        <h5>recent posts</h5>
                                    </div>
                                    <div class="widget--content">
                                        <div class="entry">
                                            <img src="../../../resources/assets/images/blog/thumb/1.jpg" alt="title"/>
                                            <div class="entry-desc">
                                                <div class="entry-meta">
                                                    <a href="#">Oct 15, 2017</a>
                                                </div>
                                                <div class="entry-title">
                                                    <a href="#">The Best Side Dishes for Next Dinner</a>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- .recent-entry end -->

                                        <div class="entry">
                                            <img src="../../../resources/assets/images/blog/thumb/2.jpg" alt="title"/>
                                            <div class="entry-desc">
                                                <div class="entry-meta">
                                                    <a href="#">sep 15, 2017</a>
                                                </div>
                                                <div class="entry-title">
                                                    <a href="#">Cornbread Stuffing Apples and Sausage</a>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- .recent-entry end -->

                                    </div>
                                </div>
                                <!-- .widget-recent end -->

                                <!-- Instagram Feed
============================================= -->
                                <div class="widget widget-instagram">
                                    <div class="widget--title">
                                        <h5>Instagram</h5>
                                    </div>
                                    <div class="widget--content">
                                        <div id="instafeedModule" class="instafeed" data-insta-number="8"></div>
                                        <div class="clearfix"></div>
                                    </div>
                                </div>
                                <!-- .widget-instagram end -->

                                <!-- Tag Clouds
============================================= -->
                                <div class="widget widget-tags">
                                    <div class="widget--title">
                                        <h5>tag clouds</h5>
                                    </div>
                                    <div class="widget--content">
                                        <a href="#">responsive</a>
                                        <a href="#">modern</a>
                                        <a href="#">corporate</a>
                                        <a href="#">business</a>
                                        <a href="#">awesome</a>
                                        <a href="#">fresh</a>

                                    </div>
                                </div>
                                <!-- .widget-tags end -->
                                <a class="module-cancel" href="#"><i class="fa fa-times"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /.navbar-collapse -->
            </div>
            <!-- /.container-fluid -->
        </nav>
    </header>
    <section id="slider" class="slider slide-overlay-dark">
        <!-- START REVOLUTION SLIDER 5.0 -->
        <div class="rev_slider_wrapper">
            <div id="slider1" class="rev_slider" data-version="5.0">
                <ul>
                    <!-- slide 1 -->
                    <li data-transition="zoomin"
                        data-slotamount="default"
                        data-easein="Power4.easeInOut"
                        data-easeout="Power4.easeInOut"
                        data-masterspeed="400">
                        <!-- MAIN IMAGE -->
                        <img src="http://via.placeholder.com/1920x1280" alt="Slide Background Image" width="1920"
                             height="1280">
                        <!-- LAYER NR. 1 -->
                        <div class="tp-caption"
                             data-x="center" data-hoffset="0"
                             data-y="center" data-voffset="-130"
                             data-whitespace="nowrap"
                             data-width="none"
                             data-height="none"
                             data-frames='[{"delay":400,"speed":1000,"frame":"0","from":"y:-50px;opacity:0;","to":"o:1;","ease":"Power3.easeInOut"},{"delay":"wait","speed":300,"frame":"999","to":"auto:auto;","ease":"Power3.easeInOut"}]'
                             data-splitin="none"
                             data-splitout="none"
                             data-responsive_offset="on">
                            <div class="slide--subheadline">Welcome To Steak In</div>
                        </div>

                        <!-- LAYER NR. 2 -->
                        <div class="tp-caption"
                             data-x="center" data-hoffset="0"
                             data-y="center" data-voffset="-65"
                             data-whitespace="nowrap"
                             data-width="none"
                             data-height="none"
                             data-frames='[{"delay":400,"speed":1000,"frame":"0","from":"x:-50px;opacity:0;","to":"o:1;","ease":"Power3.easeInOut"},{"delay":"wait","speed":300,"frame":"999","to":"auto:auto;","ease":"Power3.easeInOut"}]'
                             data-splitin="none"
                             data-splitout="none"
                             data-responsive_offset="on">
                            <div class="slide--headline">We Are Food Masters!</div>
                        </div>

                        <!-- LAYER NR. 3 -->
                        <div class="tp-caption"
                             data-x="center" data-hoffset="0"
                             data-y="center" data-voffset="20"
                             data-width="none"
                             data-height="none"
                             data-frames='[{"delay":400,"speed":1000,"frame":"0","from":"y:50px;opacity:0;","to":"o:1;","ease":"Power3.easeInOut"},{"delay":"wait","speed":300,"frame":"999","to":"opacity:0;","ease":"Power3.easeInOut"}]'
                             data-splitin="none"
                             data-splitout="none"
                             data-responsive_offset="on"
                        >
                            <div class="slide--bio text--center">Steak In has the perfect place to enjoy fine food and
                                great cocktails with <br>excellent service, in comfortable atmospheric surroundings.
                            </div>
                        </div>

                        <!-- LAYER NR. 4 -->
                        <div class="tp-caption"
                             data-x="center" data-hoffset="0"
                             data-y="center" data-voffset="100"
                             data-width="none"
                             data-height="none"
                             data-whitespace="nowrap"
                             data-transform_idle="o:1;"
                             data-transform_hover="o:1;rX:0;rY:0;rZ:0;z:0;s:300;e:Power3.easeOut;"
                             data-style_hover="c:rgba(255, 255, 255, 1.00);bc:rgba(255, 255, 255, 1.00);"
                             data-transform_in="y:[100%];z:0;rX:0deg;rY:0;rZ:0;sX:1;sY:1;skX:0;skY:0;opacity:0;s:2000;e:Power4.easeInOut;"
                             data-transform_out="y:[175%];s:1000;e:Power2.easeInOut;s:1000;e:Power2.easeInOut;"
                             data-mask_out="x:inherit;y:inherit;"
                             data-start="1250"
                             data-splitin="none"
                             data-splitout="none"
                             data-frames='[{"delay":400,"speed":1500,"frame":"0","from":"y:bottom;rX:-20deg;rY:-20deg;rZ:0deg;","to":"o:1;","ease":"Power3.easeOut"},{"delay":"wait","speed":300,"frame":"999","to":"auto:auto;","ease":"Power3.easeInOut"}]'
                             data-basealign="slide"
                             data-responsive_offset="on"
                             data-responsive="off">
                            <div class="slide-action">
                                <a class="btn btn--white btn--bordered btn--rounded btn--lg" href="#">Book Your Table
                                    Now</a>
                            </div>
                        </div>
                    </li>

                    <!-- slide 2 -->
                    <li data-transition="slideoverdown"
                        data-slotamount="default"
                        data-easein="Power4.easeInOut"
                        data-easeout="Power4.easeInOut"
                        data-masterspeed="400">
                        <!-- MAIN IMAGE -->
                        <img src="http://via.placeholder.com/1920x1280" alt="Slide Background Image" width="1920"
                             height="1280">
                        <!-- LAYER NR. 1 -->
                        <div class="tp-caption"
                             data-x="center" data-hoffset="0"
                             data-y="center" data-voffset="-130"
                             data-whitespace="nowrap"
                             data-width="none"
                             data-height="none"
                             data-frames='[{"delay":400,"speed":1500,"frame":"0","from":"z:0;rX:0;rY:0;rZ:0;sX:0.9;sY:0.9;skX:0;skY:0;opacity:0;","to":"o:1;","ease":"Power3.easeInOut"},{"delay":"wait","speed":300,"frame":"999","to":"auto:auto;","ease":"Power3.easeInOut"}]'
                             data-splitin="none"
                             data-splitout="none"
                             data-responsive_offset="on">
                            <div class="slide--subheadline">Hello, We Are Granny</div>
                        </div>

                        <!-- LAYER NR. 2 -->
                        <div class="tp-caption"
                             data-x="center" data-hoffset="0"
                             data-y="center" data-voffset="-65"
                             data-whitespace="nowrap"
                             data-width="none"
                             data-height="none"
                             data-frames='[{"delay":400,"speed":1000,"frame":"0","from":"z:0;rX:0deg;rY:0;rZ:0;sX:2;sY:2;skX:0;skY:0;opacity:0;","mask":"x:0px;y:0px;s:inherit;e:inherit;","to":"o:1;","ease":"Power2.easeOut"},{"delay":"wait","speed":300,"frame":"999","to":"auto:auto;","ease":"Power3.easeInOut"}]'
                             data-splitin="none"
                             data-splitout="none"
                             data-responsive_offset="on">
                            <div class="slide--headline extend">We Serve Quality Food</div>
                        </div>

                        <!-- LAYER NR. 3 -->
                        <div class="tp-caption"
                             data-x="center" data-hoffset="0"
                             data-y="center" data-voffset="20"
                             data-width="none"
                             data-height="none"
                             data-frames='[{"delay":400,"speed":300,"frame":"0","from":"y:50px;opacity:0;","to":"o:1;","ease":"Power3.easeInOut"},{"delay":"wait","speed":300,"frame":"999","to":"opacity:0;","ease":"Power3.easeInOut"}]'
                             data-splitin="none"
                             data-splitout="none"
                             data-responsive_offset="on"
                        >
                            <div class="slide--bio text--center">Granny is a restaurant, bar and coffee roastery located
                                on Egypt. We have<br>awesome recipes and the most talented chefs in town!
                            </div>
                        </div>

                        <!-- LAYER NR. 4 -->
                        <div class="tp-caption"
                             data-x="center" data-hoffset="0"
                             data-y="center" data-voffset="100"
                             data-width="none"
                             data-height="none"
                             data-whitespace="nowrap"
                             data-frames='[{"delay":400,"speed":1500,"frame":"0","from":"x:[-100%];z:0;rX:0deg;rY:0;rZ:0;sX:1;sY:1;skX:0;skY:0;","mask":"x:0px;y:0px;s:inherit;e:inherit;","to":"o:1;","ease":"Power3.easeInOut"},{"delay":"wait","speed":300,"frame":"999","to":"auto:auto;","ease":"Power3.easeInOut"}]'
                             data-splitin="none"
                             data-splitout="none"
                             data-actions='[{"event":"click","action":"jumptoslide","slide":"rs-164","delay":""}]'
                             data-basealign="slide"
                             data-responsive_offset="on"
                             data-responsive="off">
                            <div class="slide-action">
                                <a class="btn btn--primary btn--inverse btn--rounded btn--lg" href="#">View Menu</a>
                            </div>
                        </div>
                    </li>

                    <!-- slide 3 -->
                    <li data-transition="zoomout"
                        data-slotamount="default"
                        data-easein="Power4.easeInOut"
                        data-easeout="Power4.easeInOut"
                        data-masterspeed="400">
                        <!-- MAIN IMAGE -->
                        <img src="http://via.placeholder.com/1920x1280" alt="Slide Background Image" width="1920"
                             height="1280">
                        <!-- LAYER NR. 1 -->
                        <div class="tp-caption"
                             data-x="center" data-hoffset="0"
                             data-y="center" data-voffset="-65"
                             data-whitespace="nowrap"
                             data-width="none"
                             data-height="none"
                             data-frames='[{"delay":400,"speed":1500,"frame":"0","from":"x:[-100%];z:0;rX:0deg;rY:0;rZ:0;sX:1;sY:1;skX:0;skY:0;","mask":"x:0px;y:0px;s:inherit;e:inherit;","to":"o:1;","ease":"Power3.easeInOut"},{"delay":"wait","speed":300,"frame":"999","to":"auto:auto;","ease":"Power3.easeInOut"}]'
                             data-splitin="none"
                             data-splitout="none"
                             data-responsive_offset="on">
                            <div class="slide--subheadline">Steak In Offers You</div>
                        </div>

                        <!-- LAYER NR. 2 -->
                        <div class="tp-caption"
                             data-x="center" data-hoffset="0"
                             data-y="center" data-voffset="0"
                             data-whitespace="nowrap"
                             data-width="none"
                             data-height="none"
                             data-frames='[{"delay":400,"speed":1500,"frame":"0","from":"z:0;rX:0;rY:0;rZ:0;sX:0.9;sY:0.9;skX:0;skY:0;opacity:0;","to":"o:1;","ease":"Power3.easeInOut"},{"delay":"wait","speed":300,"frame":"999","to":"auto:auto;","ease":"Power3.easeInOut"}]'
                             data-splitin="none"
                             data-splitout="none"
                             data-responsive_offset="on">
                            <div class="slide--headline">Fresh & Tasty Meals</div>
                        </div>

                        <!-- LAYER NR. 3 -->
                        <div class="tp-caption"
                             data-x="center" data-hoffset="0"
                             data-y="center" data-voffset="100"
                             data-width="none"
                             data-height="none"
                             data-frames='[{"delay":400,"speed":2000,"frame":"0","from":"y:[100%];z:0;rX:0deg;rY:0;rZ:0;sX:1;sY:1;skX:0;skY:0;opacity:0;","mask":"x:0px;y:[100%];s:inherit;e:inherit;","to":"o:1;","ease":"Power2.easeInOut"},{"delay":"wait","speed":300,"frame":"999","to":"auto:auto;","ease":"Power3.easeInOut"}]'
                             data-splitin="none"
                             data-splitout="none"
                             data-responsive_offset="on">
                            <div class="slide--bio text--center">Steak In has the perfect place to enjoy fine food and
                                great cocktails with <br>excellent service, in comfortable atmospheric surroundings.
                            </div>
                        </div>
                    </li>

                </ul>
            </div>
            <!-- END REVOLUTION SLIDER -->
        </div>
        <!-- END OF SLIDER WRAPPER -->
    </section>
</div>
<div style="padding-left: 20px;padding-right: 20px;">
    <h1>Elements</h1>
    <div class="container-fluid">
        <div class="row">
            <h3>Scroll bar element</h3>
        </div>
        <div class="row">
            <div class="col-xs-3">
                <div class="scroll-1" style="height: 100px;overflow: scroll;overflow-x: hidden;">
                    <div style="height: auto;">
                        Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been
                        the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley
                        of type and scrambled it to make a type specimen book. It has survived not only five centuries,
                        but also the leap into electronic typesetting, remaining essentially unchanged. It was
                        popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages,
                        and more recently with desktop publishing software like Aldus PageMaker including versions of
                        Lorem Ipsum.
                    </div>
                </div>
            </div>
            <div class="col-xs-3">
                <div class="scroll-2" style="height: 100px;overflow: scroll;overflow-x: hidden;">
                    <div style="height: auto;">
                        Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been
                        the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley
                        of type and scrambled it to make a type specimen book. It has survived not only five centuries,
                        but also the leap into electronic typesetting, remaining essentially unchanged. It was
                        popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages,
                        and more recently with desktop publishing software like Aldus PageMaker including versions of
                        Lorem Ipsum.
                    </div>
                </div>
            </div>
            <div class="col-xs-3">
                <div class="scroll-3" style="height: 100px;overflow: scroll;overflow-x: hidden;">
                    <div style="height: auto;">
                        Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been
                        the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley
                        of type and scrambled it to make a type specimen book. It has survived not only five centuries,
                        but also the leap into electronic typesetting, remaining essentially unchanged. It was
                        popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages,
                        and more recently with desktop publishing software like Aldus PageMaker including versions of
                        Lorem Ipsum.
                    </div>
                </div>
            </div>
            <div class="col-xs-3">
                <div class="scroll-4" style="height: 100px;overflow: scroll;overflow-x: hidden;">
                    <div style="height: auto;">
                        Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been
                        the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley
                        of type and scrambled it to make a type specimen book. It has survived not only five centuries,
                        but also the leap into electronic typesetting, remaining essentially unchanged. It was
                        popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages,
                        and more recently with desktop publishing software like Aldus PageMaker including versions of
                        Lorem Ipsum.
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <h3>FORM</h3>
        </div>
        <div class="row">
            <div class="col-xs-3">
                <div class="form-select">
                    <i class="fa fa-angle-down"></i>
                    <select class="form-control" name="day" id="day">
                        <option value="">Date</option>
                        <option value="november 23">November 23, 2018</option>
                        <option value="november 24">November 24, 2018</option>
                        <option value="november 25">November 25, 2018</option>
                        <option value="november 26">November 26, 2018</option>
                        <option value="november 27">November 27, 2018</option>
                    </select>
                </div>
            </div>
            <div class="col-xs-3">
                <div class="form-select">
                    <i class="fa fa-angle-down primary"></i>
                    <select class="form-control valid" name="time" id="time" aria-invalid="false">
                        <option value="">Time</option>
                        <option value="8:00">8:00 PM</option>
                        <option value="9:00">9:00 PM</option>
                        <option value="10:00">10:00 PM</option>
                        <option value="11:00">11:00 PM</option>
                        <option value="12:00">12:00 AM</option>
                    </select>
                </div>
            </div>
        </div>
        <div class="row mt-20">
            <div class="col-xs-3">
                <div class="dropdown position-relative">
                    <button class="btn btn-default dropdown-toggle custom-toggle-btn" type="button" id="dropdownMenu2"
                            data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
                        Dropdown
                        <span class="caret"></span>
                    </button>
                    <ul class="dropdown-menu custom" aria-labelledby="dropdownMenu2">
                        <li><a>Action</a></li>
                        <li><a>Another action</a></li>
                        <li><a>Something else here</a></li>
                        <li role="separator" class="divider"></li>
                        <li><a>Separated link</a></li>
                    </ul>
                </div>
            </div>
            <div class="col-xs-3">
                <div class="dropdown position-relative">
                    <button class="btn btn-default dropdown-toggle custom-toggle-btn w-100" type="button"
                            id="dropdownMenu1"
                            data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
                        Dropdown
                        <span class="caret"></span>
                    </button>
                    <ul class="dropdown-menu custom checkbox-menu allow-focus" aria-labelledby="dropdownMenu1">
                        <li>
                            <label class="checkbox-type">
                                <span>Action</span>
                                <div class="checks d-inline"><input class="checkbox" type="checkbox" id="check-1-1">
                                    <label
                                            for="check-1-1"></label></div>
                            </label>
                        </li>
                        <li>
                            <label class="checkbox-type">
                                <span>Cheese</span>
                                <div class="checks d-inline"><input class="checkbox" type="checkbox" id="check-1-2">
                                    <label
                                            for="check-1-2"></label></div>
                            </label>
                        </li>
                        <li>
                            <label class="checkbox-type">
                                <span>Something else here</span>
                                <div class="checks d-inline"><input class="checkbox" type="checkbox" id="check-1-3">
                                    <label
                                            for="check-1-3"></label></div>
                            </label>
                        </li>
                        <li role="separator" class="divider"></li>
                        <li>
                            <label class="checkbox-type">
                                <span>Separated link</span>
                                <div class="checks d-inline"><input class="checkbox" type="checkbox" id="check-1-4">
                                    <label
                                            for="check-1-4"></label></div>
                            </label>
                        </li>
                        <li>
                            <label class="checkbox-type">
                                <span>Separated link</span>
                                <div class="checks d-inline"><input class="checkbox" type="checkbox" id="check-1-5">
                                    <label
                                            for="check-1-4"></label></div>
                            </label>
                        </li>
                        <div class="checks-total">
                        </div>
                    </ul>
                </div>
            </div>
            <div class="col-xs-3">
                <div class="dropdown position-relative">
                    <button class="btn btn-default dropdown-toggle custom-toggle-btn w-100" type="button"
                            id="dropdownMenu0"
                            data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
                        Dropdown
                        <span class="caret"></span>
                    </button>
                    <ul class="dropdown-menu custom checkbox-menu allow-focus" aria-labelledby="dropdownMenu0">
                        <li>
                            <label class="checkbox-type">
                                <span>Action</span>
                                <div class="checks d-inline"><input class="checkbox" type="checkbox" id="check-2-1">
                                    <label
                                            for="check-1-1"></label></div>
                            </label>
                        </li>
                        <li>
                            <label class="checkbox-type">
                                <span>Cheese</span>
                                <div class="checks d-inline"><input class="checkbox" type="checkbox" id="check-2-2">
                                    <label
                                            for="check-1-2"></label></div>
                            </label>
                        </li>
                        <li>
                            <label class="checkbox-type">
                                <span>Something else here</span>
                                <div class="checks d-inline"><input class="checkbox" type="checkbox" id="check-2-3">
                                    <label
                                            for="check-1-3"></label></div>
                            </label>
                        </li>
                        <li role="separator" class="divider"></li>
                        <li>
                            <label class="checkbox-type">
                                <span>Separated link</span>
                                <div class="checks d-inline"><input class="checkbox" type="checkbox" id="check-2-4">
                                    <label
                                            for="check-1-4"></label></div>
                            </label>
                        </li>
                        <li>
                            <label class="checkbox-type">
                                <span>Separated link</span>
                                <div class="checks d-inline"><input class="checkbox" type="checkbox" id="check-2-5">
                                    <label
                                            for="check-1-4"></label></div>
                            </label>
                        </li>
                        <div class="checks-total">
                        </div>
                    </ul>
                </div>
            </div>
        </div>
        <div class="row mt-20">
            <div class="col-xs-3">
                <div class="image-container">
                    <div class="custom-file">
                        <div class="add-gallery-text">
                            <i class="fa fa-file"></i>
                            <span>Drag &amp; Drop or Click</span>
                        </div>
                        <div class="file-input-bg-img"
                             style="background-image: url('../resources/assets/images/background/1.jpg')">
                        </div>
                        <input class="d-none" type="text" name="thumbnail_name"
                               id="thumbnail-name">
                        <input type="file" class="custom-file-input" id="thumbnail-file"
                               name="thumbnail-file">
                    </div>
                </div>
            </div>
            <div class="col-xs-3">
                <div class="image-container">
                    <div class="custom-file">
                        <div class="add-gallery-text">
                            <i class="fa fa-file"></i>
                            <span>Drag &amp; Drop or Click</span>
                        </div>
                        <div class="file-input-bg-img" id="custom-file-background"
                             style="background-image: url('')">
                        </div>
                        <input class="d-none" type="text" name="thumbnail_name" id="custom-file-name">
                        <input type="file" class="custom-file-input" id="custom-file-input"
                               name="thumbnail-file">
                    </div>
                </div>
            </div>
        </div>
        <div class="row mt-20">
            <div class="col-xs-2">
                <input type="text" class="form-control" name="contact-name" id="input-text-1" placeholder="placeholder"
                >
            </div>
            <div class="col-xs-2">
                <input type="text" class="form-control" name="contact-name" id="input-text-2" placeholder="placeholder"
                       value="input value">
            </div>
            <div class="col-xs-2">
                <div class="input-container">
                    <input type="text" class="form-control" name="contact-name" id="input-text-3"
                           placeholder="placeholder"
                           value="input value in button">
                    <a class="btn btn--primary btn--bordered btn--rounded input-container-button" href="#">Button</a>
                </div>
            </div>
            <div class="col-xs-2">
                <div class="input-container">
                    <input type="text" class="form-control" name="contact-name" id="input-text-4"
                           placeholder="placeholder"
                           value="input value in button">
                    <a class="btn btn--primary btn--bordered btn--rounded input-container-button" href="#">확인</a>
                </div>
            </div>
            <div class="col-xs-2">
                <div class="input-container">
                    <input type="password" class="form-control" name="contact-name" id="input-text-5"
                           placeholder="password"
                    >
                    <a class="btn btn--primary btn--bordered btn--rounded input-container-button" href="#">확인</a>
                </div>
            </div>
            <div class="col-xs-2">
                <div class="input-container prepend-container">
                    <span class="prepend-icon"><i class="fa fa-file"></i></span>
                    <input type="text" class="form-control" name="contact-name" id="input-text-6"
                           placeholder="input value in button prepend"
                    >
                    <a class="btn btn--primary btn--bordered btn--rounded input-container-button" href="#">확인</a>
                </div>
            </div>
        </div>
        <div class="row mt-20">
            <div class="col-xs-3">
                <div class="input-container">
                    <input type="text" class="form-control input-border-circle" name="contact-name" id="input-text-7"
                           placeholder="placeholder" value="input value in button border"
                    >
                    <a class="btn btn--primary btn--rounded btn--block input-container-button syncronize-input-button"
                       href="#">구독하기</a>
                </div>
            </div>
            <div class="col-xs-3">
                <div class="input-group search-container">
                    <input type="text" class="form-control" placeholder="Type Your Search Words">
                    <span class="input-group-btn"><button class="btn" type="button"><i
                            class="fa fa-search primary"></i></button></span>
                </div>
            </div>
            <div class="col-xs-3">
                <div class="input-group search-container">
                    <input type="text" class="form-control" placeholder="Type Your Search Words">
                    <span class="input-group-btn"><button class="btn" type="button"><i
                            class="fa fa-search"></i></button></span>
                </div>
            </div>
        </div>
        <div class="row mt-20">
            <div class="col-xs-3">
                <textarea class="form-control autosize" name="contact-message" id="message1" rows="3"
                          placeholder="Message"></textarea>
            </div>
            <div class="col-xs-3">
                <textarea class="form-control autosize fix-height-100" name="contact-message" id="message2" rows="3"
                          placeholder="Message"></textarea>
            </div>
            <div class="col-xs-3">
                <textarea class="form-control autosize fix-height-150" name="contact-message" id="message3" rows="3"
                          placeholder="Message"></textarea>
            </div>
        </div>
        <div class="row">
            <h3>BUTTON</h3>
        </div>
        <div class="row">
            <div class="col-xs-2">
                <a class="btn btn--primary btn--block" href="#">Button</a>
            </div>
            <div class="col-xs-2">
                <a class="btn btn--primary btn--inverse btn-inverse-border" href="#">Button Inverse</a>
            </div>
            <div class="col-xs-2">
                <a class="btn btn--primary btn--rounded btn--block" href="#">read more</a>
            </div>
            <div class="col-xs-2">
                <a class="btn btn--primary btn--bordered btn--rounded" href="#">read more</a>
            </div>
            <div class="col-xs-2">
                <a class="btn btn--primary btn--bordered btn--block" href="#">Button</a>
            </div>
            <div class="col-xs-2">
                <a class="btn btn--primary btn--bordered" href="#">read more</a>
            </div>
        </div>
        <div class="row mt-20">
            <div class="col-xs-2">
                <a class="btn btn--secondary btn--block" href="#">read more</a>
            </div>
            <div class="col-xs-2">
                <a class="btn btn--secondary btn--bordered btn--rounded btn--block" href="#">read more</a>
            </div>
            <div class="col-xs-2">
                <a class="btn btn--primary btn--bordered btn--block" href="#">Button in icon</a>
            </div>
            <div class="col-xs-2">
                <a class="btn btn--primary btn--bordered position-relative w-100" href="#">Button in icon<i
                        class="fa fa-instagram btn-icon"></i></a>
            </div>
            <div class="col-xs-2">
                <a class="btn btn--secondary btn--block" href="#">Button in icon<i class="fa fa-instagram btn-icon"></i></a>
            </div>
            <div class="col-xs-2" style="background-color: #0c5460">
                <a class="btn btn--primary btn--bordered btn-white-theme" href="#">read more</a>
            </div>
        </div>
        <div class="row mt-20">
            <div class="col-xs-3">
                <a class="btn btn--secondary btn--block" href="#">Button in icon Shift<i
                        class="fa fa-instagram btn-icon-shift"></i></a>
            </div>
        </div>
        <div class="row mt-20">
            <div class="col-xs-6">
                <div class="tags-container horizontal">
                    <p class="tag"><span class="text">Hash tags button vertical</span><span class="x-button"></span></p>
                    <p class="tag"><span class="text">Hash tags button vertical</span><span class="x-button"></span></p>
                    <p class="tag"><span class="text">Hash tags button vertical</span><span class="x-button"></span></p>
                </div>
            </div>
            <div class="col-xs-6">
                <%--TODO Custom Javascript 참조 <Body>의 아랫부분 작성--%>
                <input type="text" class="form-control mb-15" id="input-hash" autocomplete="off" maxlength="20"
                       placeholder="Please write text and enter">
                <div class="tags-container horizontal" id="hash-container">
                    <p class="tag"><span class="text">Hash tags button vertical</span><span
                            class="x-button"></span></p>
                    <p class="tag"><span class="text">Hash tags button vertical</span><span
                            class="x-button"></span></p>
                    <p class="tag"><span class="text">Hash tags button vertical</span><span
                            class="x-button"></span></p>
                </div>
            </div>
        </div>
        <div class="row mt-20">
            <div class="col-xs-3">
                <div class="tags-container vertical">
                    <p class="tag"><span class="text">Hash tags button vertical</span><span class="x-button"></span></p>
                    <p class="tag"><span class="text">Hash tags button vertical</span><span class="x-button"></span></p>
                    <p class="tag"><span class="text">Hash tags button vertical</span><span class="x-button"></span></p>
                </div>
            </div>
        </div>
        <div class="row mt-20">
            <h3>Accordion</h3>
        </div>
        <div class="row">
            <div class="col-xs-4">
                <div class="accordion accordion-1" id="accordion01">
                    <!-- Panel 01 -->
                    <div class="panel">
                        <div class="panel--heading">
                            <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion01"
                               href="#collapse01-1" aria-expanded="false">Accordion Item Dashpoint</a>
                        </div>
                        <div id="collapse01-1" class="panel--body panel-collapse collapse p-0" aria-expanded="false"
                             style="height: 42px;">
                            <div style="padding: 16px;">
                                Steak In was the first retaurant to open in Egypt, the resturant was designed with the
                                history in mind we have created a soft industrial dining room, combined with an open
                                kitchen, coffee take out bar and on site coffee roastery. Steak In was the first
                                retaurant to open in Egypt, the resturant was designed with the history in mind we have
                                created a soft industrial dining room, combined with an open kitchen, coffee take out
                                bar and on site coffee roastery.
                            </div>
                        </div>
                    </div>

                    <!-- Panel 02 -->
                    <div class="panel">
                        <div class="panel--heading">
                            <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion01"
                               href="#collapse01-2" aria-expanded="false">Accordion Item Dashpoint</a>
                        </div>
                        <div id="collapse01-2" class="panel--body panel-collapse collapse p-0" aria-expanded="false"
                             style="height: 42px;">
                            <div style="padding: 16px;">
                                Steak In was the first retaurant to open in Egypt, the resturant was designed with the
                                history in mind we have created a soft industrial dining room, combined with an open
                                kitchen, coffee take out bar and on site coffee roastery. Steak In was the first
                                retaurant to open in Egypt, the resturant was designed with the history in mind we have
                                created a soft industrial dining room, combined with an open kitchen, coffee take out
                                bar and on site coffee roastery.
                            </div>
                        </div>
                    </div>

                    <!-- Panel 03 -->
                    <div class="panel">
                        <div class="panel--heading">
                            <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion01"
                               href="#collapse01-3" aria-expanded="false">Accordion Item Dashpoint</a>
                        </div>
                        <div id="collapse01-3" class="panel--body panel-collapse collapse p-0" aria-expanded="false"
                             style="height: 42px;">
                            <div style="padding: 16px;">
                                Steak In was the first retaurant to open in Egypt, the resturant was designed with the
                                history in mind we have created a soft industrial dining room, combined with an open
                                kitchen, coffee take out bar and on site coffee roastery. Steak In was the first
                                retaurant to open in Egypt, the resturant was designed with the history in mind we have
                                created a soft industrial dining room, combined with an open kitchen, coffee take out
                                bar and on site coffee roastery.
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-xs-4">
                <div class="accordion accordion-1" id="accordion02">
                    <!-- Panel 01 -->
                    <div class="panel">
                        <div class="panel--heading p-resize border-none">
                            <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion02"
                               href="#collapse02-1" aria-expanded="false">Accordion Item Border none</a>
                        </div>
                        <div id="collapse02-1" class="panel--body panel-collapse collapse p-0 border-none"
                             aria-expanded="false"
                             style="height: 42px;">
                            <div style="padding: 0 12px 12px 12px;">
                                Steak In was the first retaurant to open in Egypt, the resturant was designed with the
                                history in mind we have created a soft industrial dining room, combined with an open
                                kitchen, coffee take out bar and on site coffee roastery. Steak In was the first
                                retaurant to open in Egypt, the resturant was designed with the history in mind we have
                                created a soft industrial dining room, combined with an open kitchen, coffee take out
                                bar and on site coffee roastery.
                            </div>
                        </div>
                    </div>

                    <!-- Panel 02 -->
                    <div class="panel">
                        <div class="panel--heading p-resize border-none">
                            <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion02"
                               href="#collapse02-2" aria-expanded="false">Accordion Item Border none</a>
                        </div>
                        <div id="collapse02-2" class="panel--body panel-collapse collapse p-0 border-none"
                             aria-expanded="false"
                             style="height: 42px;">
                            <div style="padding: 0 12px 12px 12px;">
                                Steak In was the first retaurant to open in Egypt, the resturant was designed with the
                                history in mind we have created a soft industrial dining room, combined with an open
                                kitchen, coffee take out bar and on site coffee roastery. Steak In was the first
                                retaurant to open in Egypt, the resturant was designed with the history in mind we have
                                created a soft industrial dining room, combined with an open kitchen, coffee take out
                                bar and on site coffee roastery.
                            </div>
                        </div>
                    </div>

                    <!-- Panel 03 -->
                    <div class="panel">
                        <div class="panel--heading p-resize border-none">
                            <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion02"
                               href="#collapse02-3" aria-expanded="false">Accordion Item Border none</a>
                        </div>
                        <div id="collapse02-3" class="panel--body panel-collapse collapse p-0 border-none"
                             aria-expanded="false"
                             style="height: 42px;">
                            <div style="padding: 0 12px 12px 12px;">
                                Steak In was the first retaurant to open in Egypt, the resturant was designed with the
                                history in mind we have created a soft industrial dining room, combined with an open
                                kitchen, coffee take out bar and on site coffee roastery. Steak In was the first
                                retaurant to open in Egypt, the resturant was designed with the history in mind we have
                                created a soft industrial dining room, combined with an open kitchen, coffee take out
                                bar and on site coffee roastery.
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-xs-4">
                <div class="accordion accordion-3" id="accordion03">
                    <!-- Panel 01 -->
                    <div class="panel p-resize">
                        <div class="panel--heading">
                            <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion03"
                               href="#collapse03-1" aria-expanded="true">Who is the owner of Steak In restaurant?</a>
                        </div>
                        <div id="collapse03-1" class="panel--body panel-collapse collapse in p-0" aria-expanded="true"
                             style="">
                            <div style="padding-top: 16px;">
                                Steak In was the first retaurant to open in Egypt, the resturant was designed with the
                                history in mind we have created a soft industrial dining room, combined with an open
                                kitchen, coffee take out bar and on site coffee roastery. Steak In was the first
                                retaurant to open in Egypt, the resturant was designed with the history in mind we have
                                created a soft industrial dining room, combined with an open kitchen, coffee take out
                                bar and on site coffee roastery.
                            </div>
                        </div>
                    </div>

                    <!-- Panel 01 -->
                    <div class="panel p-resize">
                        <div class="panel--heading">
                            <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion03"
                               href="#collapse03-2" aria-expanded="false">When did Steak In restaurant established?</a>
                        </div>
                        <div id="collapse03-2" class="panel--body panel-collapse collapse p-0" aria-expanded="false">
                            <div style="padding-top: 16px;">
                                Steak In was the first retaurant to open in Egypt, the resturant was designed with the
                                history in mind we have created a soft industrial dining room, combined with an open
                                kitchen, coffee take out bar and on site coffee roastery. Steak In was the first
                                retaurant to open in Egypt, the resturant was designed with the history in mind we have
                                created a soft industrial dining room, combined with an open kitchen, coffee take out
                                bar and on site coffee roastery.
                            </div>
                        </div>
                    </div>

                    <!-- Panel 03 -->
                    <div class="panel p-resize">
                        <div class="panel--heading">
                            <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion03"
                               href="#collapse03-3" aria-expanded="false">How many tables in the resturant?</a>
                        </div>
                        <div id="collapse03-3" class="panel--body panel-collapse collapse p-0" aria-expanded="false">
                            <div style="padding-top: 16px;">
                                Steak In was the first retaurant to open in Egypt, the resturant was designed with the
                                history in mind we have created a soft industrial dining room, combined with an open
                                kitchen, coffee take out bar and on site coffee roastery. Steak In was the first
                                retaurant to open in Egypt, the resturant was designed with the history in mind we have
                                created a soft industrial dining room, combined with an open kitchen, coffee take out
                                bar and on site coffee roastery.
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row mt-20">
            <div class="col-xs-4">
                <div class="accordion accordion-3" id="accordion04">
                    <!-- Panel 01 -->
                    <div class="panel p-resize">
                        <div class="panel--heading">
                            <a class="accordion-toggle panel--head--double--t" data-toggle="collapse"
                               data-parent="#accordion03" href="#collapse04-1" aria-expanded="true">Double
                                Elements<span>2021-06-08</span></a>
                        </div>
                        <div id="collapse04-1" class="panel--body panel-collapse collapse in p-0" aria-expanded="true"
                             style="">
                            <div style="padding-top: 16px;">
                                Steak In was the first retaurant to open in Egypt, the resturant was designed with the
                                history in mind we have created a soft industrial dining room, combined with an open
                                kitchen, coffee take out bar and on site coffee roastery. Steak In was the first
                                retaurant to open in Egypt, the resturant was designed with the history in mind we have
                                created a soft industrial dining room, combined with an open kitchen, coffee take out
                                bar and on site coffee roastery.
                            </div>
                        </div>
                    </div>

                    <!-- Panel 01 -->
                    <div class="panel p-resize">
                        <div class="panel--heading">
                            <a class="accordion-toggle collapsed panel--head--triple--t" data-toggle="collapse"
                               data-parent="#accordion03" href="#collapse04-2" aria-expanded="false">Triple
                                Elements<span class="span-button">Answer Complete</span><span>2021-06-08</span></a>
                        </div>
                        <div id="collapse04-2" class="panel--body panel-collapse collapse p-0" aria-expanded="false">
                            <div style="padding-top: 16px;">
                                Steak In was the first retaurant to open in Egypt, the resturant was designed with the
                                history in mind we have created a soft industrial dining room, combined with an open
                                kitchen, coffee take out bar and on site coffee roastery. Steak In was the first
                                retaurant to open in Egypt, the resturant was designed with the history in mind we have
                                created a soft industrial dining room, combined with an open kitchen, coffee take out
                                bar and on site coffee roastery.
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row mt-20">
            <div class="col-xs-4">
                <div class="panel-group" id="custom-accordion" role="tablist" aria-multiselectable="true">
                    <div class="panel panel-default custom-panel-item">
                        <div class="panel-heading custom-panel" role="tab" id="headingOne">
                            <h4 class="panel-title">
                                <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne"
                                   aria-expanded="true" aria-controls="collapseOne">
                                    Collapsible Group Item #1
                                </a>
                                <div style="line-height: 32px;font-size: 12px; color: #222222;">2021-07-26</div>
                                <span class="span-button ml-auto" style="white-space: break-spaces; padding: 3px 8px;">Answer Complete</span>
                            </h4>
                        </div>
                        <div id="collapseOne" class="panel-collapse collapse in" role="tabpanel"
                             aria-labelledby="headingOne">
                            <div class="panel-body">
                                Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad
                                squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck
                                quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it
                                squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica,
                                craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur
                                butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth
                                nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
                            </div>
                        </div>
                    </div>
                    <div class="panel panel-default custom-panel-item">
                        <div class="panel-heading custom-panel" role="tab" id="headingTwo">
                            <h4 class="panel-title">
                                <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion"
                                   href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                                    Collapsible Group Item #2
                                </a>
                                <div style="line-height: 32px;font-size: 12px; color: #222222;">2021-07-26</div>
                            </h4>
                        </div>
                        <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel"
                             aria-labelledby="headingTwo">
                            <div class="panel-body">
                                Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad
                                squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck
                                quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it
                                squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica,
                                craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur
                                butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth
                                nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
                            </div>
                        </div>
                    </div>
                    <div class="panel panel-default custom-panel-item">
                        <div class="panel-heading custom-panel" role="tab" id="headingThree">
                            <h4 class="panel-title">
                                <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion"
                                   href="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                                    Collapsible Group Item #3
                                </a>
                                <div style="line-height: 32px;font-size: 12px; color: #222222;">2021-07-26</div>
                                <span class="span-button ml-auto" style="white-space: break-spaces; padding: 3px 8px;">Answer Complete</span>
                            </h4>
                        </div>
                        <div id="collapseThree" class="panel-collapse collapse" role="tabpanel"
                             aria-labelledby="headingThree">
                            <div class="panel-body">
                                <h6>Question</h6>
                                Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad
                                squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck
                                quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it
                                squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica,
                                craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur
                                butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth
                                nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
                            </div>
                            <div class="panel-body">
                                <h6>Answer</h6>
                                Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad
                                squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck
                                quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it
                                squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica,
                                craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur
                                butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth
                                nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row mt-20">
            <h3>Category</h3>
        </div>
        <div class="row mt-20">
            <div class="col-xs-3">
                <div class="widget widget-tags" id="tag-clouds">
                    <div class="widget--title">
                        <h5>tag clouds</h5>
                    </div>
                    <div class="widget--content">
                        <a href="#tag-clouds">responsive</a>
                        <a href="#tag-clouds">modern</a>
                        <a href="#tag-clouds">corporate</a>
                        <a href="#tag-clouds">business</a>
                        <a href="#tag-clouds">fresh</a>
                        <a href="#tag-clouds">awesome</a>
                        <a href="#tag-clouds">business</a>
                        <a href="#tag-clouds">fresh</a>
                        <a href="#tag-clouds">corporate</a>
                    </div>
                </div>
            </div>
            <div class="col-xs-3">
                <div class="widget widget-tags" id="tag-clouds1">
                    <div class="widget--title">
                        <h5>tag clouds</h5>
                    </div>
                    <div class="widget--content">
                        <a href="#tag-clouds1" class="active">responsive</a>
                        <a href="#tag-clouds1">modern</a>
                        <a href="#tag-clouds1">corporate</a>
                        <a href="#tag-clouds1">business</a>
                        <a href="#tag-clouds1">fresh</a>
                        <a href="#tag-clouds1">awesome</a>
                        <a href="#tag-clouds1">business</a>
                        <a href="#tag-clouds1">fresh</a>
                        <a href="#tag-clouds1">corporate</a>
                    </div>
                </div>
            </div>
            <div class="col-xs-3">
                <div class="widget widget-tags" id="tag-clouds2">
                    <div class="widget--title">
                        <h5>tag clouds bordered</h5>
                    </div>
                    <div class="widget--content active-border">
                        <a href="#tag-clouds2">responsive</a>
                        <a href="#tag-clouds2">modern</a>
                        <a href="#tag-clouds2">corporate</a>
                        <a href="#tag-clouds2">business</a>
                        <a href="#tag-clouds2">fresh</a>
                        <a href="#tag-clouds2">awesome</a>
                        <a href="#tag-clouds2">business</a>
                        <a href="#tag-clouds2">fresh</a>
                        <a href="#tag-clouds2">corporate</a>
                    </div>
                </div>
            </div>
            <div class="col-xs-3">
                <div class="widget widget-tags" id="tag-clouds3">
                    <div class="widget--title">
                        <h5>tag clouds bordered</h5>
                    </div>
                    <div class="widget--content active-border">
                        <a href="#tag-clouds3" class="active">responsive</a>
                        <a href="#tag-clouds3" class="active">modern</a>
                        <a href="#tag-clouds3">corporate</a>
                        <a href="#tag-clouds3">business</a>
                        <a href="#tag-clouds3">fresh</a>
                        <a href="#tag-clouds3">awesome</a>
                        <a href="#tag-clouds3">business</a>
                        <a href="#tag-clouds3">fresh</a>
                        <a href="#tag-clouds3">corporate</a>
                    </div>
                </div>
            </div>
        </div>
        <div class="row mt-20">
            <h3>Card Item</h3>
        </div>
        <div class="row mt-20">
            <div class="col-xs-3">
                <div class="owl-item" style="width: 100%;">
                    <div class="blog-entry">
                        <div class="entry--content">
                            <div class="entry--img">
                                <a href="#">
                                    <img src="../../../resources/assets/images/blog/grid/5.jpg" alt="entry image">
                                </a>
                                <div class="entry--body">
                                    <div class="oneline">
                                        <span>합정역</span>
                                        <span>&nbsp;/&nbsp;</span>
                                        <a href="#">#베이커리 맛집</a>
                                        <a href="#">#베이커리 맛집</a>
                                        <a href="#">#베이커리 맛집</a>
                                        <a href="#">#베이커리 맛집</a>
                                    </div>
                                    <div class="twoline">
                                        <h5>인디로스터 김우식</h5>
                                    </div>
                                </div>
                            </div>
                            <div class="entry--bio">
                                Cook sausage for 5 to 7 minutes until browned. Add onions and celery and saute until
                                softened. Add salt and pepper, to taste. Mix in apples, thyme
                                Cook sausage for 5 to 7 minutes until browned. Add onions and celery and saute until
                                softened. Add salt and pepper, to taste. Mix in apples, thyme
                            </div>
                        </div>
                        <!-- .entry-content end -->
                    </div>
                </div>
            </div>
            <div class="col-xs-3">
                <div class="owl-item" style="width: 100%;">
                    <div class="blog-entry">
                        <div class="entry--content beans-type">
                            <div class="entry--img">
                                <a href="#">
                                    <img src="../../../resources/assets/images/blog/grid/5.jpg" alt="entry image">
                                </a>
                                <div class="entry--body">
                                    <div class="oneline">
                                        케냐 기티투 AB 싱글빈 케냐 기티투 AB 싱글빈
                                    </div>
                                    <div class="pricing">
                                        <span class="origin">25,000원</span>
                                        <span class="sales">21,400원</span>
                                    </div>
                                </div>
                            </div>
                            <div class="entry--bio">
                                Cook sausage for 5 to 7 minutes until browned. Add onions and celery and saute until
                                softened. Add salt and pepper, to taste. Mix in apples, thyme
                            </div>
                        </div>
                        <!-- .entry-content end -->
                    </div>
                </div>
            </div>
            <div class="col-xs-3">
                <div class="owl-item" style="width: 100%;">
                    <div class="blog-entry">
                        <div class="entry--content beans-type">
                            <div class="entry--img">
                                <a href="#">
                                    <img src="../../../resources/assets/images/blog/grid/5.jpg" alt="entry image">
                                </a>
                                <div class="entry--body">
                                    <div class="oneline">
                                        케냐 기티투 AB 싱글빈 케냐 기티투 AB 싱글빈
                                    </div>
                                    <div class="pricing">
                                        <span class="sales">25,000원</span>
                                    </div>
                                </div>
                            </div>
                            <div class="entry--bio">
                                Cook sausage for 5 to 7 minutes until browned. Add onions and celery and saute until
                                softened. Add salt and pepper, to taste. Mix in apples, thyme
                            </div>
                        </div>
                        <!-- .entry-content end -->
                    </div>
                </div>
            </div>
            <div class="col-xs-3">
                <div class="owl-item" style="width: 100%;">
                    <div class="blog-entry">
                        <div class="entry--content beans-type">
                            <div class="entry--img">
                                <a href="#">
                                    <img src="../../../resources/assets/images/blog/grid/5.jpg" alt="entry image">
                                </a>
                                <div class="entry--body">
                                    <div class="oneline">
                                        케냐 기티투 AB 싱글빈 케냐 기티투 AB 싱글빈
                                    </div>
                                    <div class="pricing">
                                        <span class="sales">25,000원</span>
                                    </div>
                                </div>
                                <div class="sales-indication">
                                    40% 할인
                                </div>
                            </div>
                            <div class="entry--bio">
                                Cook sausage for 5 to 7 minutes until browned. Add onions and celery and saute until
                                softened. Add salt and pepper, to taste. Mix in apples, thyme
                            </div>
                        </div>
                        <!-- .entry-content end -->
                    </div>
                </div>
            </div>
        </div>
        <div class="row mt-20">
            <div class="col-xs-3">
                <div class="owl-item" style="width: 100%;">
                    <div class="blog-entry">
                        <div class="entry--content product-type">
                            <div class="entry--img mb-0">
                                <a href="#">
                                    <img src="../../../resources/assets/images/blog/grid/5.jpg" alt="entry image">
                                </a>
                                <div class="sales-indication">
                                    40% 할인
                                </div>
                                <div class="product-overlay">
                                    <div class="overlay-icon-layout">
                                        <div class="overlay-container">
                                            <div class="overlay-item">
                                                <img src="http://via.placeholder.com/36x36"/>
                                                <span>Event</span>
                                            </div>
                                            <div class="overlay-item">
                                                <img src="http://via.placeholder.com/36x36"/>
                                                <span>Event</span>
                                            </div>
                                            <div class="overlay-item">
                                                <img src="http://via.placeholder.com/36x36"/>
                                                <span>Event</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="entry--body">
                                <div class="oneline">
                                    <span>판매자</span>
                                    <span>&nbsp;/&nbsp;</span>
                                    <a href="#">Starbucks Coffee</a>
                                </div>
                                <div class="twoline">
                                    <h5>Starbucks Espresso Machine</h5>
                                </div>
                                <div class="pricing">
                                    <span class="origin">25,000원</span>
                                    <span class="sales">25,000원</span>
                                    <span class="date">
                                        2021-06-09
                                    </span>
                                </div>
                            </div>
                            <div class="entry--bio">
                                Cook sausage for 5 to 7 minutes until browned. Add onions and celery and saute until
                                softened. Add salt and pepper, to taste. Mix in apples, thyme
                                Cook sausage for 5 to 7 minutes until browned. Add onions and celery and saute until
                                softened. Add salt and pepper, to taste. Mix in apples, thyme
                            </div>
                        </div>
                        <!-- .entry-content end -->
                    </div>
                </div>
            </div>
            <div class="col-xs-3">
                <div class="owl-item" style="width: 100%;">
                    <div class="blog-entry">
                        <div class="entry--content text-center">
                            <div class="entry--img">
                                <a href="#">
                                    <img src="../../../resources/assets/images/blog/grid/5.jpg" alt="entry image">
                                </a>
                                <div class="point-icon">
                                    <img src="http://via.placeholder.com/24x24"/>
                                </div>
                            </div>
                            <h4>Customizing</h4>
                            <div class="entry--bio no-ellipsis first-child">
                                Cook sausage for 5 to 7 minutes until browned. Add onions and celery and saute until
                                softened. Add salt and pepper, to taste. Mix in apples, thyme
                                Cook sausage for 5 to 7 minutes until browned. Add onions and celery and saute until
                                softened. Add salt and pepper, to taste. Mix in apples, thyme
                            </div>
                            <div class="entry--bio no-ellipsis mt-10">
                                Find your own coffee easily from the TOP Indie-Roasters in Korea.
                            </div>
                        </div>
                        <!-- .entry-content end -->
                    </div>
                </div>
            </div>
        </div>
        <div class="row mt-20">
            <div class="col-xs-6">
                <div class="carousel carousel-dots" data-slide="3" data-slide-rs="2" data-autoplay="true"
                     data-nav="false" data-dots="true" data-space="0" data-loop="true" data-speed="800">
                    <div class="owl-item" style="width: 100%;">
                        <div class="blog-entry">
                            <div class="entry--content product-type">
                                <div class="entry--img mb-0">
                                    <a href="#">
                                        <img src="../../../resources/assets/images/blog/grid/5.jpg" alt="entry image">
                                    </a>
                                    <div class="sales-indication">
                                        40% 할인
                                    </div>
                                    <div class="product-overlay">
                                        <div class="overlay-icon-layout">
                                            <div class="overlay-container">
                                                <div class="overlay-item">
                                                    <img src="http://via.placeholder.com/36x36"/>
                                                    <span>Event</span>
                                                </div>
                                                <div class="overlay-item">
                                                    <img src="http://via.placeholder.com/36x36"/>
                                                    <span>Event</span>
                                                </div>
                                                <div class="overlay-item">
                                                    <img src="http://via.placeholder.com/36x36"/>
                                                    <span>Event</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="entry--body">
                                    <div class="oneline">
                                        <span>판매자</span>
                                        <span>&nbsp;/&nbsp;</span>
                                        <a href="#">Starbucks Coffee</a>
                                    </div>
                                    <div class="twoline">
                                        <h5>Starbucks Espresso Machine</h5>
                                    </div>
                                    <div class="pricing">
                                        <span class="origin">25,000원</span>
                                        <span class="sales">25,000원</span>
                                        <span class="date">
                                        2021-06-09
                                    </span>
                                    </div>
                                </div>
                                <div class="entry--bio">
                                    Cook sausage for 5 to 7 minutes until browned. Add onions and celery and saute until
                                    softened. Add salt and pepper, to taste. Mix in apples, thyme
                                    Cook sausage for 5 to 7 minutes until browned. Add onions and celery and saute until
                                    softened. Add salt and pepper, to taste. Mix in apples, thyme
                                </div>
                            </div>
                            <!-- .entry-content end -->
                        </div>
                    </div>
                    <div class="owl-item" style="width: 100%;">
                        <div class="blog-entry">
                            <div class="entry--content product-type">
                                <div class="entry--img mb-0">
                                    <a href="#">
                                        <img src="../../../resources/assets/images/blog/grid/5.jpg" alt="entry image">
                                    </a>
                                    <div class="sales-indication">
                                        40% 할인
                                    </div>
                                    <div class="product-overlay">
                                        <div class="overlay-icon-layout">
                                            <div class="overlay-container">
                                                <div class="overlay-item">
                                                    <img src="http://via.placeholder.com/36x36"/>
                                                    <span>Event</span>
                                                </div>
                                                <div class="overlay-item">
                                                    <img src="http://via.placeholder.com/36x36"/>
                                                    <span>Event</span>
                                                </div>
                                                <div class="overlay-item">
                                                    <img src="http://via.placeholder.com/36x36"/>
                                                    <span>Event</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="entry--body">
                                    <div class="oneline">
                                        <span>판매자</span>
                                        <span>&nbsp;/&nbsp;</span>
                                        <a href="#">Starbucks Coffee</a>
                                    </div>
                                    <div class="twoline">
                                        <h5>Starbucks Espresso Machine</h5>
                                    </div>
                                    <div class="pricing">
                                        <span class="origin">25,000원</span>
                                        <span class="sales">25,000원</span>
                                        <span class="date">
                                        2021-06-09
                                    </span>
                                    </div>
                                </div>
                                <div class="entry--bio">
                                    Cook sausage for 5 to 7 minutes until browned. Add onions and celery and saute until
                                    softened. Add salt and pepper, to taste. Mix in apples, thyme
                                    Cook sausage for 5 to 7 minutes until browned. Add onions and celery and saute until
                                    softened. Add salt and pepper, to taste. Mix in apples, thyme
                                </div>
                            </div>
                            <!-- .entry-content end -->
                        </div>
                    </div>
                    <div class="owl-item" style="width: 100%;">
                        <div class="blog-entry">
                            <div class="entry--content product-type">
                                <div class="entry--img mb-0">
                                    <a href="#">
                                        <img src="../../../resources/assets/images/blog/grid/5.jpg" alt="entry image">
                                    </a>
                                    <div class="sales-indication">
                                        40% 할인
                                    </div>
                                    <div class="product-overlay">
                                        <div class="overlay-icon-layout">
                                            <div class="overlay-container">
                                                <div class="overlay-item">
                                                    <img src="http://via.placeholder.com/36x36"/>
                                                    <span>Event</span>
                                                </div>
                                                <div class="overlay-item">
                                                    <img src="http://via.placeholder.com/36x36"/>
                                                    <span>Event</span>
                                                </div>
                                                <div class="overlay-item">
                                                    <img src="http://via.placeholder.com/36x36"/>
                                                    <span>Event</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="entry--body">
                                    <div class="oneline">
                                        <span>판매자</span>
                                        <span>&nbsp;/&nbsp;</span>
                                        <a href="#">Starbucks Coffee</a>
                                    </div>
                                    <div class="twoline">
                                        <h5>Starbucks Espresso Machine</h5>
                                    </div>
                                    <div class="pricing">
                                        <span class="origin">25,000원</span>
                                        <span class="sales">25,000원</span>
                                        <span class="date">
                                        2021-06-09
                                    </span>
                                    </div>
                                </div>
                                <div class="entry--bio">
                                    Cook sausage for 5 to 7 minutes until browned. Add onions and celery and saute until
                                    softened. Add salt and pepper, to taste. Mix in apples, thyme
                                    Cook sausage for 5 to 7 minutes until browned. Add onions and celery and saute until
                                    softened. Add salt and pepper, to taste. Mix in apples, thyme
                                </div>
                            </div>
                            <!-- .entry-content end -->
                        </div>
                    </div>
                    <div class="owl-item" style="width: 100%;">
                        <div class="blog-entry">
                            <div class="entry--content product-type">
                                <div class="entry--img mb-0">
                                    <a href="#">
                                        <img src="../../../resources/assets/images/blog/grid/5.jpg" alt="entry image">
                                    </a>
                                    <div class="sales-indication">
                                        40% 할인
                                    </div>
                                    <div class="product-overlay">
                                        <div class="overlay-icon-layout">
                                            <div class="overlay-container">
                                                <div class="overlay-item">
                                                    <img src="http://via.placeholder.com/36x36"/>
                                                    <span>Event</span>
                                                </div>
                                                <div class="overlay-item">
                                                    <img src="http://via.placeholder.com/36x36"/>
                                                    <span>Event</span>
                                                </div>
                                                <div class="overlay-item">
                                                    <img src="http://via.placeholder.com/36x36"/>
                                                    <span>Event</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="entry--body">
                                    <div class="oneline">
                                        <span>판매자</span>
                                        <span>&nbsp;/&nbsp;</span>
                                        <a href="#">Starbucks Coffee</a>
                                    </div>
                                    <div class="twoline">
                                        <h5>Starbucks Espresso Machine</h5>
                                    </div>
                                    <div class="pricing">
                                        <span class="origin">25,000원</span>
                                        <span class="sales">25,000원</span>
                                        <span class="date">
                                        2021-06-09
                                    </span>
                                    </div>
                                </div>
                                <div class="entry--bio">
                                    Cook sausage for 5 to 7 minutes until browned. Add onions and celery and saute until
                                    softened. Add salt and pepper, to taste. Mix in apples, thyme
                                    Cook sausage for 5 to 7 minutes until browned. Add onions and celery and saute until
                                    softened. Add salt and pepper, to taste. Mix in apples, thyme
                                </div>
                            </div>
                            <!-- .entry-content end -->
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-xs-6">
                <div class="carousel carousel-dots" data-slide="3" data-slide-rs="2" data-autoplay="true"
                     data-nav="false" data-dots="true" data-space="0" data-loop="true" data-speed="800">
                    <div class="owl-item" style="width: 100%;">
                        <div class="blog-entry">
                            <div class="entry--content">
                                <div class="entry--img">
                                    <a href="#">
                                        <img src="../../../resources/assets/images/blog/grid/5.jpg" alt="entry image">
                                    </a>
                                    <div class="entry--body">
                                        <div class="oneline">
                                            <span>합정역</span>
                                            <span>&nbsp;/&nbsp;</span>
                                            <a href="#">#베이커리 맛집</a>
                                            <a href="#">#베이커리 맛집</a>
                                            <a href="#">#베이커리 맛집</a>
                                            <a href="#">#베이커리 맛집</a>
                                        </div>
                                        <div class="twoline">
                                            <h5>인디로스터 김우식</h5>
                                        </div>
                                    </div>
                                </div>
                                <div class="entry--bio">
                                    Cook sausage for 5 to 7 minutes until browned. Add onions and celery and saute until
                                    softened. Add salt and pepper, to taste. Mix in apples, thyme
                                    Cook sausage for 5 to 7 minutes until browned. Add onions and celery and saute until
                                    softened. Add salt and pepper, to taste. Mix in apples, thyme
                                </div>
                            </div>
                            <!-- .entry-content end -->
                        </div>
                    </div>
                    <div class="owl-item" style="width: 100%;">
                        <div class="blog-entry">
                            <div class="entry--content">
                                <div class="entry--img">
                                    <a href="#">
                                        <img src="../../../resources/assets/images/blog/grid/5.jpg" alt="entry image">
                                    </a>
                                    <div class="entry--body">
                                        <div class="oneline">
                                            <span>합정역</span>
                                            <span>&nbsp;/&nbsp;</span>
                                            <a href="#">#베이커리 맛집</a>
                                            <a href="#">#베이커리 맛집</a>
                                            <a href="#">#베이커리 맛집</a>
                                            <a href="#">#베이커리 맛집</a>
                                        </div>
                                        <div class="twoline">
                                            <h5>인디로스터 김우식</h5>
                                        </div>
                                    </div>
                                </div>
                                <div class="entry--bio">
                                    Cook sausage for 5 to 7 minutes until browned. Add onions and celery and saute until
                                    softened. Add salt and pepper, to taste. Mix in apples, thyme
                                    Cook sausage for 5 to 7 minutes until browned. Add onions and celery and saute until
                                    softened. Add salt and pepper, to taste. Mix in apples, thyme
                                </div>
                            </div>
                            <!-- .entry-content end -->
                        </div>
                    </div>
                    <div class="owl-item" style="width: 100%;">
                        <div class="blog-entry">
                            <div class="entry--content">
                                <div class="entry--img">
                                    <a href="#">
                                        <img src="../../../resources/assets/images/blog/grid/5.jpg" alt="entry image">
                                    </a>
                                    <div class="entry--body">
                                        <div class="oneline">
                                            <span>합정역</span>
                                            <span>&nbsp;/&nbsp;</span>
                                            <a href="#">#베이커리 맛집</a>
                                            <a href="#">#베이커리 맛집</a>
                                            <a href="#">#베이커리 맛집</a>
                                            <a href="#">#베이커리 맛집</a>
                                        </div>
                                        <div class="twoline">
                                            <h5>인디로스터 김우식</h5>
                                        </div>
                                    </div>
                                </div>
                                <div class="entry--bio">
                                    Cook sausage for 5 to 7 minutes until browned. Add onions and celery and saute until
                                    softened. Add salt and pepper, to taste. Mix in apples, thyme
                                    Cook sausage for 5 to 7 minutes until browned. Add onions and celery and saute until
                                    softened. Add salt and pepper, to taste. Mix in apples, thyme
                                </div>
                            </div>
                            <!-- .entry-content end -->
                        </div>
                    </div>
                    <div class="owl-item" style="width: 100%;">
                        <div class="blog-entry">
                            <div class="entry--content">
                                <div class="entry--img">
                                    <a href="#">
                                        <img src="../../../resources/assets/images/blog/grid/5.jpg" alt="entry image">
                                    </a>
                                    <div class="entry--body">
                                        <div class="oneline">
                                            <span>합정역</span>
                                            <span>&nbsp;/&nbsp;</span>
                                            <a href="#">#베이커리 맛집</a>
                                            <a href="#">#베이커리 맛집</a>
                                            <a href="#">#베이커리 맛집</a>
                                            <a href="#">#베이커리 맛집</a>
                                        </div>
                                        <div class="twoline">
                                            <h5>인디로스터 김우식</h5>
                                        </div>
                                    </div>
                                </div>
                                <div class="entry--bio">
                                    Cook sausage for 5 to 7 minutes until browned. Add onions and celery and saute until
                                    softened. Add salt and pepper, to taste. Mix in apples, thyme
                                    Cook sausage for 5 to 7 minutes until browned. Add onions and celery and saute until
                                    softened. Add salt and pepper, to taste. Mix in apples, thyme
                                </div>
                            </div>
                            <!-- .entry-content end -->
                        </div>
                    </div>
                    <div class="owl-item" style="width: 100%;">
                        <div class="blog-entry">
                            <div class="entry--content">
                                <div class="entry--img">
                                    <a href="#">
                                        <img src="../../../resources/assets/images/blog/grid/5.jpg" alt="entry image">
                                    </a>
                                    <div class="entry--body">
                                        <div class="oneline">
                                            <span>합정역</span>
                                            <span>&nbsp;/&nbsp;</span>
                                            <a href="#">#베이커리 맛집</a>
                                            <a href="#">#베이커리 맛집</a>
                                            <a href="#">#베이커리 맛집</a>
                                            <a href="#">#베이커리 맛집</a>
                                        </div>
                                        <div class="twoline">
                                            <h5>인디로스터 김우식</h5>
                                        </div>
                                    </div>
                                </div>
                                <div class="entry--bio">
                                    Cook sausage for 5 to 7 minutes until browned. Add onions and celery and saute until
                                    softened. Add salt and pepper, to taste. Mix in apples, thyme
                                    Cook sausage for 5 to 7 minutes until browned. Add onions and celery and saute until
                                    softened. Add salt and pepper, to taste. Mix in apples, thyme
                                </div>
                            </div>
                            <!-- .entry-content end -->
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row mt-20">
            <h3>Similarity Card Item</h3>
        </div>
        <div class="row mt-20">
            <div class="col-xs-3">
                <div class="r-card-container">
                    <h5>I rarely have access to coffee.</h5>
                    <h6>I come across coffee occasionally, but I often drink it without knowing it.</h6>
                </div>
            </div>
            <div class="col-xs-3">
                <div class="r-card-container active">
                    <h5>I rarely have access to coffee.</h5>
                    <h6>I come across coffee occasionally, but I often drink it without knowing it.</h6>
                </div>
            </div>
            <div class="col-xs-3">
                <div class="r-card-container">
                    <div class="add-icon-container">
                        <h6>Coffee Maker (Machine)</h6>
                        <img src="http://via.placeholder.com/70x80"/>
                    </div>
                </div>
            </div>
            <div class="col-xs-3">
                <div class="r-card-container active">
                    <div class="add-icon-container">
                        <h6>Coffee Maker (Machine)</h6>
                        <img src="http://via.placeholder.com/70x80"/>
                    </div>
                </div>
            </div>
        </div>
        <div class="row mt-20">
            <div class="col-xs-3">
                <div class="r-card-container">
                    <div class="add-icon-container only-text">
                        <h6>Coffee Maker (Machine)</h6>
                    </div>
                </div>
            </div>
            <div class="col-xs-3">
                <div class="r-card-container active">
                    <div class="add-icon-container only-text">
                        <h6>Coffee Maker (Machine)</h6>
                    </div>
                </div>
            </div>
            <div class="col-xs-3">
                <div class="r-card-container side-widget">
                    <h6>I rarely have access to coffee.</h6>
                    <span>I come across coffee occasionally, but I often drink it without knowing it.</span>
                </div>
            </div>
            <div class="col-xs-3">
                <div class="r-card-container side-widget" id="item_link">
                    <h6>I rarely have access to coffee. link</h6>
                    <a href="#item_link">I come across coffee occasionally, but I often drink it without knowing it.</a>
                </div>
            </div>
        </div>
        <div class="row mt-20">
            <div class="col-xs-3">
                <div class="r-card-container side-widget" id="icon_link">
                    <h6>I rarely have access to coffee. icon</h6>
                    <a class="icon" href="#icon_link"><img src="http://via.placeholder.com/24x24"/></a>
                    <a class="icon" href="#icon_link"><img src="http://via.placeholder.com/24x24"/></a>
                    <a class="icon" href="#icon_link"><img src="http://via.placeholder.com/24x24"/></a>
                    <a class="icon" href="#icon_link"><img src="http://via.placeholder.com/24x24"/></a>
                </div>
            </div>
            <div class="col-xs-3">
                <div class="r-card-container side-widget" id="icon_link_1">
                    <h6>I rarely have access to coffee. icon rectangle</h6>
                    <a class="icon-other" href="#icon_link_1"><img src="http://via.placeholder.com/24x24"/></a>
                    <a class="icon-other" href="#icon_link_1"><img src="http://via.placeholder.com/24x24"/></a>
                    <a class="icon-other" href="#icon_link_1"><img src="http://via.placeholder.com/24x24"/></a>
                    <a class="icon-other" href="#icon_link_1"><img src="http://via.placeholder.com/24x24"/></a>
                </div>
            </div>
        </div>
        <div class="row mt-20">
            <h3>Progress bar</h3>
        </div>
        <div class="row mt-20">
            <div class="col-xs-3" style="height: 65px;">
                <div class="progress-container">
                    <div class="progress">
                        <div class="percent"></div>
                    </div>
                    <div class="steps">
                        <div class="step" id="0"></div>
                        <div class="step" id="1"></div>
                        <div class="step" id="2"></div>
                        <div class="step" id="3"></div>
                    </div>
                </div>
            </div>
            <div class="col-xs-3">
                <div class="progress-container-type-2">
                    <section>
                        <ol class="progressbar">
                            <li class="is-complete"><span>Objective &amp; Template</span></li>
                            <li class="is-complete"><span>Options</span></li>
                            <li class="is-active"><span>Launch Date</span></li>
                            <li><span>Step</span></li>
                            <li><span>Step</span></li>
                            <li><span>Agreement</span></li>
                        </ol>
                    </section>
                </div>
            </div>
            <div class="col-xs-3 mt-20">
                <div class="progress">
                    <div class="progress-bar progress-bar-success progress-bar-striped" role="progressbar"
                         aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: 40%">
                        <span class="sr-only">40% Complete (success)</span>
                    </div>
                </div>
            </div>
            <div class="col-xs-3 mt-20">
                <div class="progress">
                    <div class="progress-bar progress-bar-success progress-bar-striped active" role="progressbar"
                         aria-valuenow="45" aria-valuemin="0" aria-valuemax="100" style="width: 45%">
                        <span class="sr-only">45% Complete</span>
                    </div>
                </div>
            </div>
        </div>
        <div class="row mt-20">
            <h3>Comment</h3>
        </div>
        <div class="row mt-20">
            <div class="col-xs-4">
                <ul class="comments-list">
                    <li class="comment-body">
                        <div class="avatar">
                            <img src="../../../resources/assets/images/team/thumb/2.jpg" alt="avatar">
                        </div>
                        <div class="comment" id="comment-1">
                            <h6>Anthony Hunter</h6>
                            <div class="date">Jan 28, 2017 - 08:07 pm</div>
                            <p>The example about the mattress sizing page you mentioned in the last WBF can be a perfect
                                example of new keywords and content, and broadening the funnel as well. I can only
                                imagine the sale numbers if that was the site of a mattress selling company.</p>
                            <a class="reply" onclick="new function() {
                                $('#input-comment-1').toggle(300);
                            }">reply</a>
                            <div class="input-comment" id="input-comment-1">
                                <textarea class="form-control autosize input-comment" name="comment"
                                          rows="3"
                                          placeholder="Comment"></textarea>
                                <div class="d-flex">
                                    <button type="text" class="btn btn-warning btn--block w-50">Cancel</button>
                                    <button type="text" class="btn btn--secondary btn--block w-50">Post Your Comment
                                    </button>
                                </div>
                            </div>
                        </div>
                    </li>
                </ul>
            </div>
            <div class="col-xs-4">
                <ul class="comments-list">
                    <li class="comment-body">
                        <div class="avatar">
                            <img src="../../../resources/assets/images/team/thumb/3.jpg" alt="avatar">
                        </div>
                        <div class="comment" id="comment-2">
                            <h6>Mohamed Habaza</h6>
                            <div class="date">Jan 28, 2017 - 10:07 pm</div>
                            <p>The example about the mattress sizing page you mentioned in the last WBF can be a perfect
                                example of new keywords and content, and broadening the funnel as well. I can only
                                imagine the sale numbers if that was the site of a mattress selling company.</p>
                            <a class="reply" onclick="new function() {
                                $('#input-comment-2').toggle(300);
                            }">reply</a>
                            <div class="input-comment" id="input-comment-2">
                                <textarea class="form-control autosize input-comment" name="comment"
                                          rows="3"
                                          placeholder="Comment"></textarea>
                                <button type="text" class="btn btn--secondary btn--block">Post Your Comment</button>
                            </div>
                        </div>
                        <ul class="comment-children">
                            <li class="comment-body">
                                <div class="avatar">
                                    <img src="../../../resources/assets/images/team/thumb/2.jpg" alt="avatar">
                                </div>
                                <div class="comment">
                                    <h6>Mahmoud Baghagho</h6>
                                    <div class="date">Jan 28, 2017 - 10:07 pm</div>
                                    <p>The example about the mattress sizing page you mentioned in the last WBF can be a
                                        perfect example of new keywords and content, and broadening the funnel as well.
                                        I can only imagine the sale numbers if that was the site of a mattress selling
                                        company.</p>
                                    <a class="reply" href="#">reply</a>
                                </div>
                            </li>
                            <!-- comment end -->
                        </ul>
                    </li>
                </ul>
            </div>
            <div class="col-xs-4">
                <ul class="comments-list">
                    <li class="comment-body">
                        <div class="avatar">
                            <img src="../../../resources/assets/images/team/thumb/2.jpg" alt="avatar">
                        </div>
                        <div class="comment">
                            <h6>Anthony Hunter</h6>
                            <div class="date">Jan 28, 2017 - 08:07 pm</div>
                            <p>The example about the mattress sizing page you mentioned in the last WBF can be a perfect
                                example of new keywords and content, and broadening the funnel as well. I can only
                                imagine the sale numbers if that was the site of a mattress selling company.</p>
                            <a class="reply" href="#">reply</a>
                        </div>
                    </li>
                    <!-- comment end -->

                    <li class="comment-body">
                        <div class="avatar">
                            <img src="../../../resources/assets/images/team/thumb/3.jpg" alt="avatar">
                        </div>
                        <div class="comment">
                            <h6>Mohamed Habaza</h6>
                            <div class="date">Jan 28, 2017 - 10:07 pm</div>
                            <p>The example about the mattress sizing page you mentioned in the last WBF can be a perfect
                                example of new keywords and content, and broadening the funnel as well. I can only
                                imagine the sale numbers if that was the site of a mattress selling company.</p>
                            <a class="reply" href="#">reply</a>
                        </div>

                        <ul class="comment-children">
                            <li class="comment-body">
                                <div class="avatar">
                                    <img src="../../../resources/assets/images/team/thumb/2.jpg" alt="avatar">
                                </div>
                                <div class="comment">
                                    <h6>Mahmoud Baghagho</h6>
                                    <div class="date">Jan 28, 2017 - 10:07 pm</div>
                                    <p>The example about the mattress sizing page you mentioned in the last WBF can be a
                                        perfect example of new keywords and content, and broadening the funnel as well.
                                        I can only imagine the sale numbers if that was the site of a mattress selling
                                        company.</p>
                                    <a class="reply" href="#">reply</a>
                                </div>
                                <ul class="comment-children">
                                    <li class="comment-body">
                                        <div class="avatar">
                                            <img src="../../../resources/assets/images/team/thumb/2.jpg" alt="avatar">
                                        </div>
                                        <div class="comment">
                                            <h6>Adam Smith</h6>
                                            <div class="date">Jan 28, 2017 - 10:30 pm</div>
                                            <p>The example about the mattress sizing page you mentioned in the last WBF
                                                can be a perfect example of new keywords and content, and broadening the
                                                funnel as well. I can only imagine the sale numbers if that was the site
                                                of a mattress selling company.</p>
                                            <a class="reply" href="#">reply</a>
                                        </div>
                                    </li>
                                    <!-- comment end -->
                                </ul>
                            </li>
                            <!-- comment end -->

                            <li class="comment-body">
                                <div class="avatar">
                                    <img src="../../../resources/assets/images/team/thumb/2.jpg" alt="avatar">
                                </div>
                                <div class="comment">
                                    <h6>Anthony Hunter</h6>
                                    <div class="date">Jan 28, 2017 - 08:07 pm</div>
                                    <p>The example about the mattress sizing page you mentioned in the last WBF can be a
                                        perfect example of new keywords and content, and broadening the funnel as well.
                                        I can only imagine the sale numbers if that was the site of a mattress selling
                                        company.</p>
                                    <a class="reply" href="#">reply</a>
                                </div>
                            </li>
                            <!-- comment end -->

                        </ul>
                        <!-- .comment-children end -->
                    </li>
                    <!-- comment end -->

                    <li class="comment-body">
                        <div class="avatar">
                            <img src="../../../resources/assets/images/team/thumb/2.jpg" alt="avatar">
                        </div>
                        <div class="comment">
                            <h6>Adam Smith</h6>
                            <div class="date">Jan 28, 2017 - 10:30 pm</div>
                            <p>The example about the mattress sizing page you mentioned in the last WBF can be a perfect
                                example of new keywords and content, and broadening the funnel as well. I can only
                                imagine the sale numbers if that was the site of a mattress selling company.</p>
                            <a class="reply" href="#">reply</a>
                        </div>
                    </li>
                    <!-- comment end -->
                </ul>
            </div>
        </div>
        <div class="row mt-20">
            <h3>Delivery API</h3>
        </div>
        <div class="row mt-20">
            <div class="col-xs-3">
                <a href="https://tracker.delivery/#/kr.cjlogistics/640671380356" target="_blank">배송조회</a>
            </div>
        </div>
        <div class="row mt-20">
            <h3>Modal Element</h3>
        </div>
        <div class="row mt-20">
            <div class="col-xs-3">
                <button type="button" class="btn btn-info btn-lg w-100" data-toggle="modal" data-target="#myModal1">Base
                    Modal One Button
                </button>
                <!-- Modal -->
                <div class="modal fade custom" id="myModal1" role="dialog">
                    <div class="modal-dialog">
                        <!-- Modal content-->
                        <div class="modal-content">
                            <div class="modal-header">
                                <h4 class="modal-title">Modal Header</h4>
                            </div>
                            <div class="modal-body">
                                <p>Some text in the modal.</p>
                            </div>
                            <div class="modal-footer">
                                <div class="row">
                                    <div class="col-md-12 col-xs-12">
                                        <a class="btn btn--primary btn--block" href="#">Button</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-xs-3">
                <button type="button" class="btn btn-info btn-lg w-100" data-toggle="modal" data-target="#myModal2">Base
                    Modal One Button
                </button>
                <!-- Modal -->
                <div class="modal fade custom" id="myModal2" role="dialog">
                    <div class="modal-dialog">
                        <!-- Modal content-->
                        <div class="modal-content">
                            <div class="modal-header">
                                <h4 class="modal-title">Modal Header</h4>
                            </div>
                            <div class="modal-body">
                                <p>Some text in the modal.</p>
                            </div>
                            <div class="modal-footer">
                                <div class="row">
                                    <div class="col-md-6 col-xs-12">
                                        <button type="text" class="btn btn-warning btn--block" data-dismiss="modal">
                                            Cancel
                                        </button>
                                    </div>
                                    <div class="col-md-6 col-xs-12">
                                        <a class="btn btn--primary btn--block" href="#">Button</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-xs-3">
                <button type="button" class="btn btn-info btn-lg w-100" data-toggle="modal" data-target="#myModal3">Base
                    Modal Close X
                </button>
                <!-- Modal -->
                <div class="modal fade custom" id="myModal3" role="dialog">
                    <div class="modal-dialog">
                        <!-- Modal content-->
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                <h4 class="modal-title">Modal Header</h4>
                            </div>
                            <div class="modal-body">
                                <p>Some text in the modal.</p>
                            </div>
                            <div class="modal-footer">
                                <div class="row">
                                    <div class="col-md-6 col-xs-12">
                                        <button type="text" class="btn btn-warning btn--block" data-dismiss="modal">
                                            Cancel
                                        </button>
                                    </div>
                                    <div class="col-md-6 col-xs-12">
                                        <a class="btn btn--primary btn--block" href="#">Button</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-xs-3">
                <button type="button" class="btn btn-info btn-lg w-100" data-toggle="modal" data-target="#myModal4">Base
                    Modal Center Position
                </button>
                <!-- Modal -->
                <%--TODO 화장실--%>
                <div class="modal fade custom" id="myModal4" role="dialog">
                    <div class="modal-dialog modal-dialog-centered" role="document">
                        <!-- Modal content-->
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                <h4 class="modal-title">Modal Header</h4>
                            </div>
                            <div class="modal-body">
                                <p>Some text in the modal.</p>
                            </div>
                            <div class="modal-footer">
                                <div class="row">
                                    <div class="col-md-6 col-xs-12">
                                        <button type="text" class="btn btn-warning btn--block" data-dismiss="modal">
                                            Cancel
                                        </button>
                                    </div>
                                    <div class="col-md-6 col-xs-12">
                                        <a class="btn btn--primary btn--block" href="#">Button</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row mt-20">
            <div class="col-xs-3">
                <button type="button" class="btn btn-info btn-lg w-100" data-toggle="modal" data-target="#myModal5">Base
                    Modal Long Scroll Document
                </button>
                <!-- Modal -->
                <div class="modal fade custom" id="myModal5" role="dialog" tabindex="-1">
                    <div class="modal-dialog modal-dialog-centered" role="document">
                        <!-- Modal content-->
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                <h4 class="modal-title">Modal Header</h4>
                            </div>
                            <div class="modal-body">
                                <p>Cras mattis consectetur purus sit amet fermentum. Cras justo odio, dapibus ac
                                    facilisis in, egestas eget quam. Morbi leo risus, porta ac consectetur ac,
                                    vestibulum at eros.</p>
                                <p>Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Vivamus sagittis
                                    lacus vel augue laoreet rutrum faucibus dolor auctor.</p>
                                <p>Aenean lacinia bibendum nulla sed consectetur. Praesent commodo cursus magna, vel
                                    scelerisque nisl consectetur et. Donec sed odio dui. Donec ullamcorper nulla non
                                    metus auctor fringilla.</p>
                                <p>Cras mattis consectetur purus sit amet fermentum. Cras justo odio, dapibus ac
                                    facilisis in, egestas eget quam. Morbi leo risus, porta ac consectetur ac,
                                    vestibulum at eros.</p>
                                <p>Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Vivamus sagittis
                                    lacus vel augue laoreet rutrum faucibus dolor auctor.</p>
                                <p>Aenean lacinia bibendum nulla sed consectetur. Praesent commodo cursus magna, vel
                                    scelerisque nisl consectetur et. Donec sed odio dui. Donec ullamcorper nulla non
                                    metus auctor fringilla.</p>
                                <p>Cras mattis consectetur purus sit amet fermentum. Cras justo odio, dapibus ac
                                    facilisis in, egestas eget quam. Morbi leo risus, porta ac consectetur ac,
                                    vestibulum at eros.</p>
                                <p>Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Vivamus sagittis
                                    lacus vel augue laoreet rutrum faucibus dolor auctor.</p>
                                <p>Aenean lacinia bibendum nulla sed consectetur. Praesent commodo cursus magna, vel
                                    scelerisque nisl consectetur et. Donec sed odio dui. Donec ullamcorper nulla non
                                    metus auctor fringilla.</p>
                                <p>Cras mattis consectetur purus sit amet fermentum. Cras justo odio, dapibus ac
                                    facilisis in, egestas eget quam. Morbi leo risus, porta ac consectetur ac,
                                    vestibulum at eros.</p>
                                <p>Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Vivamus sagittis
                                    lacus vel augue laoreet rutrum faucibus dolor auctor.</p>
                                <p>Aenean lacinia bibendum nulla sed consectetur. Praesent commodo cursus magna, vel
                                    scelerisque nisl consectetur et. Donec sed odio dui. Donec ullamcorper nulla non
                                    metus auctor fringilla.</p>
                                <p>Cras mattis consectetur purus sit amet fermentum. Cras justo odio, dapibus ac
                                    facilisis in, egestas eget quam. Morbi leo risus, porta ac consectetur ac,
                                    vestibulum at eros.</p>
                                <p>Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Vivamus sagittis
                                    lacus vel augue laoreet rutrum faucibus dolor auctor.</p>
                                <p>Aenean lacinia bibendum nulla sed consectetur. Praesent commodo cursus magna, vel
                                    scelerisque nisl consectetur et. Donec sed odio dui. Donec ullamcorper nulla non
                                    metus auctor fringilla.</p>
                                <p>Cras mattis consectetur purus sit amet fermentum. Cras justo odio, dapibus ac
                                    facilisis in, egestas eget quam. Morbi leo risus, porta ac consectetur ac,
                                    vestibulum at eros.</p>
                                <p>Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Vivamus sagittis
                                    lacus vel augue laoreet rutrum faucibus dolor auctor.</p>
                                <p>Aenean lacinia bibendum nulla sed consectetur. Praesent commodo cursus magna, vel
                                    scelerisque nisl consectetur et. Donec sed odio dui. Donec ullamcorper nulla non
                                    metus auctor fringilla.</p>
                            </div>
                            <div class="modal-footer">
                                <div class="row">
                                    <div class="col-md-6 col-xs-12">
                                        <button type="text" class="btn btn-warning btn--block" data-dismiss="modal">
                                            Cancel
                                        </button>
                                    </div>
                                    <div class="col-md-6 col-xs-12">
                                        <a class="btn btn--primary btn--block" href="#">Button</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-xs-3">
                <button type="button" class="btn btn-info btn-lg w-100" data-toggle="modal" data-target="#myModal6">Base
                    Modal Long Scroll Document 200
                </button>
                <!-- Modal -->
                <div class="modal fade custom" id="myModal6" role="dialog" tabindex="-1">
                    <div class="modal-dialog modal-dialog-centered" role="document">
                        <!-- Modal content-->
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                <h4 class="modal-title">Modal Header</h4>
                            </div>
                            <div class="modal-body scrollerable mh-200">
                                <p>Cras mattis consectetur purus sit amet fermentum. Cras justo odio, dapibus ac
                                    facilisis in, egestas eget quam. Morbi leo risus, porta ac consectetur ac,
                                    vestibulum at eros.</p>
                                <p>Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Vivamus sagittis
                                    lacus vel augue laoreet rutrum faucibus dolor auctor.</p>
                                <p>Aenean lacinia bibendum nulla sed consectetur. Praesent commodo cursus magna, vel
                                    scelerisque nisl consectetur et. Donec sed odio dui. Donec ullamcorper nulla non
                                    metus auctor fringilla.</p>
                                <p>Cras mattis consectetur purus sit amet fermentum. Cras justo odio, dapibus ac
                                    facilisis in, egestas eget quam. Morbi leo risus, porta ac consectetur ac,
                                    vestibulum at eros.</p>
                                <p>Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Vivamus sagittis
                                    lacus vel augue laoreet rutrum faucibus dolor auctor.</p>
                                <p>Aenean lacinia bibendum nulla sed consectetur. Praesent commodo cursus magna, vel
                                    scelerisque nisl consectetur et. Donec sed odio dui. Donec ullamcorper nulla non
                                    metus auctor fringilla.</p>
                                <p>Cras mattis consectetur purus sit amet fermentum. Cras justo odio, dapibus ac
                                    facilisis in, egestas eget quam. Morbi leo risus, porta ac consectetur ac,
                                    vestibulum at eros.</p>
                                <p>Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Vivamus sagittis
                                    lacus vel augue laoreet rutrum faucibus dolor auctor.</p>
                                <p>Aenean lacinia bibendum nulla sed consectetur. Praesent commodo cursus magna, vel
                                    scelerisque nisl consectetur et. Donec sed odio dui. Donec ullamcorper nulla non
                                    metus auctor fringilla.</p>
                                <p>Cras mattis consectetur purus sit amet fermentum. Cras justo odio, dapibus ac
                                    facilisis in, egestas eget quam. Morbi leo risus, porta ac consectetur ac,
                                    vestibulum at eros.</p>
                                <p>Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Vivamus sagittis
                                    lacus vel augue laoreet rutrum faucibus dolor auctor.</p>
                                <p>Aenean lacinia bibendum nulla sed consectetur. Praesent commodo cursus magna, vel
                                    scelerisque nisl consectetur et. Donec sed odio dui. Donec ullamcorper nulla non
                                    metus auctor fringilla.</p>
                                <p>Cras mattis consectetur purus sit amet fermentum. Cras justo odio, dapibus ac
                                    facilisis in, egestas eget quam. Morbi leo risus, porta ac consectetur ac,
                                    vestibulum at eros.</p>
                                <p>Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Vivamus sagittis
                                    lacus vel augue laoreet rutrum faucibus dolor auctor.</p>
                                <p>Aenean lacinia bibendum nulla sed consectetur. Praesent commodo cursus magna, vel
                                    scelerisque nisl consectetur et. Donec sed odio dui. Donec ullamcorper nulla non
                                    metus auctor fringilla.</p>
                                <p>Cras mattis consectetur purus sit amet fermentum. Cras justo odio, dapibus ac
                                    facilisis in, egestas eget quam. Morbi leo risus, porta ac consectetur ac,
                                    vestibulum at eros.</p>
                                <p>Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Vivamus sagittis
                                    lacus vel augue laoreet rutrum faucibus dolor auctor.</p>
                                <p>Aenean lacinia bibendum nulla sed consectetur. Praesent commodo cursus magna, vel
                                    scelerisque nisl consectetur et. Donec sed odio dui. Donec ullamcorper nulla non
                                    metus auctor fringilla.</p>
                            </div>
                            <div class="modal-footer">
                                <div class="row">
                                    <div class="col-md-6 col-xs-12">
                                        <button type="text" class="btn btn-warning btn--block" data-dismiss="modal">
                                            Cancel
                                        </button>
                                    </div>
                                    <div class="col-md-6 col-xs-12">
                                        <a class="btn btn--primary btn--block" href="#">Button</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-xs-3">
                <button type="button" class="btn btn-info btn-lg w-100" data-toggle="modal" data-target="#myModal7">Base
                    Modal Long Scroll Document 400
                </button>
                <!-- Modal -->
                <div class="modal fade custom" id="myModal7" role="dialog" tabindex="-1">
                    <div class="modal-dialog modal-dialog-centered" role="document">
                        <!-- Modal content-->
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                <h4 class="modal-title">Modal Header</h4>
                            </div>
                            <div class="modal-body scrollerable mh-400">
                                <p>Cras mattis consectetur purus sit amet fermentum. Cras justo odio, dapibus ac
                                    facilisis in, egestas eget quam. Morbi leo risus, porta ac consectetur ac,
                                    vestibulum at eros.</p>
                                <p>Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Vivamus sagittis
                                    lacus vel augue laoreet rutrum faucibus dolor auctor.</p>
                                <p>Aenean lacinia bibendum nulla sed consectetur. Praesent commodo cursus magna, vel
                                    scelerisque nisl consectetur et. Donec sed odio dui. Donec ullamcorper nulla non
                                    metus auctor fringilla.</p>
                                <p>Cras mattis consectetur purus sit amet fermentum. Cras justo odio, dapibus ac
                                    facilisis in, egestas eget quam. Morbi leo risus, porta ac consectetur ac,
                                    vestibulum at eros.</p>
                                <p>Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Vivamus sagittis
                                    lacus vel augue laoreet rutrum faucibus dolor auctor.</p>
                                <p>Aenean lacinia bibendum nulla sed consectetur. Praesent commodo cursus magna, vel
                                    scelerisque nisl consectetur et. Donec sed odio dui. Donec ullamcorper nulla non
                                    metus auctor fringilla.</p>
                                <p>Cras mattis consectetur purus sit amet fermentum. Cras justo odio, dapibus ac
                                    facilisis in, egestas eget quam. Morbi leo risus, porta ac consectetur ac,
                                    vestibulum at eros.</p>
                                <p>Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Vivamus sagittis
                                    lacus vel augue laoreet rutrum faucibus dolor auctor.</p>
                                <p>Aenean lacinia bibendum nulla sed consectetur. Praesent commodo cursus magna, vel
                                    scelerisque nisl consectetur et. Donec sed odio dui. Donec ullamcorper nulla non
                                    metus auctor fringilla.</p>
                                <p>Cras mattis consectetur purus sit amet fermentum. Cras justo odio, dapibus ac
                                    facilisis in, egestas eget quam. Morbi leo risus, porta ac consectetur ac,
                                    vestibulum at eros.</p>
                                <p>Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Vivamus sagittis
                                    lacus vel augue laoreet rutrum faucibus dolor auctor.</p>
                                <p>Aenean lacinia bibendum nulla sed consectetur. Praesent commodo cursus magna, vel
                                    scelerisque nisl consectetur et. Donec sed odio dui. Donec ullamcorper nulla non
                                    metus auctor fringilla.</p>
                                <p>Cras mattis consectetur purus sit amet fermentum. Cras justo odio, dapibus ac
                                    facilisis in, egestas eget quam. Morbi leo risus, porta ac consectetur ac,
                                    vestibulum at eros.</p>
                                <p>Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Vivamus sagittis
                                    lacus vel augue laoreet rutrum faucibus dolor auctor.</p>
                                <p>Aenean lacinia bibendum nulla sed consectetur. Praesent commodo cursus magna, vel
                                    scelerisque nisl consectetur et. Donec sed odio dui. Donec ullamcorper nulla non
                                    metus auctor fringilla.</p>
                                <p>Cras mattis consectetur purus sit amet fermentum. Cras justo odio, dapibus ac
                                    facilisis in, egestas eget quam. Morbi leo risus, porta ac consectetur ac,
                                    vestibulum at eros.</p>
                                <p>Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Vivamus sagittis
                                    lacus vel augue laoreet rutrum faucibus dolor auctor.</p>
                                <p>Aenean lacinia bibendum nulla sed consectetur. Praesent commodo cursus magna, vel
                                    scelerisque nisl consectetur et. Donec sed odio dui. Donec ullamcorper nulla non
                                    metus auctor fringilla.</p>
                            </div>
                            <div class="modal-footer">
                                <div class="row">
                                    <div class="col-md-6 col-xs-12">
                                        <button type="text" class="btn btn-warning btn--block" data-dismiss="modal">
                                            Cancel
                                        </button>
                                    </div>
                                    <div class="col-md-6 col-xs-12">
                                        <a class="btn btn--primary btn--block" href="#">Button</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-xs-3">
                <button type="button" class="btn btn-info btn-lg w-100" data-toggle="modal" data-target="#myModal8">Base
                    Modal Long Scroll Document 600
                </button>
                <!-- Modal -->
                <div class="modal fade custom" id="myModal8" role="dialog" tabindex="-1">
                    <div class="modal-dialog modal-dialog-centered" role="document">
                        <!-- Modal content-->
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                <h4 class="modal-title">Modal Header</h4>
                            </div>
                            <div class="modal-body scrollerable mh-600">
                                <p>Cras mattis consectetur purus sit amet fermentum. Cras justo odio, dapibus ac
                                    facilisis in, egestas eget quam. Morbi leo risus, porta ac consectetur ac,
                                    vestibulum at eros.</p>
                                <p>Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Vivamus sagittis
                                    lacus vel augue laoreet rutrum faucibus dolor auctor.</p>
                                <p>Aenean lacinia bibendum nulla sed consectetur. Praesent commodo cursus magna, vel
                                    scelerisque nisl consectetur et. Donec sed odio dui. Donec ullamcorper nulla non
                                    metus auctor fringilla.</p>
                                <p>Cras mattis consectetur purus sit amet fermentum. Cras justo odio, dapibus ac
                                    facilisis in, egestas eget quam. Morbi leo risus, porta ac consectetur ac,
                                    vestibulum at eros.</p>
                                <p>Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Vivamus sagittis
                                    lacus vel augue laoreet rutrum faucibus dolor auctor.</p>
                                <p>Aenean lacinia bibendum nulla sed consectetur. Praesent commodo cursus magna, vel
                                    scelerisque nisl consectetur et. Donec sed odio dui. Donec ullamcorper nulla non
                                    metus auctor fringilla.</p>
                                <p>Cras mattis consectetur purus sit amet fermentum. Cras justo odio, dapibus ac
                                    facilisis in, egestas eget quam. Morbi leo risus, porta ac consectetur ac,
                                    vestibulum at eros.</p>
                                <p>Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Vivamus sagittis
                                    lacus vel augue laoreet rutrum faucibus dolor auctor.</p>
                                <p>Aenean lacinia bibendum nulla sed consectetur. Praesent commodo cursus magna, vel
                                    scelerisque nisl consectetur et. Donec sed odio dui. Donec ullamcorper nulla non
                                    metus auctor fringilla.</p>
                                <p>Cras mattis consectetur purus sit amet fermentum. Cras justo odio, dapibus ac
                                    facilisis in, egestas eget quam. Morbi leo risus, porta ac consectetur ac,
                                    vestibulum at eros.</p>
                                <p>Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Vivamus sagittis
                                    lacus vel augue laoreet rutrum faucibus dolor auctor.</p>
                                <p>Aenean lacinia bibendum nulla sed consectetur. Praesent commodo cursus magna, vel
                                    scelerisque nisl consectetur et. Donec sed odio dui. Donec ullamcorper nulla non
                                    metus auctor fringilla.</p>
                                <p>Cras mattis consectetur purus sit amet fermentum. Cras justo odio, dapibus ac
                                    facilisis in, egestas eget quam. Morbi leo risus, porta ac consectetur ac,
                                    vestibulum at eros.</p>
                                <p>Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Vivamus sagittis
                                    lacus vel augue laoreet rutrum faucibus dolor auctor.</p>
                                <p>Aenean lacinia bibendum nulla sed consectetur. Praesent commodo cursus magna, vel
                                    scelerisque nisl consectetur et. Donec sed odio dui. Donec ullamcorper nulla non
                                    metus auctor fringilla.</p>
                                <p>Cras mattis consectetur purus sit amet fermentum. Cras justo odio, dapibus ac
                                    facilisis in, egestas eget quam. Morbi leo risus, porta ac consectetur ac,
                                    vestibulum at eros.</p>
                                <p>Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Vivamus sagittis
                                    lacus vel augue laoreet rutrum faucibus dolor auctor.</p>
                                <p>Aenean lacinia bibendum nulla sed consectetur. Praesent commodo cursus magna, vel
                                    scelerisque nisl consectetur et. Donec sed odio dui. Donec ullamcorper nulla non
                                    metus auctor fringilla.</p>
                            </div>
                            <div class="modal-footer">
                                <div class="row">
                                    <div class="col-md-6 col-xs-12">
                                        <button type="text" class="btn btn-warning btn--block" data-dismiss="modal">
                                            Cancel
                                        </button>
                                    </div>
                                    <div class="col-md-6 col-xs-12">
                                        <a class="btn btn--primary btn--block" href="#">Button</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row mt-20">
            <div class="col-xs-3">
                <button type="button" class="btn btn-info btn-lg w-100" data-toggle="modal" data-target="#myModal9">Base
                    Modal Long Scroll Document Catalog
                </button>
                <!-- Modal -->
                <div class="modal fade custom" id="myModal9" role="dialog" tabindex="-1">
                    <div class="modal-dialog modal-dialog-centered catalog" role="document">
                        <!-- Modal content-->
                        <div class="modal-content">
                            <div class="modal-body catalog-body">
                                <%--TODO 953 : 375--%>
                                <div class="row">
                                    <div class="col-lg-9 catalog-img-container" id="catalog-img-container">
                                        <img class="catalog-img" src="http://via.placeholder.com/900x2500"/>
                                    </div>
                                    <div class="col-lg-3">
                                        <div class="catalog-list-container">
                                            <div class="d-flex" style="height: 20vh">
                                                <div class="m-auto">
                                                    Profile 영역
                                                </div>
                                            </div>
                                            <div class="owl-item c-item" style="width: 100%;">
                                                <div class="blog-entry">
                                                    <div class="entry--content beans-type">
                                                        <div class="entry--img">
                                                            <a href="#">
                                                                <img src="../../../resources/assets/images/blog/grid/5.jpg"
                                                                     alt="entry image">
                                                            </a>
                                                            <div class="entry--body">
                                                                <div class="oneline">
                                                                    케냐 기티투 AB 싱글빈 케냐 기티투 AB 싱글빈
                                                                </div>
                                                                <div class="pricing">
                                                                    <span class="sales">25,000원</span>
                                                                </div>
                                                            </div>
                                                            <div class="sales-indication">
                                                                40% 할인
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <!-- .entry-content end -->
                                                </div>
                                            </div>
                                            <div class="owl-item c-item" style="width: 100%;">
                                                <div class="blog-entry">
                                                    <div class="entry--content beans-type">
                                                        <div class="entry--img">
                                                            <a href="#">
                                                                <img src="../../../resources/assets/images/blog/grid/5.jpg"
                                                                     alt="entry image">
                                                            </a>
                                                            <div class="entry--body">
                                                                <div class="oneline">
                                                                    케냐 기티투 AB 싱글빈 케냐 기티투 AB 싱글빈
                                                                </div>
                                                                <div class="pricing">
                                                                    <span class="sales">25,000원</span>
                                                                </div>
                                                            </div>
                                                            <div class="sales-indication">
                                                                40% 할인
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <!-- .entry-content end -->
                                                </div>
                                            </div>
                                            <div class="owl-item c-item" style="width: 100%;">
                                                <div class="blog-entry">
                                                    <div class="entry--content beans-type">
                                                        <div class="entry--img">
                                                            <a href="#">
                                                                <img src="../../../resources/assets/images/blog/grid/5.jpg"
                                                                     alt="entry image">
                                                            </a>
                                                            <div class="entry--body">
                                                                <div class="oneline">
                                                                    케냐 기티투 AB 싱글빈 케냐 기티투 AB 싱글빈
                                                                </div>
                                                                <div class="pricing">
                                                                    <span class="sales">25,000원</span>
                                                                </div>
                                                            </div>
                                                            <div class="sales-indication">
                                                                40% 할인
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <!-- .entry-content end -->
                                                </div>
                                            </div>
                                            <%--<div class="owl-item c-item" style="width: 100%;">
                                                <div class="blog-entry">
                                                    <div class="entry--content beans-type">
                                                        <div class="entry--img">
                                                            <a href="#">
                                                                <img src="../../../resources/assets/images/blog/grid/5.jpg"
                                                                     alt="entry image">
                                                            </a>
                                                            <div class="entry--body">
                                                                <div class="oneline">
                                                                    케냐 기티투 AB 싱글빈 케냐 기티투 AB 싱글빈
                                                                </div>
                                                                <div class="pricing">
                                                                    <span class="origin">25,000원</span>
                                                                    <span class="sales">21,400원</span>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <!-- .entry-content end -->
                                                </div>
                                            </div>
                                            <div class="owl-item c-item" style="width: 100%;">
                                                <div class="blog-entry">
                                                    <div class="entry--content beans-type">
                                                        <div class="entry--img">
                                                            <a href="#">
                                                                <img src="../../../resources/assets/images/blog/grid/5.jpg"
                                                                     alt="entry image">
                                                            </a>
                                                            <div class="entry--body">
                                                                <div class="oneline">
                                                                    케냐 기티투 AB 싱글빈 케냐 기티투 AB 싱글빈
                                                                </div>
                                                                <div class="pricing">
                                                                    <span class="origin">25,000원</span>
                                                                    <span class="sales">21,400원</span>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <!-- .entry-content end -->
                                                </div>
                                            </div>
                                            <div class="owl-item c-item" style="width: 100%;">
                                                <div class="blog-entry">
                                                    <div class="entry--content beans-type">
                                                        <div class="entry--img">
                                                            <a href="#">
                                                                <img src="../../../resources/assets/images/blog/grid/5.jpg"
                                                                     alt="entry image">
                                                            </a>
                                                            <div class="entry--body">
                                                                <div class="oneline">
                                                                    케냐 기티투 AB 싱글빈 케냐 기티투 AB 싱글빈
                                                                </div>
                                                                <div class="pricing">
                                                                    <span class="origin">25,000원</span>
                                                                    <span class="sales">21,400원</span>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <!-- .entry-content end -->
                                                </div>
                                            </div>
                                            <div class="owl-item c-item" style="width: 100%;">
                                                <div class="blog-entry">
                                                    <div class="entry--content beans-type">
                                                        <div class="entry--img">
                                                            <a href="#">
                                                                <img src="../../../resources/assets/images/blog/grid/5.jpg"
                                                                     alt="entry image">
                                                            </a>
                                                            <div class="entry--body">
                                                                <div class="oneline">
                                                                    케냐 기티투 AB 싱글빈 케냐 기티투 AB 싱글빈
                                                                </div>
                                                                <div class="pricing">
                                                                    <span class="sales">25,000원</span>
                                                                </div>
                                                            </div>
                                                            <div class="sales-indication">
                                                                40% 할인
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <!-- .entry-content end -->
                                                </div>
                                            </div>--%>
                                            <%--TODO Margin bottom 120px--%>
                                            <div class="catalog-contact-container">
                                                <div class="r-card-container side-widget">
                                                    <h6>I rarely have access to coffee.</h6>
                                                    <span>I come across coffee occasionally, but I often drink it without knowing it.</span>
                                                </div>
                                                <div class="r-card-container side-widget">
                                                    <h6>I rarely have access to coffee.</h6>
                                                    <span>I come across coffee occasionally, but I often drink it without knowing it.</span>
                                                </div>
                                                <div class="r-card-container side-widget">
                                                    <h6>I rarely have access to coffee.</h6>
                                                    <span>I come across coffee occasionally, but I often drink it without knowing it.</span>
                                                </div>
                                                <div class="r-card-container side-widget">
                                                    <h6>I rarely have access to coffee.</h6>
                                                    <span>I come across coffee occasionally, but I often drink it without knowing it.</span>
                                                </div>
                                            </div>
                                            <div class="cancel-btn-container position">
                                                <a class="btn btn--primary btn--block" href="#">Button</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%--TODO Widget--%>
        <div class="row mt-20">
            <h3>Widget</h3>
        </div>
        <div class="row mt-20">
            <div class="col-xs-3">
                <div class="custom-widget product clearfix">
                    <img src="../../../resources/assets/images/shop/thumb/3.jpg" alt="product">
                    <div class="product-desc">
                        <div class="product-title">
                            <a href="#">Mexican Cheese Burger</a>
                        </div>
                        <div class="product-meta">
                            <span>$38.99</span>
                        </div>
                    </div>
                </div>
                <div class="custom-widget product clearfix">
                    <img src="../../../resources/assets/images/shop/thumb/3.jpg" alt="product">
                    <div class="product-desc">
                        <div class="product-title">
                            <a href="#">Mexican Cheese Burger</a>
                        </div>
                        <div class="product-meta">
                            <span>$38.99</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row mt-20">
            <h3>Pagenation</h3>
        </div>
        <div class="row mt-20">
            <div class="col-xs-3">
                <ul class="pagination">
                    <li class="disabled">
                        <a aria-label="Previous">
                            <span aria-hidden="true"><i class="fa fa-long-arrow-left"></i></span>
                        </a>
                    </li>
                    <li class="active"><a>1</a>
                    </li>
                    <li><a>2</a>
                    </li>
                    <li><a>3</a>
                    </li>
                    <li>
                        <a aria-label="Next">
                            <span aria-hidden="true"><i class="fa fa-long-arrow-right"></i></span>
                        </a>
                    </li>
                </ul>
            </div>
            <div class="col-xs-3">
                <ul class="pagination">
                    <li>
                        <a aria-label="Previous">
                            <span aria-hidden="true"><i class="fa fa-long-arrow-left"></i></span>
                        </a>
                    </li>
                    <li class="active"><a>1</a>
                    </li>
                    <li><a>2</a>
                    </li>
                    <li><a>3</a>
                    </li>
                    <li>
                        <a aria-label="Next">
                            <span aria-hidden="true"><i class="fa fa-long-arrow-right"></i></span>
                        </a>
                    </li>
                </ul>
            </div>
            <div class="col-xs-3">
                <ul class="pagination">
                    <li>
                        <a aria-label="Previous">
                            <span aria-hidden="true"><i class="fa fa-long-arrow-left"></i></span>
                        </a>
                    </li>
                    <li><a>1</a>
                    </li>
                    <li class="active"><a>2</a>
                    </li>
                    <li><a>3</a>
                    </li>
                    <li>
                        <a aria-label="Next">
                            <span aria-hidden="true"><i class="fa fa-long-arrow-right"></i></span>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
        <div class="row mt-20">
            <div class="col-xs-6">
                <div id="pagination_layout">
                    <div class="r-card-container">
                        <div class="add-icon-container only-text">
                            <h6>Coffee Maker (Machine)1</h6>
                        </div>
                    </div>
                    <div class="r-card-container">
                        <div class="add-icon-container only-text">
                            <h6>Coffee Maker (Machine)2</h6>
                        </div>
                    </div>
                    <div class="r-card-container">
                        <div class="add-icon-container only-text">
                            <h6>Coffee Maker (Machine)3</h6>
                        </div>
                    </div>
                    <div class="r-card-container">
                        <div class="add-icon-container only-text">
                            <h6>Coffee Maker (Machine)4</h6>
                        </div>
                    </div>
                    <div class="r-card-container">
                        <div class="add-icon-container only-text">
                            <h6>Coffee Maker (Machine)5</h6>
                        </div>
                    </div>
                    <div class="r-card-container">
                        <div class="add-icon-container only-text">
                            <h6>Coffee Maker (Machine)6</h6>
                        </div>
                    </div>
                    <div class="r-card-container">
                        <div class="add-icon-container only-text">
                            <h6>Coffee Maker (Machine)7</h6>
                        </div>
                    </div>
                    <div class="r-card-container">
                        <div class="add-icon-container only-text">
                            <h6>Coffee Maker (Machine)8</h6>
                        </div>
                    </div>
                    <div class="r-card-container">
                        <div class="add-icon-container only-text">
                            <h6>Coffee Maker (Machine)9</h6>
                        </div>
                    </div>
                    <div class="r-card-container">
                        <div class="add-icon-container only-text">
                            <h6>Coffee Maker (Machine)10</h6>
                        </div>
                    </div>
                    <div class="r-card-container">
                        <div class="add-icon-container only-text">
                            <h6>Coffee Maker (Machine)11</h6>
                        </div>
                    </div>
                    <div class="r-card-container">
                        <div class="add-icon-container only-text">
                            <h6>Coffee Maker (Machine)12</h6>
                        </div>
                    </div>
                </div>
                <div class="mt-20 text-center">
                    <ul id="nav-ul" class="pagination">
                        <li class="page-item prev">
                            <a class="page-link" aria-label="Previous">
                                <span aria-hidden="true"><i class="fa fa-long-arrow-left"></i></span>
                            </a>
                        </li>
                        <li class="page-item active"><a>1</a></li>
                        <li class="page-item"><a>2</a></li>
                        <li class="page-item"><a>3</a></li>
                        <li class="page-item next">
                            <a class="page-link" aria-label="Next">
                                <span aria-hidden="true"><i class="fa fa-long-arrow-right"></i></span>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="col-xs-6">
                <div id="pagination-layout-all">
                    <div class="r-card-container">
                        <div class="add-icon-container only-text">
                            <h6>Coffee Maker (Machine)1</h6>
                        </div>
                    </div>
                    <div class="r-card-container">
                        <div class="add-icon-container only-text">
                            <h6>Coffee Maker (Machine)2</h6>
                        </div>
                    </div>
                    <div class="r-card-container">
                        <div class="add-icon-container only-text">
                            <h6>Coffee Maker (Machine)3</h6>
                        </div>
                    </div>
                    <div class="r-card-container">
                        <div class="add-icon-container only-text">
                            <h6>Coffee Maker (Machine)4</h6>
                        </div>
                    </div>
                    <div class="r-card-container">
                        <div class="add-icon-container only-text">
                            <h6>Coffee Maker (Machine)5</h6>
                        </div>
                    </div>
                    <div class="r-card-container">
                        <div class="add-icon-container only-text">
                            <h6>Coffee Maker (Machine)6</h6>
                        </div>
                    </div>
                    <div class="r-card-container">
                        <div class="add-icon-container only-text">
                            <h6>Coffee Maker (Machine)7</h6>
                        </div>
                    </div>
                    <div class="r-card-container">
                        <div class="add-icon-container only-text">
                            <h6>Coffee Maker (Machine)8</h6>
                        </div>
                    </div>
                    <div class="r-card-container">
                        <div class="add-icon-container only-text">
                            <h6>Coffee Maker (Machine)9</h6>
                        </div>
                    </div>
                    <div class="r-card-container">
                        <div class="add-icon-container only-text">
                            <h6>Coffee Maker (Machine)10</h6>
                        </div>
                    </div>
                    <div class="r-card-container">
                        <div class="add-icon-container only-text">
                            <h6>Coffee Maker (Machine)11</h6>
                        </div>
                    </div>
                    <div class="r-card-container">
                        <div class="add-icon-container only-text">
                            <h6>Coffee Maker (Machine)12</h6>
                        </div>
                    </div>
                </div>
                <div class="mt-20 text-center">
                    <ul id="nav-ul-all" class="pagination">
                        <li class="page-item prev">
                            <a class="page-link" aria-label="Previous">
                                <span aria-hidden="true"><i class="fa fa-long-arrow-left"></i></span>
                            </a>
                        </li>
                        <li class="page-item active"><a>1</a></li>
                        <li class="page-item"><a>2</a></li>
                        <li class="page-item"><a>3</a></li>
                        <li class="page-item next">
                            <a class="page-link" aria-label="Next">
                                <span aria-hidden="true"><i class="fa fa-long-arrow-right"></i></span>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="row mt-20">
            <h3>Menu</h3>
        </div>
        <div class="row mt-20">
            <div class="col-xs-3">
                <div class="accordion accordion-menu accordion-3" id="accordion05">
                    <!-- Panel 01 -->
                    <div class="panel p-resize">
                        <div class="panel--heading">
                            <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion03"
                               href="#collapse05-1" aria-expanded="true">Menu</a>
                        </div>
                        <div id="collapse05-1" class="panel--body panel-collapse collapse in p-0" aria-expanded="true">
                            <ul>
                                <li><a>Action</a></li>
                                <li><a>Another action</a></li>
                                <li><a>Something else here</a></li>
                                <li><a>Separated link</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="panel p-resize">
                        <div class="panel--heading">
                            <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion05"
                               href="#collapse06-1" aria-expanded="true">Menu</a>
                        </div>
                        <div id="collapse06-1" class="panel--body panel-collapse collapse in p-0" aria-expanded="true">
                            <ul>
                                <li><a>Action</a></li>
                                <li><a>Another action</a></li>
                                <li><a>Something else here</a></li>
                                <li><a>Separated link</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="container-fluid" style="height: 40vh;">
    </div>
</div>
<%--TODO Footer--%>
<footer id="footer" class="footer footer-2">
    <!-- Widget Section
    ============================================= -->
    <div class="footer--widget">
        <div class="container-fluid">
            <div class="row">
                <div class="col-xs-12 col-sm-12 col-md-3">
                    <div class="footer--widget-content">
                        <img src="http://via.placeholder.com/60x80"/>
                        <p class="mt-20">서울특별시 동작구 사당 4동 222-12</p>
                        <!-- .widget end -->
                        <p>010-0000-0000</p>
                        <p>(주) 유알커피</p>
                        <p>대표: 임경직</p>
                        <p>사업자번호: 00-000-0000</p>
                        <div class="footer--social-icons mt-20">
                            <a href="#"><i class="fa fa-facebook"></i></a>
                            <a href="#"><i class="fa fa-twitter"></i></a>
                            <a href="#"><i class="fa fa-instagram"></i></a>
                            <a href="#"><i class="fa fa-pinterest"></i></a>
                            <a href="#"><i class="fa fa-tripadvisor"></i></a>
                        </div>
                    </div>
                </div>
                <!-- .col-md-3 end -->

                <div class="col-xs-12 col-sm-12 col-md-9">
                    <div class="footer--widget-content widget-reservations">
                        <div class="row">
                            <div class="col-xs-12 col-sm-6 col-md-10 col-lg-9">
                                <h3 class="mb-0 d-block pb-20 border-underlline">Sitemap</h3>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12 col-sm-6 col-md-3 col-lg-2">
                                <ul class="footer-ul-list">
                                    <li class="first">
                                        <a href="#">Object</a>
                                    </li>
                                    <li>
                                        <a href="#">Object</a>
                                    </li>
                                    <li>
                                        <a href="#">Object</a>
                                    </li>
                                    <li>
                                        <a href="#">Object</a>
                                    </li>
                                    <li>
                                        <a href="#">Object</a>
                                    </li>
                                </ul>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-3 col-lg-2">
                                <ul class="footer-ul-list">
                                    <li class="first">
                                        <a href="#">Object</a>
                                    </li>
                                    <li>
                                        <a href="#">Object</a>
                                    </li>
                                    <li>
                                        <a href="#">Object</a>
                                    </li>
                                    <li>
                                        <a href="#">Object</a>
                                    </li>
                                    <li>
                                        <a href="#">Object</a>
                                    </li>
                                </ul>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-3 col-lg-2">
                                <ul class="footer-ul-list">
                                    <li class="first">
                                        <a href="#">Object</a>
                                    </li>
                                    <li>
                                        <a href="#">Object</a>
                                    </li>
                                    <li>
                                        <a href="#">Object</a>
                                    </li>
                                    <li>
                                        <a href="#">Object</a>
                                    </li>
                                    <li>
                                        <a href="#">Object</a>
                                    </li>
                                </ul>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-3 col-lg-2">
                                <ul class="footer-ul-list">
                                    <li class="first">
                                        <a href="#">Object</a>
                                    </li>
                                    <li>
                                        <a href="#">Object</a>
                                    </li>
                                    <li>
                                        <a href="#">Object</a>
                                    </li>
                                    <li>
                                        <a href="#">Object</a>
                                    </li>
                                    <li>
                                        <a href="#">Object</a>
                                    </li>
                                </ul>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-3 col-lg-2">
                                <ul class="footer-ul-list">
                                    <li class="first">
                                        <a href="#">Object</a>
                                    </li>
                                    <li>
                                        <a href="#">Object</a>
                                    </li>
                                    <li>
                                        <a href="#">Object</a>
                                    </li>
                                    <li>
                                        <a href="#">Object</a>
                                    </li>
                                    <li>
                                        <a href="#">Object</a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- .col-md-3 end -->
            </div>
        </div>
        <!-- .container end -->
    </div>
    <!-- .footer-widget end -->
    <!-- Copyrights
    ============================================= -->
    <div class="footer--copyright">
        <div class="container-fluid">
            <div class="row">
                <div class="col-xs-12 col-sm-6 col-md-6">
                    <span>© Union of Roaster Coffee Inc. 2020. Copyright All Rights Reserved.</span>
                    <a href="#" style="margin-left: 8px;">개인 정보 처리방침</a>
                    <a href="#" style="margin-left: 8px;">서비스 이용약관</a>
                </div>
                <div class="col-xs-12 col-sm-6 col-md-6">
                    <div class="footer--widget-content text-right">
                        <div class="footer--social-icons">
                            <span class="mr-10">Follow Us </span>
                            <a href="#"><i class="fa fa-facebook"></i></a>
                            <a href="#"><i class="fa fa-twitter"></i></a>
                            <a href="#"><i class="fa fa-instagram"></i></a>
                            <a href="#"><i class="fa fa-pinterest"></i></a>
                            <a href="#"><i class="fa fa-tripadvisor"></i></a>
                        </div>
                        <!-- .social-icons end -->
                    </div>
                </div>
            </div>
        </div>
        <!-- .container end -->
    </div>
    <!-- .footer-copyright end -->
</footer>
<script src="../../../resources/assets/js/plugins.js"></script>
<script src="../../../resources/assets/js/functions.js"></script>
<!-- RS5.0 Core JS Files -->
<script src="../../../resources/assets/revolution/js/jquery.themepunch.tools.min.js?rev=5.0"></script>
<script src="../../../resources/assets/revolution/js/jquery.themepunch.revolution.min.js?rev=5.0"></script>
<script src="../../../resources/assets/revolution/js/extensions/revolution.extension.video.min.js"></script>
<script src="../../../resources/assets/revolution/js/extensions/revolution.extension.slideanims.min.js"></script>
<script src="../../../resources/assets/revolution/js/extensions/revolution.extension.actions.min.js"></script>
<script src="../../../resources/assets/revolution/js/extensions/revolution.extension.layeranimation.min.js"></script>
<script src="../../../resources/assets/revolution/js/extensions/revolution.extension.kenburn.min.js"></script>
<script src="../../../resources/assets/revolution/js/extensions/revolution.extension.navigation.min.js"></script>
<script src="../../../resources/assets/revolution/js/extensions/revolution.extension.migration.min.js"></script>
<script src="../../../resources/assets/revolution/js/extensions/revolution.extension.parallax.min.js"></script>
<!-- RS Configration JS Files -->
<script src="../../../resources/assets/js/rsconfig.js"></script>
<script src="../../../resources/js/textarea.js"></script>
<script src="../../../resources/assets/js/okiwi-pagination.js"></script>
<script src="../../../resources/js/header.js"></script>
<script src="../../../resources/js/common.js"></script>
<script>
    /*TODO HashTag Javascript*/
    $(document).ready(function () {
        var hash_input = document.getElementById("input-hash");
        var hash_container = document.getElementById('hash-container');
        hash_input.addEventListener('keyup', function (event) {
            if (event.keyCode == 13 && hash_input.value.length > 0) {
                var text = document.createTextNode(hash_input.value);
                var p = document.createElement('p');
                p.classList.add('tag');
                var element_text = document.createElement('span');
                element_text.classList.add('text');
                element_text.appendChild(text);
                var element_button = document.createElement('span');
                element_button.classList.add('x-button');
                p.appendChild(element_text);
                p.appendChild(element_button);
                hash_container.appendChild(p);
                hash_input.value = '';
                var deleteTags = hash_container.querySelectorAll('.tag');
                for (let j = 0; j < deleteTags.length; j++) {
                    deleteTags[j].addEventListener('click', function () {
                        hash_container.removeChild(deleteTags[j]);
                    });
                }
            }
        });
    });
    /*TODO HashTag Javascript End*/

    /*TODO File Input Javascript*/
    // 이벤트를 바인딩해서 input에 파일이 올라올때 위의 함수를 this context로 실행합니다.
    $('#custom-file-input').change(function () {
        readURL(this, 'custom-file-background', 'custom-file-name');
    });

    function readURL(input, preview, file_name) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function (e) {
                var file = input.files[0];
                var fileType = file['type'];
                var validImageTypes = ['image/gif', 'image/jpeg', 'image/png', 'image/svg+xml'];
                if (!validImageTypes.includes(fileType)) {
                    // invalid file type code goes here.
                    $('#' + preview).css('background-image', 'url(' + '../resources/assets/images/background/5.jpg' + ')');
                } else {
                    $('#' + preview).css('background-image', 'url(' + e.target.result + ')');
                }
                $('#' + file_name).attr('value', getFileName(input.id));
            };
            reader.readAsDataURL(input.files[0]);
        }
    }

    function getFileName(id) {
        var fileValue = $('#' + id).val().split("\\");
        var fileName = fileValue[fileValue.length - 1];
        return fileName;
    }

    /*TODO File Input Javascript End*/

    /*TODO Progress bar type-1 javascript start*/
    let els = document.getElementsByClassName('step');
    let steps = [];
    Array.prototype.forEach.call(els, (e) => {
        steps.push(e);
        e.addEventListener('click', (x) => {
            progress(x.target.id);
        });
    });

    function progress(stepNum) {
        let p = stepNum * 30;
        document.getElementsByClassName('percent')[0].style.width = `${p}%`;
        steps.forEach((e) => {
            if (e.id === stepNum) {
                e.classList.add('selected');
                e.classList.remove('completed');
            }
            if (e.id < stepNum) {
                e.classList.add('completed');
            }
            if (e.id > stepNum) {
                e.classList.remove('selected', 'completed');
            }
        });
    }

    /*TODO Progress bar javascript end*/

    /*TODO Dropdown list checkbox javascript start*/
    $(".checkbox-menu").on("change", "input[type='checkbox']", function () {
        $(this).closest("li").toggleClass("active", this.checked);
    });

    $(document).on('click', '.allow-focus', function (e) {
        e.stopPropagation();
    });

    $(document).ready(function () {
        $('.checkbox').change(function () {
            var ul = $(this).parent().parent().parent().parent();
            var checks_total_element = ul.children('div.checks-total')[0];
            while (checks_total_element.firstChild) {
                checks_total_element.removeChild(checks_total_element.lastChild);
            }
            var li_elements = ul.children('li:not(.divider)');
            for (var i = 0; i < li_elements.length; i++) {
                var object = li_elements[i];
                var text = object.querySelector('label.checkbox-type span');
                var checkbox = object.querySelector('label.checkbox-type div.checks input.checkbox');
                if (checkbox.checked) {
                    var p = document.createElement('p');
                    p.innerText = text.innerText;
                    checks_total_element.appendChild(p);
                }
            }
        });
    });
    /*TODO Dropdown list checkbox javascript end*/

    /*TODO Catalog Modal Resizing javascript start*/
    const resize_ob = new ResizeObserver(function (entries) {
        // since we are observing only a single element, so we access the first element in entries array
        var list_element = document.getElementsByClassName('catalog-list-container')[0];
        let rect = entries[0].contentRect;

        // current width & height
        let width = rect.width;
        let height = rect.height;

        var button_container = document.getElementsByClassName('cancel-btn-container')[0];

        if (list_element.offsetHeight < height) {
            /*TODO position*/
            document.getElementsByClassName('catalog-list-container')[0].style.height = height + 'px';
            document.getElementsByClassName('catalog-list-container')[0].style.maxHeight = height + 'px';
        } else {
            /*TODO unposition*/
            document.getElementsByClassName('catalog-list-container')[0].style.height = height + 'px';
            document.getElementsByClassName('catalog-list-container')[0].style.maxHeight = height + 'px';
            if (button_container.classList.contains('position'))
                button_container.classList.add('unposition');
            else {
                if (!button_container.classList.contains('unposition'))
                    button_container.classList.add('unposition');
            }
        }
    });
    $(document).ready(function () {
        // start observing for resize
        resize_ob.observe(document.querySelector('#catalog-img-container'));
    });
    /*TODO Catalog Modal Resizing javascript end*/
    /*TODO Pagination javascript start*/
    $(document).ready(function () {
        var pagination_id = 'nav-ul';
        var layout_id = 'pagination_layout';
        var divider_item_name = 'div.r-card-container';
        runPagination(pagination_id, layout_id, divider_item_name);
    });
    $(document).ready(function () {
        var pagination_id = 'nav-ul-all';
        var layout_id = 'pagination-layout-all';
        var divider_item_name = 'div.r-card-container';
        runPagination(pagination_id, layout_id, divider_item_name);
    });
    /*TODO Pagination javascript end*/
</script>
</body>
</html><%--
  Created by IntelliJ IDEA.
  User: zlzld
  Date: 2021-01-25
  Time: 오전 4:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href='http://fonts.googleapis.com/css?family=Poppins:300,300i,400,400i,500,500i,600,700,900%7CRuthie%7CAbril+Fatface'
          rel='stylesheet' type='text/css'>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;700&display=swap"
          rel="stylesheet">
    <script src="../../../resources/assets/js/jquery-2.2.4.min.js"></script>

    <!-- Stylesheets
        ============================================= -->
    <link href="../../../resources/assets/css/bootstrap.min.css" rel="stylesheet">

    <link href="../../../resources/assets/css/external.css" rel="stylesheet">
    <link href="../../../resources/assets/css/style.css" rel="stylesheet">

    <!-- RS5.0 Main Stylesheet -->
    <link rel="stylesheet" type="text/css" href="../../../resources/assets/revolution/css/settings.css">
    <link rel="stylesheet" type="text/css" href="../../../resources/assets/revolution/css/layers.css">
    <link rel="stylesheet" type="text/css" href="../../../resources/assets/revolution/css/navigation.css">

    <!-- HTML5 shim, for IE6-8 support of HTML5 elements. All other JS at the end of file. -->
    <!--[if lt IE 9]>
    <script src="../../../resources/assets/js/html5shiv.js"></script>
    <script src="../../../resources/assets/js/respond.min.js"></script>
    <![endif]-->

    <!-- Document Title
    ============================================= -->

    <!-- Option 2: jQuery, Popper.js, and Bootstrap JS
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js" integrity="sha384-w1Q4orYjBQndcko6MimVbzY0tgp4pWB4lZ7lr30WKz0vr/aWKhXdBNmNb5D92v7s" crossorigin="anonymous"></script>
    -->
    <link rel="stylesheet" type="text/css" href="../../../resources/css/custom_element.css">

    <title>Element</title>
</head>
<body style="background-color: white !important;">
<div class="preloader">
    <div class="spinner">
        <div class="bounce1"></div>
        <div class="bounce2"></div>
        <div class="bounce3"></div>
    </div>
</div>
<%--Header--%>
<div id="wrapper" class="wrapper clearfix">
    <header id="navbar-spy"
            class="header header-5 header-2 header-topbar header-transparent header-transparent-topbar header-fixed">
        <div id="top-bar" class="top-bar topbar-transparent">
            <div class="container">
                <div class="container-bordered">
                    <div class="row">
                        <div class="col-xs-12 col-sm-6 col-md-6 top--contact hidden-xs">
                            <ul class="list-inline mb-0 ">
                                <li>
                                    <i class="fa fa-map-marker"></i><span>Tanta AlGharbia, Egypt.</span>
                                </li>
                                <li>
                                    <i class="fa fa-phone"></i> <span>+ 2 0106 5370701</span>
                                </li>
                            </ul>
                        </div>
                        <!-- .col-md-6 end -->
                        <div class="col-xs-12 col-sm-6 col-md-6 top--social text-right text-center-xs">
                            <span>즐겨찾기 추가</span>
                            <a class="facebook" href="#"><i class="fa fa-facebook"></i></a>
                            <a class="twitter" href="#"><i class="fa fa-instagram"></i></a>
                            <a class="instagram" href="#"><i class="fa fa-notion"><img class="position-relative"
                                                                                       style="top: -2px;"
                                                                                       src="../../../resources/custom/icons/icon-naver.svg"/></i></a>
                            <a class="tripadvisor" href="#"><i class="fa fa-naver"><img class="position-relative"
                                                                                        style="top: -2px;"
                                                                                        src="../../../resources/custom/icons/icon-notion.svg"/></i></a>
                        </div>
                        <!-- .col-md-6 end -->
                    </div>
                </div>
            </div>
        </div>
        <nav id="primary-menu" class="navbar navbar-fixed-top">
            <div class="container">
                <!-- Brand and toggle get grouped for better mobile display -->
                <div class="navbar-header position-relative">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                            data-target="#navbar-collapse-1" aria-expanded="false">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="logo position-absolute" style="top: 0;left: 0;" href="#">
                        <img class="logo-light position-absolute" style="top: -55px;left: -180px"
                             src="http://via.placeholder.com/160x180" alt="Steakin Logo"
                             draggable="false">
                        <img class="logo-dark" src="../../../resources/assets/images/logo/logo-dark.png"
                             alt="Steakin Logo"
                             draggable="false">
                    </a>
                </div>

                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse pull-right" id="navbar-collapse-1">
                    <ul class="nav navbar-nav nav-pos-right navbar-left">
                        <!-- Home Menu -->
                        <li class="has-dropdown mega-dropdown active">
                            <a href="#" data-toggle="dropdown" class="dropdown-toggle menu-item">home</a>
                            <ul class="dropdown-menu mega-dropdown-menu">
                                <li>
                                    <div class="container">
                                        <div class="row">
                                            <!-- Column #1 -->
                                            <div class="col-md-3">
                                                <ul>
                                                    <li>
                                                        <a href="#">home main</a>
                                                    </li>
                                                    <li>
                                                        <a href="#">homeoage 2</a>
                                                    </li>
                                                    <li>
                                                        <a href="#">homeoage 3</a>
                                                    </li>
                                                    <li>
                                                        <a href="#">homeoage 4</a>
                                                    </li>
                                                </ul>
                                            </div>
                                            <!-- .col-md-3 end -->

                                            <!-- Column #2 -->
                                            <div class="col-md-3">
                                                <ul>
                                                    <li>
                                                        <a href="#">homepage 5</a>
                                                    </li>
                                                    <li>
                                                        <a href="#">homepage 6</a>
                                                    </li>
                                                    <li>
                                                        <a href="#">homepage 7</a>
                                                    </li>
                                                    <li>
                                                        <a href="#">homepage 8</a>
                                                    </li>
                                                </ul>
                                            </div>
                                            <!-- .col-md-2 end -->

                                            <!-- Column #3 -->
                                            <div class="col-md-3">
                                                <ul>
                                                    <li>
                                                        <a href="#">homepage 9 (boxed)</a>
                                                    </li>
                                                    <li>
                                                        <a href="#">homepage 10 (wide)</a>
                                                    </li>
                                                    <li>
                                                        <a href="#">homepage 11 (dark)</a>
                                                    </li>
                                                    <li>
                                                        <a href="#">homepage 12 (shop)</a>
                                                    </li>
                                                </ul>
                                            </div>
                                            <!-- .col-md-3 end -->

                                            <!-- Column #3 -->
                                            <div class="col-md-3">
                                                <ul>
                                                    <li>
                                                        <a href="#">homepage RTL</a>
                                                    </li>
                                                    <li>
                                                        <a href="#">homepage Arabic</a>
                                                    </li>
                                                </ul>
                                            </div>
                                            <!-- .col-md-3 end -->
                                        </div>
                                        <!-- .row end -->
                                    </div>
                                    <!-- container end -->
                                </li>
                            </ul>
                            <!-- .mega-dropdown-menu end -->
                        </li>
                        <!-- li end -->

                        <!-- About Menu -->
                        <li class="has-dropdown">
                            <a href="#" data-toggle="dropdown" class="dropdown-toggle menu-item">About</a>
                            <ul class="dropdown-menu">
                                <li>
                                    <a href="#">our story</a>
                                </li>
                                <li>
                                    <a href="#">our chefs</a>
                                </li>
                                <li>
                                    <a href="#">contact us</a>
                                </li>
                                <li>
                                    <a href="#">FAQs</a>
                                </li>
                                <li>
                                    <a href="#">guestbook</a>
                                </li>
                                <li>
                                    <a href="#">gallery</a>
                                </li>

                            </ul>
                        </li>
                        <!-- li end -->

                        <!-- About Menu -->
                        <li class="has-dropdown">
                            <a href="#" data-toggle="dropdown" class="dropdown-toggle  menu-item" data-hover="pages">Menu</a>
                            <ul class="dropdown-menu">
                                <li>
                                    <a href="#">menu board</a>
                                </li>
                                <li>
                                    <a href="#">menu classic</a>
                                </li>
                                <li>
                                    <a href="#">menu gallery</a>
                                </li>
                                <li>
                                    <a href="#">menu grid</a>
                                </li>
                                <li>
                                    <a href="#">menu simple</a>
                                </li>
                            </ul>
                        </li>
                        <!-- li end -->

                        <li>
                            <a class="menu-item" href="page-book-table.html">book a table</a>
                        </li>

                        <!-- Features Menu-->
                        <li class="has-dropdown">
                            <a href="#" data-toggle="dropdown" class="dropdown-toggle menu-item">features</a>
                            <ul class="dropdown-menu">
                                <li class="dropdown-submenu">
                                    <a href="#" data-toggle="dropdown" class="dropdown-toggle">revolution sliders</a>
                                    <ul class="dropdown-menu">
                                        <li class="has-dropdown">
                                            <a href="#" data-toggle="dropdown" class="dropdown-toggle">Sliders 1</a>
                                            <ul class="dropdown-menu">
                                                <li>
                                                    <a href="#">slider 1</a>
                                                </li>
                                                <li>
                                                    <a href="#">slider 2</a>
                                                </li>
                                                <li>
                                                    <a href="#">slider 3</a>
                                                </li>
                                                <li>
                                                    <a href="#">slider 4</a>
                                                </li>
                                            </ul>
                                        </li>
                                        <li class="has-dropdown">
                                            <a href="#" data-toggle="dropdown" class="dropdown-toggle">Sliders 2</a>
                                            <ul class="dropdown-menu">
                                                <li>
                                                    <a href="#">slider 5</a>
                                                </li>
                                                <li>
                                                    <a href="#">slider 6</a>
                                                </li>
                                                <li>
                                                    <a href="#">slider 7</a>
                                                </li>
                                                <li>
                                                    <a href="#">slider 8</a>
                                                </li>
                                                <li>
                                                    <a href="#">slider 9</a>
                                                </li>
                                            </ul>
                                        </li>
                                    </ul>
                                </li>
                                <li class="dropdown-submenu">
                                    <a href="#" data-toggle="dropdown" class="dropdown-toggle">Headers</a>
                                    <ul class="dropdown-menu">
                                        <li class="has-dropdown">
                                            <a href="#" data-toggle="dropdown" class="dropdown-toggle">transparent</a>
                                            <ul class="dropdown-menu">
                                                <li>
                                                    <a href="#">transparent 2</a>
                                                </li>
                                                <li>
                                                    <a href="#">transparent 3</a>
                                                </li>
                                                <li>
                                                    <a href="#">transparent 5</a>
                                                </li>
                                                <li>
                                                    <a href="#">transparent 6</a>
                                                </li>
                                                <li>
                                                    <a href="#">transparent 7</a>
                                                </li>
                                                <li>
                                                    <a href="#">transparent 8</a>
                                                </li>
                                            </ul>
                                        </li>
                                        <li class="has-dropdown">
                                            <a href="#" data-toggle="dropdown" class="dropdown-toggle">centered</a>
                                            <ul class="dropdown-menu">
                                                <li>
                                                    <a href="#">centered 1</a>
                                                </li>
                                                <li>
                                                    <a href="#">centered 2</a>
                                                </li>
                                            </ul>
                                        </li>
                                        <li class="has-dropdown">
                                            <a href="#" data-toggle="dropdown" class="dropdown-toggle">with topbar</a>
                                            <ul class="dropdown-menu">
                                                <li>
                                                    <a href="#">topbar 1</a>
                                                </li>
                                            </ul>
                                        </li>
                                        <li class="has-dropdown">
                                            <a href="#" data-toggle="dropdown" class="dropdown-toggle">fixed top</a>
                                            <ul class="dropdown-menu">
                                                <li>
                                                    <a href="header-1.html">fixed 1</a>
                                                </li>
                                                <li>
                                                    <a href="header-2.html">fixed 2</a>
                                                </li>
                                            </ul>
                                        </li>
                                        <li class="has-dropdown">
                                            <a href="#" data-toggle="dropdown" class="dropdown-toggle">bordered</a>
                                            <ul class="dropdown-menu">
                                                <li>
                                                    <a href="#">bordered 8</a>
                                                </li>
                                            </ul>
                                        </li>
                                    </ul>
                                </li>
                                <li class="dropdown-submenu">
                                    <a href="#" data-toggle="dropdown" class="dropdown-toggle">Footers</a>
                                    <ul class="dropdown-menu">
                                        <li>
                                            <a href="#">Footer 1</a>
                                        </li>
                                        <li>
                                            <a href="#">Footer 2</a>
                                        </li>
                                        <li>
                                            <a href="#">Footer 3</a>
                                        </li>
                                        <li>
                                            <a href="#">Footer 4</a>
                                        </li>
                                        <li>
                                            <a href="#">Footer 5</a>
                                        </li>
                                        <li>
                                            <a href="#">Footer 6</a>
                                        </li>
                                        <li>
                                            <a href="#">Footer 7</a>
                                        </li>
                                        <li>
                                            <a href="#">Footer 8</a>
                                        </li>
                                    </ul>
                                </li>
                                <li class="dropdown-submenu">
                                    <a href="#" data-toggle="dropdown" class="dropdown-toggle">page titels</a>
                                    <ul class="dropdown-menu">
                                        <li>
                                            <a href="#">page title 1</a>
                                        </li>
                                        <li>
                                            <a href="#">page title 2</a>
                                        </li>
                                        <li>
                                            <a href="#">page title 3</a>
                                        </li>
                                        <li>
                                            <a href=#>page title 4</a>
                                        </li>
                                        <li>
                                            <a href="page-title-5.html">page title 5</a>
                                        </li>
                                        <li>
                                            <a href="page-title-6.html">page title 6</a>
                                        </li>
                                        <li>
                                            <a href="page-title-7.html">page title 7</a>
                                        </li>
                                        <li>
                                            <a href="page-title-8.html">page title 8</a>
                                        </li>
                                        <li>
                                            <a href="page-title-9.html">page title 9</a>
                                        </li>
                                        <li>
                                            <a href="page-title-10.html">page title 10</a>
                                        </li>
                                        <li>
                                            <a href="page-title-11.html">page title 11</a>
                                        </li>
                                    </ul>
                                </li>
                                <li class="dropdown-submenu">
                                    <a href="#" data-toggle="dropdown" class="dropdown-toggle">widgets</a>
                                    <ul class="mega-menu">
                                        <li>
                                            <ul>
                                                <li>
                                                    <a href="elements-widgets.html">flickr stream</a>
                                                </li>
                                                <li>
                                                    <a href="elements-widgets.html">search</a>
                                                </li>
                                                <li>
                                                    <a href="elements-widgets.html">last tweets</a>
                                                </li>
                                                <li>
                                                    <a href="elements-widgets.html">Filter</a>
                                                </li>
                                                <li>
                                                    <a href="elements-widgets.html">recent posts</a>
                                                </li>
                                            </ul>
                                        </li>
                                        <li>
                                            <ul>
                                                <li>
                                                    <a href="elements-widgets.html">Advertisement</a>
                                                </li>
                                                <li>
                                                    <a href="elements-widgets.html">Recent Items</a>
                                                </li>
                                                <li>
                                                    <a href="elements-widgets.html">tag clouds</a>
                                                </li>
                                                <li>
                                                    <a href="elements-widgets.html">categories</a>
                                                </li>
                                            </ul>
                                        </li>
                                    </ul>
                                </li>
                                <li class="dropdown-submenu">
                                    <a href="#" data-toggle="dropdown" class="dropdown-toggle">untility pages</a>
                                    <ul class="dropdown-menu">
                                        <li>
                                            <a href="page-404.html">page 404</a>
                                        </li>
                                        <li>
                                            <a href="page-soon.html">coming soon</a>
                                        </li>
                                        <li>
                                            <a href="page-maintenance.html">maintenance</a>
                                        </li>
                                    </ul>
                                </li>
                                <li class="dropdown-submenu">
                                    <a href="#" data-toggle="dropdown" class="dropdown-toggle">page tempalates</a>
                                    <ul class="dropdown-menu">
                                        <li>
                                            <a href="page-layout-fullwidth.html">fullwidth</a>
                                        </li>
                                        <li>
                                            <a href="page-layout-fullwidth-wide.html">fullwidth wide</a>
                                        </li>
                                        <li>
                                            <a href="page-layout-sidebar-right.html">right sidebar</a>
                                        </li>
                                        <li>
                                            <a href="page-layout-sidebar-left.html">left sidebar</a>
                                        </li>

                                        <li>
                                            <a href="page-layout-blank.html">blank page</a>
                                        </li>
                                    </ul>
                                </li>
                                <li>
                                    <a href="landing.html">landing page</a>
                                </li>
                            </ul>
                        </li>
                        <!-- li end -->

                        <!-- Blog Menu-->
                        <li class="has-dropdown">
                            <a href="#" data-toggle="dropdown" class="dropdown-toggle menu-item">Blog</a>
                            <ul class="dropdown-menu">
                                <li>
                                    <a href="blog-carousel.html">blog carousel</a>
                                </li>
                                <li>
                                    <a href="blog-grid.html">blog grid</a>
                                </li>
                                <li>
                                    <a href="blog-standard.html">blog standard</a>
                                </li>
                                <li>
                                    <a href="blog-single.html">blog single</a>
                                </li>
                            </ul>
                        </li>
                        <!-- li end -->

                        <!-- shop Menu -->
                        <li class="has-dropdown">
                            <a href="#" data-toggle="dropdown" class="dropdown-toggle menu-item"
                               data-hover="shop">shop</a>
                            <ul class="dropdown-menu">
                                <li>
                                    <a href="shop-4cols.html">shop 4 columns</a>
                                </li>
                                <li>
                                    <a href="shop-products.html">shop products</a>
                                </li>
                                <li>
                                    <a href="shop-single.html">shop single</a>
                                </li>
                                <li>
                                    <a href="shop-cart.html">shop cart</a>
                                </li>
                            </ul>
                        </li>
                        <!-- li end -->

                        <!-- Elements Menu -->
                        <li class="has-dropdown mega-dropdown">
                            <a href="#" data-toggle="dropdown" class="dropdown-toggle menu-item">elements</a>
                            <ul class="dropdown-menu mega-dropdown-menu">
                                <li>
                                    <div class="container">
                                        <div class="row">
                                            <!-- Column #1 -->
                                            <div class="col-md-3">
                                                <a href="#">interactive elements</a>
                                                <ul>
                                                    <li>
                                                        <a href="elements-testimonials.html"><i
                                                                class="fa fa-quote-right"></i>testimonials</a>
                                                    </li>
                                                    <li>
                                                        <a href="elements-blockquotes.html"><i
                                                                class="fa fa-quote-left"></i>blockquotes</a>
                                                    </li>
                                                    <li>
                                                        <a href="elements-video-buttons.html"><i
                                                                class="fa fa-toggle-right"></i>video buttons</a>
                                                    </li>
                                                    <li>
                                                        <a href="elements-clients.html"><i class="fa fa-user"></i>clients</a>
                                                    </li>
                                                    <li>
                                                        <a href="elements-clients-carousel.html"><i
                                                                class="fa fa-users"></i>clients carousel</a>
                                                    </li>
                                                    <li>
                                                        <a href="elements-daily-specials.html"><i
                                                                class="fa fa-newspaper-o"></i>Daily Specials</a>
                                                    </li>
                                                </ul>
                                            </div>
                                            <!-- .col-md-3 end -->

                                            <!-- Column #2 -->
                                            <div class="col-md-3">
                                                <a href="#">standard elements</a>
                                                <ul>
                                                    <li>
                                                        <a href="elements-accordion.html"><i class="fa fa-server"></i>accordion</a>
                                                    </li>
                                                    <li>
                                                        <a href="elements-cta.html"><i class="fa fa-child"></i>call to
                                                            action</a>
                                                    </li>
                                                    <li>
                                                        <a href="elements-contact-form.html"><i
                                                                class="fa fa-desktop"></i>contact form</a>
                                                    </li>
                                                    <li>
                                                        <a href="elements-team.html"><i class="fa fa-group"></i>team
                                                            variations</a>
                                                    </li>
                                                    <li>
                                                        <a href="elements-tabs.html"><i class="fa fa-ellipsis-h"></i>tabs</a>
                                                    </li>
                                                    <li>
                                                        <a href="elements-reservation.html"><i class="fa fa-laptop"></i>reservation</a>
                                                    </li>
                                                </ul>
                                            </div>
                                            <!-- .col-md-3 end -->

                                            <!-- Column #3 -->
                                            <div class="col-md-3">
                                                <a href="#">infographics elements</a>
                                                <ul>
                                                    <li>
                                                        <a href="elements-counters.html"><i class="fa fa-dashboard"></i>counters</a>
                                                    </li>
                                                    <li>
                                                        <a href="elements-dividers.html"><i
                                                                class="fa fa-dot-circle-o"></i>dividers</a>
                                                    </li>
                                                    <li>
                                                        <a href="elements-pricing.html"><i class="fa fa-exchange"></i>pricing</a>
                                                    </li>
                                                    <li>
                                                        <a href="elements-list.html"><i class="fa fa-list"></i>list</a>
                                                    </li>
                                                    <li>
                                                        <a href="elements-progress-bars.html"><i
                                                                class="fa fa-hourglass-half"></i>progress bars</a>
                                                    </li>
                                                    <li>
                                                        <a href="elements-interactive-banners.html"><i
                                                                class="fa fa-laptop"></i>interactive banners</a>
                                                    </li>
                                                </ul>
                                            </div>
                                            <!-- .col-md-3 end -->

                                            <!-- Column #4 -->
                                            <div class="col-md-3">
                                                <a href="#">typography</a>
                                                <ul>
                                                    <li>
                                                        <a href="elements-buttons.html"><i class="fa fa-suitcase"></i>buttons</a>
                                                    </li>
                                                    <li>
                                                        <a href="elements-heading.html"><i
                                                                class="fa fa-sort-alpha-asc"></i>heading</a>
                                                    </li>
                                                    <li>
                                                        <a href="elements-columns-grids.html"><i class="fa fa-th"></i>columns
                                                            grids</a>
                                                    </li>
                                                    <li>
                                                        <a href="elements-icon-text.html"><i class="fa fa-sliders"></i>icon
                                                            text</a>
                                                    </li>

                                                    <li>
                                                        <a href="elements-typography.html"><i
                                                                class="fa fa-text-height"></i>typography</a>
                                                    </li>
                                                </ul>
                                            </div>
                                            <!-- .col-md-3 end -->
                                        </div>
                                        <!-- .row end -->
                                    </div>
                                    <!-- container end -->
                                </li>
                            </ul>
                            <!-- .mega-dropdown-menu end -->
                        </li>
                    </ul>
                    <!-- Module Reservation  -->
                    <div class="module module-reservation pull-left">
                        <a class="btn-popup btn-popup-theme" data-toggle="modal" data-target="#reservationModule">Book A
                            Table</a>
                        <div class="modal fade reservation-popup" tabindex="-1" role="dialog" id="reservationModule">
                            <div class="modal-dialog modal-lg" role="document">
                                <div class="modal-content">
                                    <div class="modal-body">
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><i
                                                class="fa fa-times"></i></button>
                                        <div class="row reservation reservation-1">
                                            <div class="col-xs-12 col-sm-12 col-md-12">
                                                <div class="reservation-form mb-30 text-center">
                                                    <div class="reservation-bordered">
                                                        <div class="heading heading-1 text-center">
                                                            <p class="heading--subtitle">Reservation</p>
                                                            <h2 class="heading--title">Book Your Table</h2>
                                                            <div class="divider--shape-4"></div>
                                                        </div>
                                                        <div class="reservation--dec">
                                                            You can Book a table online easily in just a couple of
                                                            minutes. We take reservations for lunch and dinner, just
                                                            check the availability of your table & book it now!
                                                        </div>
                                                        <form method="post"
                                                              action="../../../resources/assets/php/reservationpopup.php"
                                                              class="reservationPopupForm mb-0">
                                                            <div class="row">
                                                                <div class="col-xs-12 col-sm-12 col-md-4">
                                                                    <div class="form-select">
                                                                        <i class="fa fa-angle-down"></i>
                                                                        <select class="form-control" name="people"
                                                                                id="numPopup" required>
                                                                            <option value="">Number of people</option>
                                                                            <option value="2">2 People</option>
                                                                            <option value="3">3 People</option>
                                                                            <option value="4">4 People</option>
                                                                            <option value="5">5 People</option>
                                                                            <option value="6">6 People</option>
                                                                            <option value="8">8 People</option>
                                                                            <option value="10">10 People</option>
                                                                        </select>
                                                                    </div>
                                                                </div>
                                                                <div class="col-xs-12 col-sm-12 col-md-4">
                                                                    <div class="form-select">
                                                                        <i class="fa fa-angle-down"></i>
                                                                        <select class="form-control" name="day"
                                                                                id="dayPopup" required>
                                                                            <option value="">Date</option>
                                                                            <option value="november 23">November 23,
                                                                                2018
                                                                            </option>
                                                                            <option value="november 24">November 24,
                                                                                2018
                                                                            </option>
                                                                            <option value="november 25">November 25,
                                                                                2018
                                                                            </option>
                                                                            <option value="november 26">November 26,
                                                                                2018
                                                                            </option>
                                                                            <option value="november 27">November 27,
                                                                                2018
                                                                            </option>
                                                                        </select>
                                                                    </div>
                                                                </div>
                                                                <div class="col-xs-12 col-sm-12 col-md-4">
                                                                    <div class="form-select">
                                                                        <i class="fa fa-angle-down"></i>
                                                                        <select class="form-control" name="time"
                                                                                id="timePopup" required>
                                                                            <option value="">Time</option>
                                                                            <option value="8:00">8:00 PM</option>
                                                                            <option value="9:00">9:00 PM</option>
                                                                            <option value="10:00">10:00 PM</option>
                                                                            <option value="11:00">11:00 PM</option>
                                                                            <option value="12:00">12:00 AM</option>
                                                                        </select>
                                                                    </div>
                                                                </div>
                                                                <div class="col-xs-12 col-sm-12 col-md-12">
                                                                    <button type="submit" id="submit-message"
                                                                            class="btn btn--secondary btn--block">Find
                                                                        Table
                                                                    </button>
                                                                </div>
                                                                <div class="col-xs-12 col-sm-12 col-md-12">
                                                                    <!--Alert Message-->
                                                                    <div class="reservation-result"></div>
                                                                </div>
                                                            </div>
                                                            <!-- .row end -->

                                                        </form>
                                                        <!-- form end -->
                                                    </div>
                                                </div>
                                                <!-- .contact-form end -->
                                            </div>
                                            <!-- .col-md-8 end -->
                                            <div class="col-xs-12 col-sm-12 col-md-12">
                                                <div class="text-uppercase text-center">
                                                    <strong><span class="text-white">Reservation Powered by</span> <a
                                                            href="#">Opentable</a></strong>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- .row end -->
                                    </div>
                                </div>
                                <!-- /.modal-content -->
                            </div>
                            <!-- /.modal-dialog -->
                        </div>
                        <!-- /.modal -->
                    </div>
                    <!-- Module Cart -->
                    <div class="module module-cart pull-left">
                        <div class="module-icon cart-icon">
                            <i class="fa fa-shopping-cart"></i>
                            <span class="title">shop cart</span>
                            <label class="module-label">2</label>
                        </div>
                        <div class="module-content module-box cart-box">
                            <div class="cart-overview">
                                <ul class="list-unstyled">
                                    <li>
                                        <img class="img-responsive"
                                             src="../../../resources/assets/images/shop/thumb/6.jpg" alt="product"/>
                                        <div class="product-meta">
                                            <h5 class="product-title">Red Tape Shoes</h5>
                                            <p class="product-price">1 x $ 34.00</p>
                                        </div>
                                        <a class="cart-cancel" href="#">cancel</a>
                                    </li>
                                    <li>
                                        <img class="img-responsive"
                                             src="../../../resources/assets/images/shop/thumb/7.jpg" alt="product"/>
                                        <div class="product-meta">
                                            <h5 class="product-title">Brave Sweater</h5>
                                            <p class="product-price">1 x $ 32.00</p>
                                        </div>
                                        <a class="cart-cancel" href="#">cancel</a>
                                    </li>
                                </ul>
                            </div>
                            <div class="cart-total">
                                <div class="total-desc">
                                    Subtotal:
                                </div>
                                <div class="total-price">
                                    $73.00
                                </div>
                            </div>
                            <div class="clearfix">
                            </div>
                            <div class="cart--control">
                                <a class="btn btn--primary btn--block btn--rounded mb-10" href="#">view cart</a>
                                <a class="btn btn--white btn--bordered btn--rounded btn--block" href="#">Checkout</a>
                            </div>
                        </div>
                    </div>
                    <!-- .module-cart end -->
                    <!-- Module Search -->
                    <div class="module module-search pull-left">
                        <div class="module-icon search-icon">
                            <i class="fa fa-search"></i>
                            <span class="title">search</span>
                        </div>
                        <div class="module-content module-fullscreen module--search-box">
                            <div class="pos-vertical-center">
                                <div class="container">
                                    <div class="row">
                                        <div class="col-xs-12 col-sm-12 col-md-8 col-md-offset-2">
                                            <form class="form-search">
                                                <input type="text" class="form-control"
                                                       placeholder="Type Search Words Then Enter">
                                                <button class="btn" type="button"><i class="fa fa-search"></i></button>
                                            </form>
                                            <!-- .form-search end -->
                                        </div>
                                        <!-- .col-md-8 end -->
                                    </div>
                                    <!-- .row end -->
                                </div>
                                <!-- .container end -->
                            </div>
                            <a class="module-cancel" href="#"><i class="fa fa-times"></i></a>
                        </div>
                    </div>
                    <!-- .module-search end -->
                    <!-- Module Side NAV -->
                    <div class="module module-side-nav pull-left">
                        <div class="module-icon side-nav-icon">
                            <i class="fa fa-bars"></i>
                            <span class="title">Side Navigation</span>
                        </div>
                        <div class="module-content module-hamburger">
                            <div class="hamburger-panel module-widgets">

                                <!-- Recent Posts
============================================= -->
                                <div class="widget widget-recent-posts">
                                    <div class="widget--title">
                                        <h5>recent posts</h5>
                                    </div>
                                    <div class="widget--content">
                                        <div class="entry">
                                            <img src="../../../resources/assets/images/blog/thumb/1.jpg" alt="title"/>
                                            <div class="entry-desc">
                                                <div class="entry-meta">
                                                    <a href="#">Oct 15, 2017</a>
                                                </div>
                                                <div class="entry-title">
                                                    <a href="#">The Best Side Dishes for Next Dinner</a>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- .recent-entry end -->

                                        <div class="entry">
                                            <img src="../../../resources/assets/images/blog/thumb/2.jpg" alt="title"/>
                                            <div class="entry-desc">
                                                <div class="entry-meta">
                                                    <a href="#">sep 15, 2017</a>
                                                </div>
                                                <div class="entry-title">
                                                    <a href="#">Cornbread Stuffing Apples and Sausage</a>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- .recent-entry end -->

                                    </div>
                                </div>
                                <!-- .widget-recent end -->

                                <!-- Instagram Feed
============================================= -->
                                <div class="widget widget-instagram">
                                    <div class="widget--title">
                                        <h5>Instagram</h5>
                                    </div>
                                    <div class="widget--content">
                                        <div id="instafeedModule" class="instafeed" data-insta-number="8"></div>
                                        <div class="clearfix"></div>
                                    </div>
                                </div>
                                <!-- .widget-instagram end -->

                                <!-- Tag Clouds
============================================= -->
                                <div class="widget widget-tags">
                                    <div class="widget--title">
                                        <h5>tag clouds</h5>
                                    </div>
                                    <div class="widget--content">
                                        <a href="#">responsive</a>
                                        <a href="#">modern</a>
                                        <a href="#">corporate</a>
                                        <a href="#">business</a>
                                        <a href="#">awesome</a>
                                        <a href="#">fresh</a>

                                    </div>
                                </div>
                                <!-- .widget-tags end -->
                                <a class="module-cancel" href="#"><i class="fa fa-times"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /.navbar-collapse -->
            </div>
            <!-- /.container-fluid -->
        </nav>
    </header>
    <section id="slider" class="slider slide-overlay-dark">
        <!-- START REVOLUTION SLIDER 5.0 -->
        <div class="rev_slider_wrapper">
            <div id="slider1" class="rev_slider" data-version="5.0">
                <ul>
                    <!-- slide 1 -->
                    <li data-transition="zoomin"
                        data-slotamount="default"
                        data-easein="Power4.easeInOut"
                        data-easeout="Power4.easeInOut"
                        data-masterspeed="400">
                        <!-- MAIN IMAGE -->
                        <img src="http://via.placeholder.com/1920x1280" alt="Slide Background Image" width="1920"
                             height="1280">
                        <!-- LAYER NR. 1 -->
                        <div class="tp-caption"
                             data-x="center" data-hoffset="0"
                             data-y="center" data-voffset="-130"
                             data-whitespace="nowrap"
                             data-width="none"
                             data-height="none"
                             data-frames='[{"delay":400,"speed":1000,"frame":"0","from":"y:-50px;opacity:0;","to":"o:1;","ease":"Power3.easeInOut"},{"delay":"wait","speed":300,"frame":"999","to":"auto:auto;","ease":"Power3.easeInOut"}]'
                             data-splitin="none"
                             data-splitout="none"
                             data-responsive_offset="on">
                            <div class="slide--subheadline">Welcome To Steak In</div>
                        </div>

                        <!-- LAYER NR. 2 -->
                        <div class="tp-caption"
                             data-x="center" data-hoffset="0"
                             data-y="center" data-voffset="-65"
                             data-whitespace="nowrap"
                             data-width="none"
                             data-height="none"
                             data-frames='[{"delay":400,"speed":1000,"frame":"0","from":"x:-50px;opacity:0;","to":"o:1;","ease":"Power3.easeInOut"},{"delay":"wait","speed":300,"frame":"999","to":"auto:auto;","ease":"Power3.easeInOut"}]'
                             data-splitin="none"
                             data-splitout="none"
                             data-responsive_offset="on">
                            <div class="slide--headline">We Are Food Masters!</div>
                        </div>

                        <!-- LAYER NR. 3 -->
                        <div class="tp-caption"
                             data-x="center" data-hoffset="0"
                             data-y="center" data-voffset="20"
                             data-width="none"
                             data-height="none"
                             data-frames='[{"delay":400,"speed":1000,"frame":"0","from":"y:50px;opacity:0;","to":"o:1;","ease":"Power3.easeInOut"},{"delay":"wait","speed":300,"frame":"999","to":"opacity:0;","ease":"Power3.easeInOut"}]'
                             data-splitin="none"
                             data-splitout="none"
                             data-responsive_offset="on"
                        >
                            <div class="slide--bio text--center">Steak In has the perfect place to enjoy fine food and
                                great cocktails with <br>excellent service, in comfortable atmospheric surroundings.
                            </div>
                        </div>

                        <!-- LAYER NR. 4 -->
                        <div class="tp-caption"
                             data-x="center" data-hoffset="0"
                             data-y="center" data-voffset="100"
                             data-width="none"
                             data-height="none"
                             data-whitespace="nowrap"
                             data-transform_idle="o:1;"
                             data-transform_hover="o:1;rX:0;rY:0;rZ:0;z:0;s:300;e:Power3.easeOut;"
                             data-style_hover="c:rgba(255, 255, 255, 1.00);bc:rgba(255, 255, 255, 1.00);"
                             data-transform_in="y:[100%];z:0;rX:0deg;rY:0;rZ:0;sX:1;sY:1;skX:0;skY:0;opacity:0;s:2000;e:Power4.easeInOut;"
                             data-transform_out="y:[175%];s:1000;e:Power2.easeInOut;s:1000;e:Power2.easeInOut;"
                             data-mask_out="x:inherit;y:inherit;"
                             data-start="1250"
                             data-splitin="none"
                             data-splitout="none"
                             data-frames='[{"delay":400,"speed":1500,"frame":"0","from":"y:bottom;rX:-20deg;rY:-20deg;rZ:0deg;","to":"o:1;","ease":"Power3.easeOut"},{"delay":"wait","speed":300,"frame":"999","to":"auto:auto;","ease":"Power3.easeInOut"}]'
                             data-basealign="slide"
                             data-responsive_offset="on"
                             data-responsive="off">
                            <div class="slide-action">
                                <a class="btn btn--white btn--bordered btn--rounded btn--lg" href="#">Book Your Table
                                    Now</a>
                            </div>
                        </div>
                    </li>

                    <!-- slide 2 -->
                    <li data-transition="slideoverdown"
                        data-slotamount="default"
                        data-easein="Power4.easeInOut"
                        data-easeout="Power4.easeInOut"
                        data-masterspeed="400">
                        <!-- MAIN IMAGE -->
                        <img src="http://via.placeholder.com/1920x1280" alt="Slide Background Image" width="1920"
                             height="1280">
                        <!-- LAYER NR. 1 -->
                        <div class="tp-caption"
                             data-x="center" data-hoffset="0"
                             data-y="center" data-voffset="-130"
                             data-whitespace="nowrap"
                             data-width="none"
                             data-height="none"
                             data-frames='[{"delay":400,"speed":1500,"frame":"0","from":"z:0;rX:0;rY:0;rZ:0;sX:0.9;sY:0.9;skX:0;skY:0;opacity:0;","to":"o:1;","ease":"Power3.easeInOut"},{"delay":"wait","speed":300,"frame":"999","to":"auto:auto;","ease":"Power3.easeInOut"}]'
                             data-splitin="none"
                             data-splitout="none"
                             data-responsive_offset="on">
                            <div class="slide--subheadline">Hello, We Are Granny</div>
                        </div>

                        <!-- LAYER NR. 2 -->
                        <div class="tp-caption"
                             data-x="center" data-hoffset="0"
                             data-y="center" data-voffset="-65"
                             data-whitespace="nowrap"
                             data-width="none"
                             data-height="none"
                             data-frames='[{"delay":400,"speed":1000,"frame":"0","from":"z:0;rX:0deg;rY:0;rZ:0;sX:2;sY:2;skX:0;skY:0;opacity:0;","mask":"x:0px;y:0px;s:inherit;e:inherit;","to":"o:1;","ease":"Power2.easeOut"},{"delay":"wait","speed":300,"frame":"999","to":"auto:auto;","ease":"Power3.easeInOut"}]'
                             data-splitin="none"
                             data-splitout="none"
                             data-responsive_offset="on">
                            <div class="slide--headline extend">We Serve Quality Food</div>
                        </div>

                        <!-- LAYER NR. 3 -->
                        <div class="tp-caption"
                             data-x="center" data-hoffset="0"
                             data-y="center" data-voffset="20"
                             data-width="none"
                             data-height="none"
                             data-frames='[{"delay":400,"speed":300,"frame":"0","from":"y:50px;opacity:0;","to":"o:1;","ease":"Power3.easeInOut"},{"delay":"wait","speed":300,"frame":"999","to":"opacity:0;","ease":"Power3.easeInOut"}]'
                             data-splitin="none"
                             data-splitout="none"
                             data-responsive_offset="on"
                        >
                            <div class="slide--bio text--center">Granny is a restaurant, bar and coffee roastery located
                                on Egypt. We have<br>awesome recipes and the most talented chefs in town!
                            </div>
                        </div>

                        <!-- LAYER NR. 4 -->
                        <div class="tp-caption"
                             data-x="center" data-hoffset="0"
                             data-y="center" data-voffset="100"
                             data-width="none"
                             data-height="none"
                             data-whitespace="nowrap"
                             data-frames='[{"delay":400,"speed":1500,"frame":"0","from":"x:[-100%];z:0;rX:0deg;rY:0;rZ:0;sX:1;sY:1;skX:0;skY:0;","mask":"x:0px;y:0px;s:inherit;e:inherit;","to":"o:1;","ease":"Power3.easeInOut"},{"delay":"wait","speed":300,"frame":"999","to":"auto:auto;","ease":"Power3.easeInOut"}]'
                             data-splitin="none"
                             data-splitout="none"
                             data-actions='[{"event":"click","action":"jumptoslide","slide":"rs-164","delay":""}]'
                             data-basealign="slide"
                             data-responsive_offset="on"
                             data-responsive="off">
                            <div class="slide-action">
                                <a class="btn btn--primary btn--inverse btn--rounded btn--lg" href="#">View Menu</a>
                            </div>
                        </div>
                    </li>

                    <!-- slide 3 -->
                    <li data-transition="zoomout"
                        data-slotamount="default"
                        data-easein="Power4.easeInOut"
                        data-easeout="Power4.easeInOut"
                        data-masterspeed="400">
                        <!-- MAIN IMAGE -->
                        <img src="http://via.placeholder.com/1920x1280" alt="Slide Background Image" width="1920"
                             height="1280">
                        <!-- LAYER NR. 1 -->
                        <div class="tp-caption"
                             data-x="center" data-hoffset="0"
                             data-y="center" data-voffset="-65"
                             data-whitespace="nowrap"
                             data-width="none"
                             data-height="none"
                             data-frames='[{"delay":400,"speed":1500,"frame":"0","from":"x:[-100%];z:0;rX:0deg;rY:0;rZ:0;sX:1;sY:1;skX:0;skY:0;","mask":"x:0px;y:0px;s:inherit;e:inherit;","to":"o:1;","ease":"Power3.easeInOut"},{"delay":"wait","speed":300,"frame":"999","to":"auto:auto;","ease":"Power3.easeInOut"}]'
                             data-splitin="none"
                             data-splitout="none"
                             data-responsive_offset="on">
                            <div class="slide--subheadline">Steak In Offers You</div>
                        </div>

                        <!-- LAYER NR. 2 -->
                        <div class="tp-caption"
                             data-x="center" data-hoffset="0"
                             data-y="center" data-voffset="0"
                             data-whitespace="nowrap"
                             data-width="none"
                             data-height="none"
                             data-frames='[{"delay":400,"speed":1500,"frame":"0","from":"z:0;rX:0;rY:0;rZ:0;sX:0.9;sY:0.9;skX:0;skY:0;opacity:0;","to":"o:1;","ease":"Power3.easeInOut"},{"delay":"wait","speed":300,"frame":"999","to":"auto:auto;","ease":"Power3.easeInOut"}]'
                             data-splitin="none"
                             data-splitout="none"
                             data-responsive_offset="on">
                            <div class="slide--headline">Fresh & Tasty Meals</div>
                        </div>

                        <!-- LAYER NR. 3 -->
                        <div class="tp-caption"
                             data-x="center" data-hoffset="0"
                             data-y="center" data-voffset="100"
                             data-width="none"
                             data-height="none"
                             data-frames='[{"delay":400,"speed":2000,"frame":"0","from":"y:[100%];z:0;rX:0deg;rY:0;rZ:0;sX:1;sY:1;skX:0;skY:0;opacity:0;","mask":"x:0px;y:[100%];s:inherit;e:inherit;","to":"o:1;","ease":"Power2.easeInOut"},{"delay":"wait","speed":300,"frame":"999","to":"auto:auto;","ease":"Power3.easeInOut"}]'
                             data-splitin="none"
                             data-splitout="none"
                             data-responsive_offset="on">
                            <div class="slide--bio text--center">Steak In has the perfect place to enjoy fine food and
                                great cocktails with <br>excellent service, in comfortable atmospheric surroundings.
                            </div>
                        </div>
                    </li>

                </ul>
            </div>
            <!-- END REVOLUTION SLIDER -->
        </div>
        <!-- END OF SLIDER WRAPPER -->
    </section>
</div>
<div style="padding-left: 20px;padding-right: 20px;">
    <h1>Elements</h1>
    <div class="container-fluid">
        <div class="row">
            <h3>Scroll bar element</h3>
        </div>
        <div class="row">
            <div class="col-xs-3">
                <div class="scroll-1" style="height: 100px;overflow: scroll;overflow-x: hidden;">
                    <div style="height: auto;">
                        Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been
                        the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley
                        of type and scrambled it to make a type specimen book. It has survived not only five centuries,
                        but also the leap into electronic typesetting, remaining essentially unchanged. It was
                        popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages,
                        and more recently with desktop publishing software like Aldus PageMaker including versions of
                        Lorem Ipsum.
                    </div>
                </div>
            </div>
            <div class="col-xs-3">
                <div class="scroll-2" style="height: 100px;overflow: scroll;overflow-x: hidden;">
                    <div style="height: auto;">
                        Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been
                        the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley
                        of type and scrambled it to make a type specimen book. It has survived not only five centuries,
                        but also the leap into electronic typesetting, remaining essentially unchanged. It was
                        popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages,
                        and more recently with desktop publishing software like Aldus PageMaker including versions of
                        Lorem Ipsum.
                    </div>
                </div>
            </div>
            <div class="col-xs-3">
                <div class="scroll-3" style="height: 100px;overflow: scroll;overflow-x: hidden;">
                    <div style="height: auto;">
                        Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been
                        the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley
                        of type and scrambled it to make a type specimen book. It has survived not only five centuries,
                        but also the leap into electronic typesetting, remaining essentially unchanged. It was
                        popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages,
                        and more recently with desktop publishing software like Aldus PageMaker including versions of
                        Lorem Ipsum.
                    </div>
                </div>
            </div>
            <div class="col-xs-3">
                <div class="scroll-4" style="height: 100px;overflow: scroll;overflow-x: hidden;">
                    <div style="height: auto;">
                        Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been
                        the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley
                        of type and scrambled it to make a type specimen book. It has survived not only five centuries,
                        but also the leap into electronic typesetting, remaining essentially unchanged. It was
                        popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages,
                        and more recently with desktop publishing software like Aldus PageMaker including versions of
                        Lorem Ipsum.
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <h3>FORM</h3>
        </div>
        <div class="row">
            <div class="col-xs-3">
                <div class="form-select">
                    <i class="fa fa-angle-down"></i>
                    <select class="form-control" name="day" id="day">
                        <option value="">Date</option>
                        <option value="november 23">November 23, 2018</option>
                        <option value="november 24">November 24, 2018</option>
                        <option value="november 25">November 25, 2018</option>
                        <option value="november 26">November 26, 2018</option>
                        <option value="november 27">November 27, 2018</option>
                    </select>
                </div>
            </div>
            <div class="col-xs-3">
                <div class="form-select">
                    <i class="fa fa-angle-down primary"></i>
                    <select class="form-control valid" name="time" id="time" aria-invalid="false">
                        <option value="">Time</option>
                        <option value="8:00">8:00 PM</option>
                        <option value="9:00">9:00 PM</option>
                        <option value="10:00">10:00 PM</option>
                        <option value="11:00">11:00 PM</option>
                        <option value="12:00">12:00 AM</option>
                    </select>
                </div>
            </div>
        </div>
        <div class="row mt-20">
            <div class="col-xs-3">
                <div class="dropdown position-relative">
                    <button class="btn btn-default dropdown-toggle custom-toggle-btn" type="button" id="dropdownMenu2"
                            data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
                        Dropdown
                        <span class="caret"></span>
                    </button>
                    <ul class="dropdown-menu custom" aria-labelledby="dropdownMenu2">
                        <li><a>Action</a></li>
                        <li><a>Another action</a></li>
                        <li><a>Something else here</a></li>
                        <li role="separator" class="divider"></li>
                        <li><a>Separated link</a></li>
                    </ul>
                </div>
            </div>
            <div class="col-xs-3">
                <div class="dropdown position-relative">
                    <button class="btn btn-default dropdown-toggle custom-toggle-btn w-100" type="button"
                            id="dropdownMenu1"
                            data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
                        Dropdown
                        <span class="caret"></span>
                    </button>
                    <ul class="dropdown-menu custom checkbox-menu allow-focus" aria-labelledby="dropdownMenu1">
                        <li>
                            <label class="checkbox-type">
                                <span>Action</span>
                                <div class="checks d-inline"><input class="checkbox" type="checkbox" id="check-1-1">
                                    <label
                                            for="check-1-1"></label></div>
                            </label>
                        </li>
                        <li>
                            <label class="checkbox-type">
                                <span>Cheese</span>
                                <div class="checks d-inline"><input class="checkbox" type="checkbox" id="check-1-2">
                                    <label
                                            for="check-1-2"></label></div>
                            </label>
                        </li>
                        <li>
                            <label class="checkbox-type">
                                <span>Something else here</span>
                                <div class="checks d-inline"><input class="checkbox" type="checkbox" id="check-1-3">
                                    <label
                                            for="check-1-3"></label></div>
                            </label>
                        </li>
                        <li role="separator" class="divider"></li>
                        <li>
                            <label class="checkbox-type">
                                <span>Separated link</span>
                                <div class="checks d-inline"><input class="checkbox" type="checkbox" id="check-1-4">
                                    <label
                                            for="check-1-4"></label></div>
                            </label>
                        </li>
                        <li>
                            <label class="checkbox-type">
                                <span>Separated link</span>
                                <div class="checks d-inline"><input class="checkbox" type="checkbox" id="check-1-5">
                                    <label
                                            for="check-1-4"></label></div>
                            </label>
                        </li>
                        <div class="checks-total">
                        </div>
                    </ul>
                </div>
            </div>
            <div class="col-xs-3">
                <div class="dropdown position-relative">
                    <button class="btn btn-default dropdown-toggle custom-toggle-btn w-100" type="button"
                            id="dropdownMenu0"
                            data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
                        Dropdown
                        <span class="caret"></span>
                    </button>
                    <ul class="dropdown-menu custom checkbox-menu allow-focus" aria-labelledby="dropdownMenu0">
                        <li>
                            <label class="checkbox-type">
                                <span>Action</span>
                                <div class="checks d-inline"><input class="checkbox" type="checkbox" id="check-2-1">
                                    <label
                                            for="check-1-1"></label></div>
                            </label>
                        </li>
                        <li>
                            <label class="checkbox-type">
                                <span>Cheese</span>
                                <div class="checks d-inline"><input class="checkbox" type="checkbox" id="check-2-2">
                                    <label
                                            for="check-1-2"></label></div>
                            </label>
                        </li>
                        <li>
                            <label class="checkbox-type">
                                <span>Something else here</span>
                                <div class="checks d-inline"><input class="checkbox" type="checkbox" id="check-2-3">
                                    <label
                                            for="check-1-3"></label></div>
                            </label>
                        </li>
                        <li role="separator" class="divider"></li>
                        <li>
                            <label class="checkbox-type">
                                <span>Separated link</span>
                                <div class="checks d-inline"><input class="checkbox" type="checkbox" id="check-2-4">
                                    <label
                                            for="check-1-4"></label></div>
                            </label>
                        </li>
                        <li>
                            <label class="checkbox-type">
                                <span>Separated link</span>
                                <div class="checks d-inline"><input class="checkbox" type="checkbox" id="check-2-5">
                                    <label
                                            for="check-1-4"></label></div>
                            </label>
                        </li>
                        <div class="checks-total">
                        </div>
                    </ul>
                </div>
            </div>
        </div>
        <div class="row mt-20">
            <div class="col-xs-3">
                <div class="image-container">
                    <div class="custom-file">
                        <div class="add-gallery-text">
                            <i class="fa fa-file"></i>
                            <span>Drag &amp; Drop or Click</span>
                        </div>
                        <div class="file-input-bg-img"
                             style="background-image: url('../resources/assets/images/background/1.jpg')">
                        </div>
                        <input class="d-none" type="text" name="thumbnail_name"
                               id="thumbnail-name">
                        <input type="file" class="custom-file-input" id="thumbnail-file"
                               name="thumbnail-file">
                    </div>
                </div>
            </div>
            <div class="col-xs-3">
                <div class="image-container">
                    <div class="custom-file">
                        <div class="add-gallery-text">
                            <i class="fa fa-file"></i>
                            <span>Drag &amp; Drop or Click</span>
                        </div>
                        <div class="file-input-bg-img" id="custom-file-background"
                             style="background-image: url('')">
                        </div>
                        <input class="d-none" type="text" name="thumbnail_name" id="custom-file-name">
                        <input type="file" class="custom-file-input" id="custom-file-input"
                               name="thumbnail-file">
                    </div>
                </div>
            </div>
        </div>
        <div class="row mt-20">
            <div class="col-xs-2">
                <input type="text" class="form-control" name="contact-name" id="input-text-1" placeholder="placeholder"
                >
            </div>
            <div class="col-xs-2">
                <input type="text" class="form-control" name="contact-name" id="input-text-2" placeholder="placeholder"
                       value="input value">
            </div>
            <div class="col-xs-2">
                <div class="input-container">
                    <input type="text" class="form-control" name="contact-name" id="input-text-3"
                           placeholder="placeholder"
                           value="input value in button">
                    <a class="btn btn--primary btn--bordered btn--rounded input-container-button" href="#">Button</a>
                </div>
            </div>
            <div class="col-xs-2">
                <div class="input-container">
                    <input type="text" class="form-control" name="contact-name" id="input-text-4"
                           placeholder="placeholder"
                           value="input value in button">
                    <a class="btn btn--primary btn--bordered btn--rounded input-container-button" href="#">확인</a>
                </div>
            </div>
            <div class="col-xs-2">
                <div class="input-container">
                    <input type="password" class="form-control" name="contact-name" id="input-text-5"
                           placeholder="password"
                    >
                    <a class="btn btn--primary btn--bordered btn--rounded input-container-button" href="#">확인</a>
                </div>
            </div>
            <div class="col-xs-2">
                <div class="input-container prepend-container">
                    <span class="prepend-icon"><i class="fa fa-file"></i></span>
                    <input type="text" class="form-control" name="contact-name" id="input-text-6"
                           placeholder="input value in button prepend"
                    >
                    <a class="btn btn--primary btn--bordered btn--rounded input-container-button" href="#">확인</a>
                </div>
            </div>
        </div>
        <div class="row mt-20">
            <div class="col-xs-3">
                <div class="input-container">
                    <input type="text" class="form-control input-border-circle" name="contact-name" id="input-text-7"
                           placeholder="placeholder" value="input value in button border"
                    >
                    <a class="btn btn--primary btn--rounded btn--block input-container-button syncronize-input-button"
                       href="#">구독하기</a>
                </div>
            </div>
            <div class="col-xs-3">
                <div class="input-group search-container">
                    <input type="text" class="form-control" placeholder="Type Your Search Words">
                    <span class="input-group-btn"><button class="btn" type="button"><i
                            class="fa fa-search primary"></i></button></span>
                </div>
            </div>
            <div class="col-xs-3">
                <div class="input-group search-container">
                    <input type="text" class="form-control" placeholder="Type Your Search Words">
                    <span class="input-group-btn"><button class="btn" type="button"><i
                            class="fa fa-search"></i></button></span>
                </div>
            </div>
        </div>
        <div class="row mt-20">
            <div class="col-xs-3">
                <textarea class="form-control autosize" name="contact-message" id="message1" rows="3"
                          placeholder="Message"></textarea>
            </div>
            <div class="col-xs-3">
                <textarea class="form-control autosize fix-height-100" name="contact-message" id="message2" rows="3"
                          placeholder="Message"></textarea>
            </div>
            <div class="col-xs-3">
                <textarea class="form-control autosize fix-height-150" name="contact-message" id="message3" rows="3"
                          placeholder="Message"></textarea>
            </div>
        </div>
        <div class="row">
            <h3>BUTTON</h3>
        </div>
        <div class="row">
            <div class="col-xs-2">
                <a class="btn btn--primary btn--block" href="#">Button</a>
            </div>
            <div class="col-xs-2">
                <a class="btn btn--primary btn--inverse btn-inverse-border" href="#">Button Inverse</a>
            </div>
            <div class="col-xs-2">
                <a class="btn btn--primary btn--rounded btn--block" href="#">read more</a>
            </div>
            <div class="col-xs-2">
                <a class="btn btn--primary btn--bordered btn--rounded" href="#">read more</a>
            </div>
            <div class="col-xs-2">
                <a class="btn btn--primary btn--bordered btn--block" href="#">Button</a>
            </div>
            <div class="col-xs-2">
                <a class="btn btn--primary btn--bordered" href="#">read more</a>
            </div>
        </div>
        <div class="row mt-20">
            <div class="col-xs-2">
                <a class="btn btn--secondary btn--block" href="#">read more</a>
            </div>
            <div class="col-xs-2">
                <a class="btn btn--secondary btn--bordered btn--rounded btn--block" href="#">read more</a>
            </div>
            <div class="col-xs-2">
                <a class="btn btn--primary btn--bordered btn--block" href="#">Button in icon</a>
            </div>
            <div class="col-xs-2">
                <a class="btn btn--primary btn--bordered position-relative w-100" href="#">Button in icon<i
                        class="fa fa-instagram btn-icon"></i></a>
            </div>
            <div class="col-xs-2">
                <a class="btn btn--secondary btn--block" href="#">Button in icon<i class="fa fa-instagram btn-icon"></i></a>
            </div>
            <div class="col-xs-2" style="background-color: #0c5460">
                <a class="btn btn--primary btn--bordered btn-white-theme" href="#">read more</a>
            </div>
        </div>
        <div class="row mt-20">
            <div class="col-xs-3">
                <a class="btn btn--secondary btn--block" href="#">Button in icon Shift<i
                        class="fa fa-instagram btn-icon-shift"></i></a>
            </div>
        </div>
        <div class="row mt-20">
            <div class="col-xs-6">
                <div class="tags-container horizontal">
                    <p class="tag"><span class="text">Hash tags button vertical</span><span class="x-button"></span></p>
                    <p class="tag"><span class="text">Hash tags button vertical</span><span class="x-button"></span></p>
                    <p class="tag"><span class="text">Hash tags button vertical</span><span class="x-button"></span></p>
                </div>
            </div>
            <div class="col-xs-6">
                <%--TODO Custom Javascript 참조 <Body>의 아랫부분 작성--%>
                <input type="text" class="form-control mb-15" id="input-hash" autocomplete="off" maxlength="20"
                       placeholder="Please write text and enter">
                <div class="tags-container horizontal" id="hash-container">
                    <p class="tag"><span class="text">Hash tags button vertical</span><span
                            class="x-button"></span></p>
                    <p class="tag"><span class="text">Hash tags button vertical</span><span
                            class="x-button"></span></p>
                    <p class="tag"><span class="text">Hash tags button vertical</span><span
                            class="x-button"></span></p>
                </div>
            </div>
        </div>
        <div class="row mt-20">
            <div class="col-xs-3">
                <div class="tags-container vertical">
                    <p class="tag"><span class="text">Hash tags button vertical</span><span class="x-button"></span></p>
                    <p class="tag"><span class="text">Hash tags button vertical</span><span class="x-button"></span></p>
                    <p class="tag"><span class="text">Hash tags button vertical</span><span class="x-button"></span></p>
                </div>
            </div>
        </div>
        <div class="row mt-20">
            <h3>Accordion</h3>
        </div>
        <div class="row">
            <div class="col-xs-4">
                <div class="accordion accordion-1" id="accordion01">
                    <!-- Panel 01 -->
                    <div class="panel">
                        <div class="panel--heading">
                            <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion01"
                               href="#collapse01-1" aria-expanded="false">Accordion Item Dashpoint</a>
                        </div>
                        <div id="collapse01-1" class="panel--body panel-collapse collapse p-0" aria-expanded="false"
                             style="height: 42px;">
                            <div style="padding: 16px;">
                                Steak In was the first retaurant to open in Egypt, the resturant was designed with the
                                history in mind we have created a soft industrial dining room, combined with an open
                                kitchen, coffee take out bar and on site coffee roastery. Steak In was the first
                                retaurant to open in Egypt, the resturant was designed with the history in mind we have
                                created a soft industrial dining room, combined with an open kitchen, coffee take out
                                bar and on site coffee roastery.
                            </div>
                        </div>
                    </div>

                    <!-- Panel 02 -->
                    <div class="panel">
                        <div class="panel--heading">
                            <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion01"
                               href="#collapse01-2" aria-expanded="false">Accordion Item Dashpoint</a>
                        </div>
                        <div id="collapse01-2" class="panel--body panel-collapse collapse p-0" aria-expanded="false"
                             style="height: 42px;">
                            <div style="padding: 16px;">
                                Steak In was the first retaurant to open in Egypt, the resturant was designed with the
                                history in mind we have created a soft industrial dining room, combined with an open
                                kitchen, coffee take out bar and on site coffee roastery. Steak In was the first
                                retaurant to open in Egypt, the resturant was designed with the history in mind we have
                                created a soft industrial dining room, combined with an open kitchen, coffee take out
                                bar and on site coffee roastery.
                            </div>
                        </div>
                    </div>

                    <!-- Panel 03 -->
                    <div class="panel">
                        <div class="panel--heading">
                            <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion01"
                               href="#collapse01-3" aria-expanded="false">Accordion Item Dashpoint</a>
                        </div>
                        <div id="collapse01-3" class="panel--body panel-collapse collapse p-0" aria-expanded="false"
                             style="height: 42px;">
                            <div style="padding: 16px;">
                                Steak In was the first retaurant to open in Egypt, the resturant was designed with the
                                history in mind we have created a soft industrial dining room, combined with an open
                                kitchen, coffee take out bar and on site coffee roastery. Steak In was the first
                                retaurant to open in Egypt, the resturant was designed with the history in mind we have
                                created a soft industrial dining room, combined with an open kitchen, coffee take out
                                bar and on site coffee roastery.
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-xs-4">
                <div class="accordion accordion-1" id="accordion02">
                    <!-- Panel 01 -->
                    <div class="panel">
                        <div class="panel--heading p-resize border-none">
                            <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion02"
                               href="#collapse02-1" aria-expanded="false">Accordion Item Border none</a>
                        </div>
                        <div id="collapse02-1" class="panel--body panel-collapse collapse p-0 border-none"
                             aria-expanded="false"
                             style="height: 42px;">
                            <div style="padding: 0 12px 12px 12px;">
                                Steak In was the first retaurant to open in Egypt, the resturant was designed with the
                                history in mind we have created a soft industrial dining room, combined with an open
                                kitchen, coffee take out bar and on site coffee roastery. Steak In was the first
                                retaurant to open in Egypt, the resturant was designed with the history in mind we have
                                created a soft industrial dining room, combined with an open kitchen, coffee take out
                                bar and on site coffee roastery.
                            </div>
                        </div>
                    </div>

                    <!-- Panel 02 -->
                    <div class="panel">
                        <div class="panel--heading p-resize border-none">
                            <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion02"
                               href="#collapse02-2" aria-expanded="false">Accordion Item Border none</a>
                        </div>
                        <div id="collapse02-2" class="panel--body panel-collapse collapse p-0 border-none"
                             aria-expanded="false"
                             style="height: 42px;">
                            <div style="padding: 0 12px 12px 12px;">
                                Steak In was the first retaurant to open in Egypt, the resturant was designed with the
                                history in mind we have created a soft industrial dining room, combined with an open
                                kitchen, coffee take out bar and on site coffee roastery. Steak In was the first
                                retaurant to open in Egypt, the resturant was designed with the history in mind we have
                                created a soft industrial dining room, combined with an open kitchen, coffee take out
                                bar and on site coffee roastery.
                            </div>
                        </div>
                    </div>

                    <!-- Panel 03 -->
                    <div class="panel">
                        <div class="panel--heading p-resize border-none">
                            <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion02"
                               href="#collapse02-3" aria-expanded="false">Accordion Item Border none</a>
                        </div>
                        <div id="collapse02-3" class="panel--body panel-collapse collapse p-0 border-none"
                             aria-expanded="false"
                             style="height: 42px;">
                            <div style="padding: 0 12px 12px 12px;">
                                Steak In was the first retaurant to open in Egypt, the resturant was designed with the
                                history in mind we have created a soft industrial dining room, combined with an open
                                kitchen, coffee take out bar and on site coffee roastery. Steak In was the first
                                retaurant to open in Egypt, the resturant was designed with the history in mind we have
                                created a soft industrial dining room, combined with an open kitchen, coffee take out
                                bar and on site coffee roastery.
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-xs-4">
                <div class="accordion accordion-3" id="accordion03">
                    <!-- Panel 01 -->
                    <div class="panel p-resize">
                        <div class="panel--heading">
                            <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion03"
                               href="#collapse03-1" aria-expanded="true">Who is the owner of Steak In restaurant?</a>
                        </div>
                        <div id="collapse03-1" class="panel--body panel-collapse collapse in p-0" aria-expanded="true"
                             style="">
                            <div style="padding-top: 16px;">
                                Steak In was the first retaurant to open in Egypt, the resturant was designed with the
                                history in mind we have created a soft industrial dining room, combined with an open
                                kitchen, coffee take out bar and on site coffee roastery. Steak In was the first
                                retaurant to open in Egypt, the resturant was designed with the history in mind we have
                                created a soft industrial dining room, combined with an open kitchen, coffee take out
                                bar and on site coffee roastery.
                            </div>
                        </div>
                    </div>

                    <!-- Panel 01 -->
                    <div class="panel p-resize">
                        <div class="panel--heading">
                            <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion03"
                               href="#collapse03-2" aria-expanded="false">When did Steak In restaurant established?</a>
                        </div>
                        <div id="collapse03-2" class="panel--body panel-collapse collapse p-0" aria-expanded="false">
                            <div style="padding-top: 16px;">
                                Steak In was the first retaurant to open in Egypt, the resturant was designed with the
                                history in mind we have created a soft industrial dining room, combined with an open
                                kitchen, coffee take out bar and on site coffee roastery. Steak In was the first
                                retaurant to open in Egypt, the resturant was designed with the history in mind we have
                                created a soft industrial dining room, combined with an open kitchen, coffee take out
                                bar and on site coffee roastery.
                            </div>
                        </div>
                    </div>

                    <!-- Panel 03 -->
                    <div class="panel p-resize">
                        <div class="panel--heading">
                            <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion03"
                               href="#collapse03-3" aria-expanded="false">How many tables in the resturant?</a>
                        </div>
                        <div id="collapse03-3" class="panel--body panel-collapse collapse p-0" aria-expanded="false">
                            <div style="padding-top: 16px;">
                                Steak In was the first retaurant to open in Egypt, the resturant was designed with the
                                history in mind we have created a soft industrial dining room, combined with an open
                                kitchen, coffee take out bar and on site coffee roastery. Steak In was the first
                                retaurant to open in Egypt, the resturant was designed with the history in mind we have
                                created a soft industrial dining room, combined with an open kitchen, coffee take out
                                bar and on site coffee roastery.
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row mt-20">
            <div class="col-xs-4">
                <div class="accordion accordion-3" id="accordion04">
                    <!-- Panel 01 -->
                    <div class="panel p-resize">
                        <div class="panel--heading">
                            <a class="accordion-toggle panel--head--double--t" data-toggle="collapse"
                               data-parent="#accordion03" href="#collapse04-1" aria-expanded="true">Double
                                Elements<span>2021-06-08</span></a>
                        </div>
                        <div id="collapse04-1" class="panel--body panel-collapse collapse in p-0" aria-expanded="true"
                             style="">
                            <div style="padding-top: 16px;">
                                Steak In was the first retaurant to open in Egypt, the resturant was designed with the
                                history in mind we have created a soft industrial dining room, combined with an open
                                kitchen, coffee take out bar and on site coffee roastery. Steak In was the first
                                retaurant to open in Egypt, the resturant was designed with the history in mind we have
                                created a soft industrial dining room, combined with an open kitchen, coffee take out
                                bar and on site coffee roastery.
                            </div>
                        </div>
                    </div>

                    <!-- Panel 01 -->
                    <div class="panel p-resize">
                        <div class="panel--heading">
                            <a class="accordion-toggle collapsed panel--head--triple--t" data-toggle="collapse"
                               data-parent="#accordion03" href="#collapse04-2" aria-expanded="false">Triple
                                Elements<span class="span-button">Answer Complete</span><span>2021-06-08</span></a>
                        </div>
                        <div id="collapse04-2" class="panel--body panel-collapse collapse p-0" aria-expanded="false">
                            <div style="padding-top: 16px;">
                                Steak In was the first retaurant to open in Egypt, the resturant was designed with the
                                history in mind we have created a soft industrial dining room, combined with an open
                                kitchen, coffee take out bar and on site coffee roastery. Steak In was the first
                                retaurant to open in Egypt, the resturant was designed with the history in mind we have
                                created a soft industrial dining room, combined with an open kitchen, coffee take out
                                bar and on site coffee roastery.
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row mt-20">
            <div class="col-xs-4">
                <div class="panel-group" id="custom-accordion" role="tablist" aria-multiselectable="true">
                    <div class="panel panel-default custom-panel-item">
                        <div class="panel-heading custom-panel" role="tab" id="headingOne">
                            <h4 class="panel-title">
                                <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne"
                                   aria-expanded="true" aria-controls="collapseOne">
                                    Collapsible Group Item #1
                                </a>
                                <div style="line-height: 32px;font-size: 12px; color: #222222;">2021-07-26</div>
                                <span class="span-button ml-auto" style="white-space: break-spaces; padding: 3px 8px;">Answer Complete</span>
                            </h4>
                        </div>
                        <div id="collapseOne" class="panel-collapse collapse in" role="tabpanel"
                             aria-labelledby="headingOne">
                            <div class="panel-body">
                                Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad
                                squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck
                                quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it
                                squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica,
                                craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur
                                butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth
                                nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
                            </div>
                        </div>
                    </div>
                    <div class="panel panel-default custom-panel-item">
                        <div class="panel-heading custom-panel" role="tab" id="headingTwo">
                            <h4 class="panel-title">
                                <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion"
                                   href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                                    Collapsible Group Item #2
                                </a>
                                <div style="line-height: 32px;font-size: 12px; color: #222222;">2021-07-26</div>
                            </h4>
                        </div>
                        <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel"
                             aria-labelledby="headingTwo">
                            <div class="panel-body">
                                Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad
                                squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck
                                quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it
                                squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica,
                                craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur
                                butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth
                                nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
                            </div>
                        </div>
                    </div>
                    <div class="panel panel-default custom-panel-item">
                        <div class="panel-heading custom-panel" role="tab" id="headingThree">
                            <h4 class="panel-title">
                                <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion"
                                   href="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                                    Collapsible Group Item #3
                                </a>
                                <div style="line-height: 32px;font-size: 12px; color: #222222;">2021-07-26</div>
                                <span class="span-button ml-auto" style="white-space: break-spaces; padding: 3px 8px;">Answer Complete</span>
                            </h4>
                        </div>
                        <div id="collapseThree" class="panel-collapse collapse" role="tabpanel"
                             aria-labelledby="headingThree">
                            <div class="panel-body">
                                <h6>Question</h6>
                                Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad
                                squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck
                                quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it
                                squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica,
                                craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur
                                butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth
                                nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
                            </div>
                            <div class="panel-body">
                                <h6>Answer</h6>
                                Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad
                                squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck
                                quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it
                                squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica,
                                craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur
                                butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth
                                nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row mt-20">
            <h3>Category</h3>
        </div>
        <div class="row mt-20">
            <div class="col-xs-3">
                <div class="widget widget-tags" id="tag-clouds">
                    <div class="widget--title">
                        <h5>tag clouds</h5>
                    </div>
                    <div class="widget--content">
                        <a href="#tag-clouds">responsive</a>
                        <a href="#tag-clouds">modern</a>
                        <a href="#tag-clouds">corporate</a>
                        <a href="#tag-clouds">business</a>
                        <a href="#tag-clouds">fresh</a>
                        <a href="#tag-clouds">awesome</a>
                        <a href="#tag-clouds">business</a>
                        <a href="#tag-clouds">fresh</a>
                        <a href="#tag-clouds">corporate</a>
                    </div>
                </div>
            </div>
            <div class="col-xs-3">
                <div class="widget widget-tags" id="tag-clouds1">
                    <div class="widget--title">
                        <h5>tag clouds</h5>
                    </div>
                    <div class="widget--content">
                        <a href="#tag-clouds1" class="active">responsive</a>
                        <a href="#tag-clouds1">modern</a>
                        <a href="#tag-clouds1">corporate</a>
                        <a href="#tag-clouds1">business</a>
                        <a href="#tag-clouds1">fresh</a>
                        <a href="#tag-clouds1">awesome</a>
                        <a href="#tag-clouds1">business</a>
                        <a href="#tag-clouds1">fresh</a>
                        <a href="#tag-clouds1">corporate</a>
                    </div>
                </div>
            </div>
            <div class="col-xs-3">
                <div class="widget widget-tags" id="tag-clouds2">
                    <div class="widget--title">
                        <h5>tag clouds bordered</h5>
                    </div>
                    <div class="widget--content active-border">
                        <a href="#tag-clouds2">responsive</a>
                        <a href="#tag-clouds2">modern</a>
                        <a href="#tag-clouds2">corporate</a>
                        <a href="#tag-clouds2">business</a>
                        <a href="#tag-clouds2">fresh</a>
                        <a href="#tag-clouds2">awesome</a>
                        <a href="#tag-clouds2">business</a>
                        <a href="#tag-clouds2">fresh</a>
                        <a href="#tag-clouds2">corporate</a>
                    </div>
                </div>
            </div>
            <div class="col-xs-3">
                <div class="widget widget-tags" id="tag-clouds3">
                    <div class="widget--title">
                        <h5>tag clouds bordered</h5>
                    </div>
                    <div class="widget--content active-border">
                        <a href="#tag-clouds3" class="active">responsive</a>
                        <a href="#tag-clouds3" class="active">modern</a>
                        <a href="#tag-clouds3">corporate</a>
                        <a href="#tag-clouds3">business</a>
                        <a href="#tag-clouds3">fresh</a>
                        <a href="#tag-clouds3">awesome</a>
                        <a href="#tag-clouds3">business</a>
                        <a href="#tag-clouds3">fresh</a>
                        <a href="#tag-clouds3">corporate</a>
                    </div>
                </div>
            </div>
        </div>
        <div class="row mt-20">
            <h3>Card Item</h3>
        </div>
        <div class="row mt-20">
            <div class="col-xs-3">
                <div class="owl-item" style="width: 100%;">
                    <div class="blog-entry">
                        <div class="entry--content">
                            <div class="entry--img">
                                <a href="#">
                                    <img src="../../../resources/assets/images/blog/grid/5.jpg" alt="entry image">
                                </a>
                                <div class="entry--body">
                                    <div class="oneline">
                                        <span>합정역</span>
                                        <span>&nbsp;/&nbsp;</span>
                                        <a href="#">#베이커리 맛집</a>
                                        <a href="#">#베이커리 맛집</a>
                                        <a href="#">#베이커리 맛집</a>
                                        <a href="#">#베이커리 맛집</a>
                                    </div>
                                    <div class="twoline">
                                        <h5>인디로스터 김우식</h5>
                                    </div>
                                </div>
                            </div>
                            <div class="entry--bio">
                                Cook sausage for 5 to 7 minutes until browned. Add onions and celery and saute until
                                softened. Add salt and pepper, to taste. Mix in apples, thyme
                                Cook sausage for 5 to 7 minutes until browned. Add onions and celery and saute until
                                softened. Add salt and pepper, to taste. Mix in apples, thyme
                            </div>
                        </div>
                        <!-- .entry-content end -->
                    </div>
                </div>
            </div>
            <div class="col-xs-3">
                <div class="owl-item" style="width: 100%;">
                    <div class="blog-entry">
                        <div class="entry--content beans-type">
                            <div class="entry--img">
                                <a href="#">
                                    <img src="../../../resources/assets/images/blog/grid/5.jpg" alt="entry image">
                                </a>
                                <div class="entry--body">
                                    <div class="oneline">
                                        케냐 기티투 AB 싱글빈 케냐 기티투 AB 싱글빈
                                    </div>
                                    <div class="pricing">
                                        <span class="origin">25,000원</span>
                                        <span class="sales">21,400원</span>
                                    </div>
                                </div>
                            </div>
                            <div class="entry--bio">
                                Cook sausage for 5 to 7 minutes until browned. Add onions and celery and saute until
                                softened. Add salt and pepper, to taste. Mix in apples, thyme
                            </div>
                        </div>
                        <!-- .entry-content end -->
                    </div>
                </div>
            </div>
            <div class="col-xs-3">
                <div class="owl-item" style="width: 100%;">
                    <div class="blog-entry">
                        <div class="entry--content beans-type">
                            <div class="entry--img">
                                <a href="#">
                                    <img src="../../../resources/assets/images/blog/grid/5.jpg" alt="entry image">
                                </a>
                                <div class="entry--body">
                                    <div class="oneline">
                                        케냐 기티투 AB 싱글빈 케냐 기티투 AB 싱글빈
                                    </div>
                                    <div class="pricing">
                                        <span class="sales">25,000원</span>
                                    </div>
                                </div>
                            </div>
                            <div class="entry--bio">
                                Cook sausage for 5 to 7 minutes until browned. Add onions and celery and saute until
                                softened. Add salt and pepper, to taste. Mix in apples, thyme
                            </div>
                        </div>
                        <!-- .entry-content end -->
                    </div>
                </div>
            </div>
            <div class="col-xs-3">
                <div class="owl-item" style="width: 100%;">
                    <div class="blog-entry">
                        <div class="entry--content beans-type">
                            <div class="entry--img">
                                <a href="#">
                                    <img src="../../../resources/assets/images/blog/grid/5.jpg" alt="entry image">
                                </a>
                                <div class="entry--body">
                                    <div class="oneline">
                                        케냐 기티투 AB 싱글빈 케냐 기티투 AB 싱글빈
                                    </div>
                                    <div class="pricing">
                                        <span class="sales">25,000원</span>
                                    </div>
                                </div>
                                <div class="sales-indication">
                                    40% 할인
                                </div>
                            </div>
                            <div class="entry--bio">
                                Cook sausage for 5 to 7 minutes until browned. Add onions and celery and saute until
                                softened. Add salt and pepper, to taste. Mix in apples, thyme
                            </div>
                        </div>
                        <!-- .entry-content end -->
                    </div>
                </div>
            </div>
        </div>
        <div class="row mt-20">
            <div class="col-xs-3">
                <div class="owl-item" style="width: 100%;">
                    <div class="blog-entry">
                        <div class="entry--content product-type">
                            <div class="entry--img mb-0">
                                <a href="#">
                                    <img src="../../../resources/assets/images/blog/grid/5.jpg" alt="entry image">
                                </a>
                                <div class="sales-indication">
                                    40% 할인
                                </div>
                                <div class="product-overlay">
                                    <div class="overlay-icon-layout">
                                        <div class="overlay-container">
                                            <div class="overlay-item">
                                                <img src="http://via.placeholder.com/36x36"/>
                                                <span>Event</span>
                                            </div>
                                            <div class="overlay-item">
                                                <img src="http://via.placeholder.com/36x36"/>
                                                <span>Event</span>
                                            </div>
                                            <div class="overlay-item">
                                                <img src="http://via.placeholder.com/36x36"/>
                                                <span>Event</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="entry--body">
                                <div class="oneline">
                                    <span>판매자</span>
                                    <span>&nbsp;/&nbsp;</span>
                                    <a href="#">Starbucks Coffee</a>
                                </div>
                                <div class="twoline">
                                    <h5>Starbucks Espresso Machine</h5>
                                </div>
                                <div class="pricing">
                                    <span class="origin">25,000원</span>
                                    <span class="sales">25,000원</span>
                                    <span class="date">
                                        2021-06-09
                                    </span>
                                </div>
                            </div>
                            <div class="entry--bio">
                                Cook sausage for 5 to 7 minutes until browned. Add onions and celery and saute until
                                softened. Add salt and pepper, to taste. Mix in apples, thyme
                                Cook sausage for 5 to 7 minutes until browned. Add onions and celery and saute until
                                softened. Add salt and pepper, to taste. Mix in apples, thyme
                            </div>
                        </div>
                        <!-- .entry-content end -->
                    </div>
                </div>
            </div>
            <div class="col-xs-3">
                <div class="owl-item" style="width: 100%;">
                    <div class="blog-entry">
                        <div class="entry--content text-center">
                            <div class="entry--img">
                                <a href="#">
                                    <img src="../../../resources/assets/images/blog/grid/5.jpg" alt="entry image">
                                </a>
                                <div class="point-icon">
                                    <img src="http://via.placeholder.com/24x24"/>
                                </div>
                            </div>
                            <h4>Customizing</h4>
                            <div class="entry--bio no-ellipsis first-child">
                                Cook sausage for 5 to 7 minutes until browned. Add onions and celery and saute until
                                softened. Add salt and pepper, to taste. Mix in apples, thyme
                                Cook sausage for 5 to 7 minutes until browned. Add onions and celery and saute until
                                softened. Add salt and pepper, to taste. Mix in apples, thyme
                            </div>
                            <div class="entry--bio no-ellipsis mt-10">
                                Find your own coffee easily from the TOP Indie-Roasters in Korea.
                            </div>
                        </div>
                        <!-- .entry-content end -->
                    </div>
                </div>
            </div>
        </div>
        <div class="row mt-20">
            <div class="col-xs-6">
                <div class="carousel carousel-dots" data-slide="3" data-slide-rs="2" data-autoplay="true"
                     data-nav="false" data-dots="true" data-space="0" data-loop="true" data-speed="800">
                    <div class="owl-item" style="width: 100%;">
                        <div class="blog-entry">
                            <div class="entry--content product-type">
                                <div class="entry--img mb-0">
                                    <a href="#">
                                        <img src="../../../resources/assets/images/blog/grid/5.jpg" alt="entry image">
                                    </a>
                                    <div class="sales-indication">
                                        40% 할인
                                    </div>
                                    <div class="product-overlay">
                                        <div class="overlay-icon-layout">
                                            <div class="overlay-container">
                                                <div class="overlay-item">
                                                    <img src="http://via.placeholder.com/36x36"/>
                                                    <span>Event</span>
                                                </div>
                                                <div class="overlay-item">
                                                    <img src="http://via.placeholder.com/36x36"/>
                                                    <span>Event</span>
                                                </div>
                                                <div class="overlay-item">
                                                    <img src="http://via.placeholder.com/36x36"/>
                                                    <span>Event</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="entry--body">
                                    <div class="oneline">
                                        <span>판매자</span>
                                        <span>&nbsp;/&nbsp;</span>
                                        <a href="#">Starbucks Coffee</a>
                                    </div>
                                    <div class="twoline">
                                        <h5>Starbucks Espresso Machine</h5>
                                    </div>
                                    <div class="pricing">
                                        <span class="origin">25,000원</span>
                                        <span class="sales">25,000원</span>
                                        <span class="date">
                                        2021-06-09
                                    </span>
                                    </div>
                                </div>
                                <div class="entry--bio">
                                    Cook sausage for 5 to 7 minutes until browned. Add onions and celery and saute until
                                    softened. Add salt and pepper, to taste. Mix in apples, thyme
                                    Cook sausage for 5 to 7 minutes until browned. Add onions and celery and saute until
                                    softened. Add salt and pepper, to taste. Mix in apples, thyme
                                </div>
                            </div>
                            <!-- .entry-content end -->
                        </div>
                    </div>
                    <div class="owl-item" style="width: 100%;">
                        <div class="blog-entry">
                            <div class="entry--content product-type">
                                <div class="entry--img mb-0">
                                    <a href="#">
                                        <img src="../../../resources/assets/images/blog/grid/5.jpg" alt="entry image">
                                    </a>
                                    <div class="sales-indication">
                                        40% 할인
                                    </div>
                                    <div class="product-overlay">
                                        <div class="overlay-icon-layout">
                                            <div class="overlay-container">
                                                <div class="overlay-item">
                                                    <img src="http://via.placeholder.com/36x36"/>
                                                    <span>Event</span>
                                                </div>
                                                <div class="overlay-item">
                                                    <img src="http://via.placeholder.com/36x36"/>
                                                    <span>Event</span>
                                                </div>
                                                <div class="overlay-item">
                                                    <img src="http://via.placeholder.com/36x36"/>
                                                    <span>Event</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="entry--body">
                                    <div class="oneline">
                                        <span>판매자</span>
                                        <span>&nbsp;/&nbsp;</span>
                                        <a href="#">Starbucks Coffee</a>
                                    </div>
                                    <div class="twoline">
                                        <h5>Starbucks Espresso Machine</h5>
                                    </div>
                                    <div class="pricing">
                                        <span class="origin">25,000원</span>
                                        <span class="sales">25,000원</span>
                                        <span class="date">
                                        2021-06-09
                                    </span>
                                    </div>
                                </div>
                                <div class="entry--bio">
                                    Cook sausage for 5 to 7 minutes until browned. Add onions and celery and saute until
                                    softened. Add salt and pepper, to taste. Mix in apples, thyme
                                    Cook sausage for 5 to 7 minutes until browned. Add onions and celery and saute until
                                    softened. Add salt and pepper, to taste. Mix in apples, thyme
                                </div>
                            </div>
                            <!-- .entry-content end -->
                        </div>
                    </div>
                    <div class="owl-item" style="width: 100%;">
                        <div class="blog-entry">
                            <div class="entry--content product-type">
                                <div class="entry--img mb-0">
                                    <a href="#">
                                        <img src="../../../resources/assets/images/blog/grid/5.jpg" alt="entry image">
                                    </a>
                                    <div class="sales-indication">
                                        40% 할인
                                    </div>
                                    <div class="product-overlay">
                                        <div class="overlay-icon-layout">
                                            <div class="overlay-container">
                                                <div class="overlay-item">
                                                    <img src="http://via.placeholder.com/36x36"/>
                                                    <span>Event</span>
                                                </div>
                                                <div class="overlay-item">
                                                    <img src="http://via.placeholder.com/36x36"/>
                                                    <span>Event</span>
                                                </div>
                                                <div class="overlay-item">
                                                    <img src="http://via.placeholder.com/36x36"/>
                                                    <span>Event</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="entry--body">
                                    <div class="oneline">
                                        <span>판매자</span>
                                        <span>&nbsp;/&nbsp;</span>
                                        <a href="#">Starbucks Coffee</a>
                                    </div>
                                    <div class="twoline">
                                        <h5>Starbucks Espresso Machine</h5>
                                    </div>
                                    <div class="pricing">
                                        <span class="origin">25,000원</span>
                                        <span class="sales">25,000원</span>
                                        <span class="date">
                                        2021-06-09
                                    </span>
                                    </div>
                                </div>
                                <div class="entry--bio">
                                    Cook sausage for 5 to 7 minutes until browned. Add onions and celery and saute until
                                    softened. Add salt and pepper, to taste. Mix in apples, thyme
                                    Cook sausage for 5 to 7 minutes until browned. Add onions and celery and saute until
                                    softened. Add salt and pepper, to taste. Mix in apples, thyme
                                </div>
                            </div>
                            <!-- .entry-content end -->
                        </div>
                    </div>
                    <div class="owl-item" style="width: 100%;">
                        <div class="blog-entry">
                            <div class="entry--content product-type">
                                <div class="entry--img mb-0">
                                    <a href="#">
                                        <img src="../../../resources/assets/images/blog/grid/5.jpg" alt="entry image">
                                    </a>
                                    <div class="sales-indication">
                                        40% 할인
                                    </div>
                                    <div class="product-overlay">
                                        <div class="overlay-icon-layout">
                                            <div class="overlay-container">
                                                <div class="overlay-item">
                                                    <img src="http://via.placeholder.com/36x36"/>
                                                    <span>Event</span>
                                                </div>
                                                <div class="overlay-item">
                                                    <img src="http://via.placeholder.com/36x36"/>
                                                    <span>Event</span>
                                                </div>
                                                <div class="overlay-item">
                                                    <img src="http://via.placeholder.com/36x36"/>
                                                    <span>Event</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="entry--body">
                                    <div class="oneline">
                                        <span>판매자</span>
                                        <span>&nbsp;/&nbsp;</span>
                                        <a href="#">Starbucks Coffee</a>
                                    </div>
                                    <div class="twoline">
                                        <h5>Starbucks Espresso Machine</h5>
                                    </div>
                                    <div class="pricing">
                                        <span class="origin">25,000원</span>
                                        <span class="sales">25,000원</span>
                                        <span class="date">
                                        2021-06-09
                                    </span>
                                    </div>
                                </div>
                                <div class="entry--bio">
                                    Cook sausage for 5 to 7 minutes until browned. Add onions and celery and saute until
                                    softened. Add salt and pepper, to taste. Mix in apples, thyme
                                    Cook sausage for 5 to 7 minutes until browned. Add onions and celery and saute until
                                    softened. Add salt and pepper, to taste. Mix in apples, thyme
                                </div>
                            </div>
                            <!-- .entry-content end -->
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-xs-6">
                <div class="carousel carousel-dots" data-slide="3" data-slide-rs="2" data-autoplay="true"
                     data-nav="false" data-dots="true" data-space="0" data-loop="true" data-speed="800">
                    <div class="owl-item" style="width: 100%;">
                        <div class="blog-entry">
                            <div class="entry--content">
                                <div class="entry--img">
                                    <a href="#">
                                        <img src="../../../resources/assets/images/blog/grid/5.jpg" alt="entry image">
                                    </a>
                                    <div class="entry--body">
                                        <div class="oneline">
                                            <span>합정역</span>
                                            <span>&nbsp;/&nbsp;</span>
                                            <a href="#">#베이커리 맛집</a>
                                            <a href="#">#베이커리 맛집</a>
                                            <a href="#">#베이커리 맛집</a>
                                            <a href="#">#베이커리 맛집</a>
                                        </div>
                                        <div class="twoline">
                                            <h5>인디로스터 김우식</h5>
                                        </div>
                                    </div>
                                </div>
                                <div class="entry--bio">
                                    Cook sausage for 5 to 7 minutes until browned. Add onions and celery and saute until
                                    softened. Add salt and pepper, to taste. Mix in apples, thyme
                                    Cook sausage for 5 to 7 minutes until browned. Add onions and celery and saute until
                                    softened. Add salt and pepper, to taste. Mix in apples, thyme
                                </div>
                            </div>
                            <!-- .entry-content end -->
                        </div>
                    </div>
                    <div class="owl-item" style="width: 100%;">
                        <div class="blog-entry">
                            <div class="entry--content">
                                <div class="entry--img">
                                    <a href="#">
                                        <img src="../../../resources/assets/images/blog/grid/5.jpg" alt="entry image">
                                    </a>
                                    <div class="entry--body">
                                        <div class="oneline">
                                            <span>합정역</span>
                                            <span>&nbsp;/&nbsp;</span>
                                            <a href="#">#베이커리 맛집</a>
                                            <a href="#">#베이커리 맛집</a>
                                            <a href="#">#베이커리 맛집</a>
                                            <a href="#">#베이커리 맛집</a>
                                        </div>
                                        <div class="twoline">
                                            <h5>인디로스터 김우식</h5>
                                        </div>
                                    </div>
                                </div>
                                <div class="entry--bio">
                                    Cook sausage for 5 to 7 minutes until browned. Add onions and celery and saute until
                                    softened. Add salt and pepper, to taste. Mix in apples, thyme
                                    Cook sausage for 5 to 7 minutes until browned. Add onions and celery and saute until
                                    softened. Add salt and pepper, to taste. Mix in apples, thyme
                                </div>
                            </div>
                            <!-- .entry-content end -->
                        </div>
                    </div>
                    <div class="owl-item" style="width: 100%;">
                        <div class="blog-entry">
                            <div class="entry--content">
                                <div class="entry--img">
                                    <a href="#">
                                        <img src="../../../resources/assets/images/blog/grid/5.jpg" alt="entry image">
                                    </a>
                                    <div class="entry--body">
                                        <div class="oneline">
                                            <span>합정역</span>
                                            <span>&nbsp;/&nbsp;</span>
                                            <a href="#">#베이커리 맛집</a>
                                            <a href="#">#베이커리 맛집</a>
                                            <a href="#">#베이커리 맛집</a>
                                            <a href="#">#베이커리 맛집</a>
                                        </div>
                                        <div class="twoline">
                                            <h5>인디로스터 김우식</h5>
                                        </div>
                                    </div>
                                </div>
                                <div class="entry--bio">
                                    Cook sausage for 5 to 7 minutes until browned. Add onions and celery and saute until
                                    softened. Add salt and pepper, to taste. Mix in apples, thyme
                                    Cook sausage for 5 to 7 minutes until browned. Add onions and celery and saute until
                                    softened. Add salt and pepper, to taste. Mix in apples, thyme
                                </div>
                            </div>
                            <!-- .entry-content end -->
                        </div>
                    </div>
                    <div class="owl-item" style="width: 100%;">
                        <div class="blog-entry">
                            <div class="entry--content">
                                <div class="entry--img">
                                    <a href="#">
                                        <img src="../../../resources/assets/images/blog/grid/5.jpg" alt="entry image">
                                    </a>
                                    <div class="entry--body">
                                        <div class="oneline">
                                            <span>합정역</span>
                                            <span>&nbsp;/&nbsp;</span>
                                            <a href="#">#베이커리 맛집</a>
                                            <a href="#">#베이커리 맛집</a>
                                            <a href="#">#베이커리 맛집</a>
                                            <a href="#">#베이커리 맛집</a>
                                        </div>
                                        <div class="twoline">
                                            <h5>인디로스터 김우식</h5>
                                        </div>
                                    </div>
                                </div>
                                <div class="entry--bio">
                                    Cook sausage for 5 to 7 minutes until browned. Add onions and celery and saute until
                                    softened. Add salt and pepper, to taste. Mix in apples, thyme
                                    Cook sausage for 5 to 7 minutes until browned. Add onions and celery and saute until
                                    softened. Add salt and pepper, to taste. Mix in apples, thyme
                                </div>
                            </div>
                            <!-- .entry-content end -->
                        </div>
                    </div>
                    <div class="owl-item" style="width: 100%;">
                        <div class="blog-entry">
                            <div class="entry--content">
                                <div class="entry--img">
                                    <a href="#">
                                        <img src="../../../resources/assets/images/blog/grid/5.jpg" alt="entry image">
                                    </a>
                                    <div class="entry--body">
                                        <div class="oneline">
                                            <span>합정역</span>
                                            <span>&nbsp;/&nbsp;</span>
                                            <a href="#">#베이커리 맛집</a>
                                            <a href="#">#베이커리 맛집</a>
                                            <a href="#">#베이커리 맛집</a>
                                            <a href="#">#베이커리 맛집</a>
                                        </div>
                                        <div class="twoline">
                                            <h5>인디로스터 김우식</h5>
                                        </div>
                                    </div>
                                </div>
                                <div class="entry--bio">
                                    Cook sausage for 5 to 7 minutes until browned. Add onions and celery and saute until
                                    softened. Add salt and pepper, to taste. Mix in apples, thyme
                                    Cook sausage for 5 to 7 minutes until browned. Add onions and celery and saute until
                                    softened. Add salt and pepper, to taste. Mix in apples, thyme
                                </div>
                            </div>
                            <!-- .entry-content end -->
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row mt-20">
            <h3>Similarity Card Item</h3>
        </div>
        <div class="row mt-20">
            <div class="col-xs-3">
                <div class="r-card-container">
                    <h5>I rarely have access to coffee.</h5>
                    <h6>I come across coffee occasionally, but I often drink it without knowing it.</h6>
                </div>
            </div>
            <div class="col-xs-3">
                <div class="r-card-container active">
                    <h5>I rarely have access to coffee.</h5>
                    <h6>I come across coffee occasionally, but I often drink it without knowing it.</h6>
                </div>
            </div>
            <div class="col-xs-3">
                <div class="r-card-container">
                    <div class="add-icon-container">
                        <h6>Coffee Maker (Machine)</h6>
                        <img src="http://via.placeholder.com/70x80"/>
                    </div>
                </div>
            </div>
            <div class="col-xs-3">
                <div class="r-card-container active">
                    <div class="add-icon-container">
                        <h6>Coffee Maker (Machine)</h6>
                        <img src="http://via.placeholder.com/70x80"/>
                    </div>
                </div>
            </div>
        </div>
        <div class="row mt-20">
            <div class="col-xs-3">
                <div class="r-card-container">
                    <div class="add-icon-container only-text">
                        <h6>Coffee Maker (Machine)</h6>
                    </div>
                </div>
            </div>
            <div class="col-xs-3">
                <div class="r-card-container active">
                    <div class="add-icon-container only-text">
                        <h6>Coffee Maker (Machine)</h6>
                    </div>
                </div>
            </div>
            <div class="col-xs-3">
                <div class="r-card-container side-widget">
                    <h6>I rarely have access to coffee.</h6>
                    <span>I come across coffee occasionally, but I often drink it without knowing it.</span>
                </div>
            </div>
            <div class="col-xs-3">
                <div class="r-card-container side-widget" id="item_link">
                    <h6>I rarely have access to coffee. link</h6>
                    <a href="#item_link">I come across coffee occasionally, but I often drink it without knowing it.</a>
                </div>
            </div>
        </div>
        <div class="row mt-20">
            <div class="col-xs-3">
                <div class="r-card-container side-widget" id="icon_link">
                    <h6>I rarely have access to coffee. icon</h6>
                    <a class="icon" href="#icon_link"><img src="http://via.placeholder.com/24x24"/></a>
                    <a class="icon" href="#icon_link"><img src="http://via.placeholder.com/24x24"/></a>
                    <a class="icon" href="#icon_link"><img src="http://via.placeholder.com/24x24"/></a>
                    <a class="icon" href="#icon_link"><img src="http://via.placeholder.com/24x24"/></a>
                </div>
            </div>
            <div class="col-xs-3">
                <div class="r-card-container side-widget" id="icon_link_1">
                    <h6>I rarely have access to coffee. icon rectangle</h6>
                    <a class="icon-other" href="#icon_link_1"><img src="http://via.placeholder.com/24x24"/></a>
                    <a class="icon-other" href="#icon_link_1"><img src="http://via.placeholder.com/24x24"/></a>
                    <a class="icon-other" href="#icon_link_1"><img src="http://via.placeholder.com/24x24"/></a>
                    <a class="icon-other" href="#icon_link_1"><img src="http://via.placeholder.com/24x24"/></a>
                </div>
            </div>
        </div>
        <div class="row mt-20">
            <h3>Progress bar</h3>
        </div>
        <div class="row mt-20">
            <div class="col-xs-3" style="height: 65px;">
                <div class="progress-container">
                    <div class="progress">
                        <div class="percent"></div>
                    </div>
                    <div class="steps">
                        <div class="step" id="0"></div>
                        <div class="step" id="1"></div>
                        <div class="step" id="2"></div>
                        <div class="step" id="3"></div>
                    </div>
                </div>
            </div>
            <div class="col-xs-3">
                <div class="progress-container-type-2">
                    <section>
                        <ol class="progressbar">
                            <li class="is-complete"><span>Objective &amp; Template</span></li>
                            <li class="is-complete"><span>Options</span></li>
                            <li class="is-active"><span>Launch Date</span></li>
                            <li><span>Step</span></li>
                            <li><span>Step</span></li>
                            <li><span>Agreement</span></li>
                        </ol>
                    </section>
                </div>
            </div>
            <div class="col-xs-3 mt-20">
                <div class="progress">
                    <div class="progress-bar progress-bar-success progress-bar-striped" role="progressbar"
                         aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: 40%">
                        <span class="sr-only">40% Complete (success)</span>
                    </div>
                </div>
            </div>
            <div class="col-xs-3 mt-20">
                <div class="progress">
                    <div class="progress-bar progress-bar-success progress-bar-striped active" role="progressbar"
                         aria-valuenow="45" aria-valuemin="0" aria-valuemax="100" style="width: 45%">
                        <span class="sr-only">45% Complete</span>
                    </div>
                </div>
            </div>
        </div>
        <div class="row mt-20">
            <h3>Comment</h3>
        </div>
        <div class="row mt-20">
            <div class="col-xs-4">
                <ul class="comments-list">
                    <li class="comment-body">
                        <div class="avatar">
                            <img src="../../../resources/assets/images/team/thumb/2.jpg" alt="avatar">
                        </div>
                        <div class="comment" id="comment-1">
                            <h6>Anthony Hunter</h6>
                            <div class="date">Jan 28, 2017 - 08:07 pm</div>
                            <p>The example about the mattress sizing page you mentioned in the last WBF can be a perfect
                                example of new keywords and content, and broadening the funnel as well. I can only
                                imagine the sale numbers if that was the site of a mattress selling company.</p>
                            <a class="reply" onclick="new function() {
                                $('#input-comment-1').toggle(300);
                            }">reply</a>
                            <div class="input-comment" id="input-comment-1">
                                <textarea class="form-control autosize input-comment" name="comment"
                                          rows="3"
                                          placeholder="Comment"></textarea>
                                <div class="d-flex">
                                    <button type="text" class="btn btn-warning btn--block w-50">Cancel</button>
                                    <button type="text" class="btn btn--secondary btn--block w-50">Post Your Comment
                                    </button>
                                </div>
                            </div>
                        </div>
                    </li>
                </ul>
            </div>
            <div class="col-xs-4">
                <ul class="comments-list">
                    <li class="comment-body">
                        <div class="avatar">
                            <img src="../../../resources/assets/images/team/thumb/3.jpg" alt="avatar">
                        </div>
                        <div class="comment" id="comment-2">
                            <h6>Mohamed Habaza</h6>
                            <div class="date">Jan 28, 2017 - 10:07 pm</div>
                            <p>The example about the mattress sizing page you mentioned in the last WBF can be a perfect
                                example of new keywords and content, and broadening the funnel as well. I can only
                                imagine the sale numbers if that was the site of a mattress selling company.</p>
                            <a class="reply" onclick="new function() {
                                $('#input-comment-2').toggle(300);
                            }">reply</a>
                            <div class="input-comment" id="input-comment-2">
                                <textarea class="form-control autosize input-comment" name="comment"
                                          rows="3"
                                          placeholder="Comment"></textarea>
                                <button type="text" class="btn btn--secondary btn--block">Post Your Comment</button>
                            </div>
                        </div>
                        <ul class="comment-children">
                            <li class="comment-body">
                                <div class="avatar">
                                    <img src="../../../resources/assets/images/team/thumb/2.jpg" alt="avatar">
                                </div>
                                <div class="comment">
                                    <h6>Mahmoud Baghagho</h6>
                                    <div class="date">Jan 28, 2017 - 10:07 pm</div>
                                    <p>The example about the mattress sizing page you mentioned in the last WBF can be a
                                        perfect example of new keywords and content, and broadening the funnel as well.
                                        I can only imagine the sale numbers if that was the site of a mattress selling
                                        company.</p>
                                    <a class="reply" href="#">reply</a>
                                </div>
                            </li>
                            <!-- comment end -->
                        </ul>
                    </li>
                </ul>
            </div>
            <div class="col-xs-4">
                <ul class="comments-list">
                    <li class="comment-body">
                        <div class="avatar">
                            <img src="../../../resources/assets/images/team/thumb/2.jpg" alt="avatar">
                        </div>
                        <div class="comment">
                            <h6>Anthony Hunter</h6>
                            <div class="date">Jan 28, 2017 - 08:07 pm</div>
                            <p>The example about the mattress sizing page you mentioned in the last WBF can be a perfect
                                example of new keywords and content, and broadening the funnel as well. I can only
                                imagine the sale numbers if that was the site of a mattress selling company.</p>
                            <a class="reply" href="#">reply</a>
                        </div>
                    </li>
                    <!-- comment end -->

                    <li class="comment-body">
                        <div class="avatar">
                            <img src="../../../resources/assets/images/team/thumb/3.jpg" alt="avatar">
                        </div>
                        <div class="comment">
                            <h6>Mohamed Habaza</h6>
                            <div class="date">Jan 28, 2017 - 10:07 pm</div>
                            <p>The example about the mattress sizing page you mentioned in the last WBF can be a perfect
                                example of new keywords and content, and broadening the funnel as well. I can only
                                imagine the sale numbers if that was the site of a mattress selling company.</p>
                            <a class="reply" href="#">reply</a>
                        </div>

                        <ul class="comment-children">
                            <li class="comment-body">
                                <div class="avatar">
                                    <img src="../../../resources/assets/images/team/thumb/2.jpg" alt="avatar">
                                </div>
                                <div class="comment">
                                    <h6>Mahmoud Baghagho</h6>
                                    <div class="date">Jan 28, 2017 - 10:07 pm</div>
                                    <p>The example about the mattress sizing page you mentioned in the last WBF can be a
                                        perfect example of new keywords and content, and broadening the funnel as well.
                                        I can only imagine the sale numbers if that was the site of a mattress selling
                                        company.</p>
                                    <a class="reply" href="#">reply</a>
                                </div>
                                <ul class="comment-children">
                                    <li class="comment-body">
                                        <div class="avatar">
                                            <img src="../../../resources/assets/images/team/thumb/2.jpg" alt="avatar">
                                        </div>
                                        <div class="comment">
                                            <h6>Adam Smith</h6>
                                            <div class="date">Jan 28, 2017 - 10:30 pm</div>
                                            <p>The example about the mattress sizing page you mentioned in the last WBF
                                                can be a perfect example of new keywords and content, and broadening the
                                                funnel as well. I can only imagine the sale numbers if that was the site
                                                of a mattress selling company.</p>
                                            <a class="reply" href="#">reply</a>
                                        </div>
                                    </li>
                                    <!-- comment end -->
                                </ul>
                            </li>
                            <!-- comment end -->

                            <li class="comment-body">
                                <div class="avatar">
                                    <img src="../../../resources/assets/images/team/thumb/2.jpg" alt="avatar">
                                </div>
                                <div class="comment">
                                    <h6>Anthony Hunter</h6>
                                    <div class="date">Jan 28, 2017 - 08:07 pm</div>
                                    <p>The example about the mattress sizing page you mentioned in the last WBF can be a
                                        perfect example of new keywords and content, and broadening the funnel as well.
                                        I can only imagine the sale numbers if that was the site of a mattress selling
                                        company.</p>
                                    <a class="reply" href="#">reply</a>
                                </div>
                            </li>
                            <!-- comment end -->

                        </ul>
                        <!-- .comment-children end -->
                    </li>
                    <!-- comment end -->

                    <li class="comment-body">
                        <div class="avatar">
                            <img src="../../../resources/assets/images/team/thumb/2.jpg" alt="avatar">
                        </div>
                        <div class="comment">
                            <h6>Adam Smith</h6>
                            <div class="date">Jan 28, 2017 - 10:30 pm</div>
                            <p>The example about the mattress sizing page you mentioned in the last WBF can be a perfect
                                example of new keywords and content, and broadening the funnel as well. I can only
                                imagine the sale numbers if that was the site of a mattress selling company.</p>
                            <a class="reply" href="#">reply</a>
                        </div>
                    </li>
                    <!-- comment end -->
                </ul>
            </div>
        </div>
        <div class="row mt-20">
            <h3>Delivery API</h3>
        </div>
        <div class="row mt-20">
            <div class="col-xs-3">
                <a href="https://tracker.delivery/#/kr.cjlogistics/640671380356" target="_blank">배송조회</a>
            </div>
        </div>
        <div class="row mt-20">
            <h3>Modal Element</h3>
        </div>
        <div class="row mt-20">
            <div class="col-xs-3">
                <button type="button" class="btn btn-info btn-lg w-100" data-toggle="modal" data-target="#myModal1">Base
                    Modal One Button
                </button>
                <!-- Modal -->
                <div class="modal fade custom" id="myModal1" role="dialog">
                    <div class="modal-dialog">
                        <!-- Modal content-->
                        <div class="modal-content">
                            <div class="modal-header">
                                <h4 class="modal-title">Modal Header</h4>
                            </div>
                            <div class="modal-body">
                                <p>Some text in the modal.</p>
                            </div>
                            <div class="modal-footer">
                                <div class="row">
                                    <div class="col-md-12 col-xs-12">
                                        <a class="btn btn--primary btn--block" href="#">Button</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-xs-3">
                <button type="button" class="btn btn-info btn-lg w-100" data-toggle="modal" data-target="#myModal2">Base
                    Modal One Button
                </button>
                <!-- Modal -->
                <div class="modal fade custom" id="myModal2" role="dialog">
                    <div class="modal-dialog">
                        <!-- Modal content-->
                        <div class="modal-content">
                            <div class="modal-header">
                                <h4 class="modal-title">Modal Header</h4>
                            </div>
                            <div class="modal-body">
                                <p>Some text in the modal.</p>
                            </div>
                            <div class="modal-footer">
                                <div class="row">
                                    <div class="col-md-6 col-xs-12">
                                        <button type="text" class="btn btn-warning btn--block" data-dismiss="modal">
                                            Cancel
                                        </button>
                                    </div>
                                    <div class="col-md-6 col-xs-12">
                                        <a class="btn btn--primary btn--block" href="#">Button</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-xs-3">
                <button type="button" class="btn btn-info btn-lg w-100" data-toggle="modal" data-target="#myModal3">Base
                    Modal Close X
                </button>
                <!-- Modal -->
                <div class="modal fade custom" id="myModal3" role="dialog">
                    <div class="modal-dialog">
                        <!-- Modal content-->
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                <h4 class="modal-title">Modal Header</h4>
                            </div>
                            <div class="modal-body">
                                <p>Some text in the modal.</p>
                            </div>
                            <div class="modal-footer">
                                <div class="row">
                                    <div class="col-md-6 col-xs-12">
                                        <button type="text" class="btn btn-warning btn--block" data-dismiss="modal">
                                            Cancel
                                        </button>
                                    </div>
                                    <div class="col-md-6 col-xs-12">
                                        <a class="btn btn--primary btn--block" href="#">Button</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-xs-3">
                <button type="button" class="btn btn-info btn-lg w-100" data-toggle="modal" data-target="#myModal4">Base
                    Modal Center Position
                </button>
                <!-- Modal -->
                <%--TODO 화장실--%>
                <div class="modal fade custom" id="myModal4" role="dialog">
                    <div class="modal-dialog modal-dialog-centered" role="document">
                        <!-- Modal content-->
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                <h4 class="modal-title">Modal Header</h4>
                            </div>
                            <div class="modal-body">
                                <p>Some text in the modal.</p>
                            </div>
                            <div class="modal-footer">
                                <div class="row">
                                    <div class="col-md-6 col-xs-12">
                                        <button type="text" class="btn btn-warning btn--block" data-dismiss="modal">
                                            Cancel
                                        </button>
                                    </div>
                                    <div class="col-md-6 col-xs-12">
                                        <a class="btn btn--primary btn--block" href="#">Button</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row mt-20">
            <div class="col-xs-3">
                <button type="button" class="btn btn-info btn-lg w-100" data-toggle="modal" data-target="#myModal5">Base
                    Modal Long Scroll Document
                </button>
                <!-- Modal -->
                <div class="modal fade custom" id="myModal5" role="dialog" tabindex="-1">
                    <div class="modal-dialog modal-dialog-centered" role="document">
                        <!-- Modal content-->
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                <h4 class="modal-title">Modal Header</h4>
                            </div>
                            <div class="modal-body">
                                <p>Cras mattis consectetur purus sit amet fermentum. Cras justo odio, dapibus ac
                                    facilisis in, egestas eget quam. Morbi leo risus, porta ac consectetur ac,
                                    vestibulum at eros.</p>
                                <p>Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Vivamus sagittis
                                    lacus vel augue laoreet rutrum faucibus dolor auctor.</p>
                                <p>Aenean lacinia bibendum nulla sed consectetur. Praesent commodo cursus magna, vel
                                    scelerisque nisl consectetur et. Donec sed odio dui. Donec ullamcorper nulla non
                                    metus auctor fringilla.</p>
                                <p>Cras mattis consectetur purus sit amet fermentum. Cras justo odio, dapibus ac
                                    facilisis in, egestas eget quam. Morbi leo risus, porta ac consectetur ac,
                                    vestibulum at eros.</p>
                                <p>Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Vivamus sagittis
                                    lacus vel augue laoreet rutrum faucibus dolor auctor.</p>
                                <p>Aenean lacinia bibendum nulla sed consectetur. Praesent commodo cursus magna, vel
                                    scelerisque nisl consectetur et. Donec sed odio dui. Donec ullamcorper nulla non
                                    metus auctor fringilla.</p>
                                <p>Cras mattis consectetur purus sit amet fermentum. Cras justo odio, dapibus ac
                                    facilisis in, egestas eget quam. Morbi leo risus, porta ac consectetur ac,
                                    vestibulum at eros.</p>
                                <p>Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Vivamus sagittis
                                    lacus vel augue laoreet rutrum faucibus dolor auctor.</p>
                                <p>Aenean lacinia bibendum nulla sed consectetur. Praesent commodo cursus magna, vel
                                    scelerisque nisl consectetur et. Donec sed odio dui. Donec ullamcorper nulla non
                                    metus auctor fringilla.</p>
                                <p>Cras mattis consectetur purus sit amet fermentum. Cras justo odio, dapibus ac
                                    facilisis in, egestas eget quam. Morbi leo risus, porta ac consectetur ac,
                                    vestibulum at eros.</p>
                                <p>Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Vivamus sagittis
                                    lacus vel augue laoreet rutrum faucibus dolor auctor.</p>
                                <p>Aenean lacinia bibendum nulla sed consectetur. Praesent commodo cursus magna, vel
                                    scelerisque nisl consectetur et. Donec sed odio dui. Donec ullamcorper nulla non
                                    metus auctor fringilla.</p>
                                <p>Cras mattis consectetur purus sit amet fermentum. Cras justo odio, dapibus ac
                                    facilisis in, egestas eget quam. Morbi leo risus, porta ac consectetur ac,
                                    vestibulum at eros.</p>
                                <p>Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Vivamus sagittis
                                    lacus vel augue laoreet rutrum faucibus dolor auctor.</p>
                                <p>Aenean lacinia bibendum nulla sed consectetur. Praesent commodo cursus magna, vel
                                    scelerisque nisl consectetur et. Donec sed odio dui. Donec ullamcorper nulla non
                                    metus auctor fringilla.</p>
                                <p>Cras mattis consectetur purus sit amet fermentum. Cras justo odio, dapibus ac
                                    facilisis in, egestas eget quam. Morbi leo risus, porta ac consectetur ac,
                                    vestibulum at eros.</p>
                                <p>Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Vivamus sagittis
                                    lacus vel augue laoreet rutrum faucibus dolor auctor.</p>
                                <p>Aenean lacinia bibendum nulla sed consectetur. Praesent commodo cursus magna, vel
                                    scelerisque nisl consectetur et. Donec sed odio dui. Donec ullamcorper nulla non
                                    metus auctor fringilla.</p>
                            </div>
                            <div class="modal-footer">
                                <div class="row">
                                    <div class="col-md-6 col-xs-12">
                                        <button type="text" class="btn btn-warning btn--block" data-dismiss="modal">
                                            Cancel
                                        </button>
                                    </div>
                                    <div class="col-md-6 col-xs-12">
                                        <a class="btn btn--primary btn--block" href="#">Button</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-xs-3">
                <button type="button" class="btn btn-info btn-lg w-100" data-toggle="modal" data-target="#myModal6">Base
                    Modal Long Scroll Document 200
                </button>
                <!-- Modal -->
                <div class="modal fade custom" id="myModal6" role="dialog" tabindex="-1">
                    <div class="modal-dialog modal-dialog-centered" role="document">
                        <!-- Modal content-->
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                <h4 class="modal-title">Modal Header</h4>
                            </div>
                            <div class="modal-body scrollerable mh-200">
                                <p>Cras mattis consectetur purus sit amet fermentum. Cras justo odio, dapibus ac
                                    facilisis in, egestas eget quam. Morbi leo risus, porta ac consectetur ac,
                                    vestibulum at eros.</p>
                                <p>Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Vivamus sagittis
                                    lacus vel augue laoreet rutrum faucibus dolor auctor.</p>
                                <p>Aenean lacinia bibendum nulla sed consectetur. Praesent commodo cursus magna, vel
                                    scelerisque nisl consectetur et. Donec sed odio dui. Donec ullamcorper nulla non
                                    metus auctor fringilla.</p>
                                <p>Cras mattis consectetur purus sit amet fermentum. Cras justo odio, dapibus ac
                                    facilisis in, egestas eget quam. Morbi leo risus, porta ac consectetur ac,
                                    vestibulum at eros.</p>
                                <p>Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Vivamus sagittis
                                    lacus vel augue laoreet rutrum faucibus dolor auctor.</p>
                                <p>Aenean lacinia bibendum nulla sed consectetur. Praesent commodo cursus magna, vel
                                    scelerisque nisl consectetur et. Donec sed odio dui. Donec ullamcorper nulla non
                                    metus auctor fringilla.</p>
                                <p>Cras mattis consectetur purus sit amet fermentum. Cras justo odio, dapibus ac
                                    facilisis in, egestas eget quam. Morbi leo risus, porta ac consectetur ac,
                                    vestibulum at eros.</p>
                                <p>Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Vivamus sagittis
                                    lacus vel augue laoreet rutrum faucibus dolor auctor.</p>
                                <p>Aenean lacinia bibendum nulla sed consectetur. Praesent commodo cursus magna, vel
                                    scelerisque nisl consectetur et. Donec sed odio dui. Donec ullamcorper nulla non
                                    metus auctor fringilla.</p>
                                <p>Cras mattis consectetur purus sit amet fermentum. Cras justo odio, dapibus ac
                                    facilisis in, egestas eget quam. Morbi leo risus, porta ac consectetur ac,
                                    vestibulum at eros.</p>
                                <p>Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Vivamus sagittis
                                    lacus vel augue laoreet rutrum faucibus dolor auctor.</p>
                                <p>Aenean lacinia bibendum nulla sed consectetur. Praesent commodo cursus magna, vel
                                    scelerisque nisl consectetur et. Donec sed odio dui. Donec ullamcorper nulla non
                                    metus auctor fringilla.</p>
                                <p>Cras mattis consectetur purus sit amet fermentum. Cras justo odio, dapibus ac
                                    facilisis in, egestas eget quam. Morbi leo risus, porta ac consectetur ac,
                                    vestibulum at eros.</p>
                                <p>Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Vivamus sagittis
                                    lacus vel augue laoreet rutrum faucibus dolor auctor.</p>
                                <p>Aenean lacinia bibendum nulla sed consectetur. Praesent commodo cursus magna, vel
                                    scelerisque nisl consectetur et. Donec sed odio dui. Donec ullamcorper nulla non
                                    metus auctor fringilla.</p>
                                <p>Cras mattis consectetur purus sit amet fermentum. Cras justo odio, dapibus ac
                                    facilisis in, egestas eget quam. Morbi leo risus, porta ac consectetur ac,
                                    vestibulum at eros.</p>
                                <p>Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Vivamus sagittis
                                    lacus vel augue laoreet rutrum faucibus dolor auctor.</p>
                                <p>Aenean lacinia bibendum nulla sed consectetur. Praesent commodo cursus magna, vel
                                    scelerisque nisl consectetur et. Donec sed odio dui. Donec ullamcorper nulla non
                                    metus auctor fringilla.</p>
                            </div>
                            <div class="modal-footer">
                                <div class="row">
                                    <div class="col-md-6 col-xs-12">
                                        <button type="text" class="btn btn-warning btn--block" data-dismiss="modal">
                                            Cancel
                                        </button>
                                    </div>
                                    <div class="col-md-6 col-xs-12">
                                        <a class="btn btn--primary btn--block" href="#">Button</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-xs-3">
                <button type="button" class="btn btn-info btn-lg w-100" data-toggle="modal" data-target="#myModal7">Base
                    Modal Long Scroll Document 400
                </button>
                <!-- Modal -->
                <div class="modal fade custom" id="myModal7" role="dialog" tabindex="-1">
                    <div class="modal-dialog modal-dialog-centered" role="document">
                        <!-- Modal content-->
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                <h4 class="modal-title">Modal Header</h4>
                            </div>
                            <div class="modal-body scrollerable mh-400">
                                <p>Cras mattis consectetur purus sit amet fermentum. Cras justo odio, dapibus ac
                                    facilisis in, egestas eget quam. Morbi leo risus, porta ac consectetur ac,
                                    vestibulum at eros.</p>
                                <p>Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Vivamus sagittis
                                    lacus vel augue laoreet rutrum faucibus dolor auctor.</p>
                                <p>Aenean lacinia bibendum nulla sed consectetur. Praesent commodo cursus magna, vel
                                    scelerisque nisl consectetur et. Donec sed odio dui. Donec ullamcorper nulla non
                                    metus auctor fringilla.</p>
                                <p>Cras mattis consectetur purus sit amet fermentum. Cras justo odio, dapibus ac
                                    facilisis in, egestas eget quam. Morbi leo risus, porta ac consectetur ac,
                                    vestibulum at eros.</p>
                                <p>Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Vivamus sagittis
                                    lacus vel augue laoreet rutrum faucibus dolor auctor.</p>
                                <p>Aenean lacinia bibendum nulla sed consectetur. Praesent commodo cursus magna, vel
                                    scelerisque nisl consectetur et. Donec sed odio dui. Donec ullamcorper nulla non
                                    metus auctor fringilla.</p>
                                <p>Cras mattis consectetur purus sit amet fermentum. Cras justo odio, dapibus ac
                                    facilisis in, egestas eget quam. Morbi leo risus, porta ac consectetur ac,
                                    vestibulum at eros.</p>
                                <p>Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Vivamus sagittis
                                    lacus vel augue laoreet rutrum faucibus dolor auctor.</p>
                                <p>Aenean lacinia bibendum nulla sed consectetur. Praesent commodo cursus magna, vel
                                    scelerisque nisl consectetur et. Donec sed odio dui. Donec ullamcorper nulla non
                                    metus auctor fringilla.</p>
                                <p>Cras mattis consectetur purus sit amet fermentum. Cras justo odio, dapibus ac
                                    facilisis in, egestas eget quam. Morbi leo risus, porta ac consectetur ac,
                                    vestibulum at eros.</p>
                                <p>Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Vivamus sagittis
                                    lacus vel augue laoreet rutrum faucibus dolor auctor.</p>
                                <p>Aenean lacinia bibendum nulla sed consectetur. Praesent commodo cursus magna, vel
                                    scelerisque nisl consectetur et. Donec sed odio dui. Donec ullamcorper nulla non
                                    metus auctor fringilla.</p>
                                <p>Cras mattis consectetur purus sit amet fermentum. Cras justo odio, dapibus ac
                                    facilisis in, egestas eget quam. Morbi leo risus, porta ac consectetur ac,
                                    vestibulum at eros.</p>
                                <p>Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Vivamus sagittis
                                    lacus vel augue laoreet rutrum faucibus dolor auctor.</p>
                                <p>Aenean lacinia bibendum nulla sed consectetur. Praesent commodo cursus magna, vel
                                    scelerisque nisl consectetur et. Donec sed odio dui. Donec ullamcorper nulla non
                                    metus auctor fringilla.</p>
                                <p>Cras mattis consectetur purus sit amet fermentum. Cras justo odio, dapibus ac
                                    facilisis in, egestas eget quam. Morbi leo risus, porta ac consectetur ac,
                                    vestibulum at eros.</p>
                                <p>Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Vivamus sagittis
                                    lacus vel augue laoreet rutrum faucibus dolor auctor.</p>
                                <p>Aenean lacinia bibendum nulla sed consectetur. Praesent commodo cursus magna, vel
                                    scelerisque nisl consectetur et. Donec sed odio dui. Donec ullamcorper nulla non
                                    metus auctor fringilla.</p>
                            </div>
                            <div class="modal-footer">
                                <div class="row">
                                    <div class="col-md-6 col-xs-12">
                                        <button type="text" class="btn btn-warning btn--block" data-dismiss="modal">
                                            Cancel
                                        </button>
                                    </div>
                                    <div class="col-md-6 col-xs-12">
                                        <a class="btn btn--primary btn--block" href="#">Button</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-xs-3">
                <button type="button" class="btn btn-info btn-lg w-100" data-toggle="modal" data-target="#myModal8">Base
                    Modal Long Scroll Document 600
                </button>
                <!-- Modal -->
                <div class="modal fade custom" id="myModal8" role="dialog" tabindex="-1">
                    <div class="modal-dialog modal-dialog-centered" role="document">
                        <!-- Modal content-->
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                <h4 class="modal-title">Modal Header</h4>
                            </div>
                            <div class="modal-body scrollerable mh-600">
                                <p>Cras mattis consectetur purus sit amet fermentum. Cras justo odio, dapibus ac
                                    facilisis in, egestas eget quam. Morbi leo risus, porta ac consectetur ac,
                                    vestibulum at eros.</p>
                                <p>Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Vivamus sagittis
                                    lacus vel augue laoreet rutrum faucibus dolor auctor.</p>
                                <p>Aenean lacinia bibendum nulla sed consectetur. Praesent commodo cursus magna, vel
                                    scelerisque nisl consectetur et. Donec sed odio dui. Donec ullamcorper nulla non
                                    metus auctor fringilla.</p>
                                <p>Cras mattis consectetur purus sit amet fermentum. Cras justo odio, dapibus ac
                                    facilisis in, egestas eget quam. Morbi leo risus, porta ac consectetur ac,
                                    vestibulum at eros.</p>
                                <p>Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Vivamus sagittis
                                    lacus vel augue laoreet rutrum faucibus dolor auctor.</p>
                                <p>Aenean lacinia bibendum nulla sed consectetur. Praesent commodo cursus magna, vel
                                    scelerisque nisl consectetur et. Donec sed odio dui. Donec ullamcorper nulla non
                                    metus auctor fringilla.</p>
                                <p>Cras mattis consectetur purus sit amet fermentum. Cras justo odio, dapibus ac
                                    facilisis in, egestas eget quam. Morbi leo risus, porta ac consectetur ac,
                                    vestibulum at eros.</p>
                                <p>Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Vivamus sagittis
                                    lacus vel augue laoreet rutrum faucibus dolor auctor.</p>
                                <p>Aenean lacinia bibendum nulla sed consectetur. Praesent commodo cursus magna, vel
                                    scelerisque nisl consectetur et. Donec sed odio dui. Donec ullamcorper nulla non
                                    metus auctor fringilla.</p>
                                <p>Cras mattis consectetur purus sit amet fermentum. Cras justo odio, dapibus ac
                                    facilisis in, egestas eget quam. Morbi leo risus, porta ac consectetur ac,
                                    vestibulum at eros.</p>
                                <p>Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Vivamus sagittis
                                    lacus vel augue laoreet rutrum faucibus dolor auctor.</p>
                                <p>Aenean lacinia bibendum nulla sed consectetur. Praesent commodo cursus magna, vel
                                    scelerisque nisl consectetur et. Donec sed odio dui. Donec ullamcorper nulla non
                                    metus auctor fringilla.</p>
                                <p>Cras mattis consectetur purus sit amet fermentum. Cras justo odio, dapibus ac
                                    facilisis in, egestas eget quam. Morbi leo risus, porta ac consectetur ac,
                                    vestibulum at eros.</p>
                                <p>Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Vivamus sagittis
                                    lacus vel augue laoreet rutrum faucibus dolor auctor.</p>
                                <p>Aenean lacinia bibendum nulla sed consectetur. Praesent commodo cursus magna, vel
                                    scelerisque nisl consectetur et. Donec sed odio dui. Donec ullamcorper nulla non
                                    metus auctor fringilla.</p>
                                <p>Cras mattis consectetur purus sit amet fermentum. Cras justo odio, dapibus ac
                                    facilisis in, egestas eget quam. Morbi leo risus, porta ac consectetur ac,
                                    vestibulum at eros.</p>
                                <p>Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Vivamus sagittis
                                    lacus vel augue laoreet rutrum faucibus dolor auctor.</p>
                                <p>Aenean lacinia bibendum nulla sed consectetur. Praesent commodo cursus magna, vel
                                    scelerisque nisl consectetur et. Donec sed odio dui. Donec ullamcorper nulla non
                                    metus auctor fringilla.</p>
                            </div>
                            <div class="modal-footer">
                                <div class="row">
                                    <div class="col-md-6 col-xs-12">
                                        <button type="text" class="btn btn-warning btn--block" data-dismiss="modal">
                                            Cancel
                                        </button>
                                    </div>
                                    <div class="col-md-6 col-xs-12">
                                        <a class="btn btn--primary btn--block" href="#">Button</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row mt-20">
            <div class="col-xs-3">
                <button type="button" class="btn btn-info btn-lg w-100" data-toggle="modal" data-target="#myModal9">Base
                    Modal Long Scroll Document Catalog
                </button>
                <!-- Modal -->
                <div class="modal fade custom" id="myModal9" role="dialog" tabindex="-1">
                    <div class="modal-dialog modal-dialog-centered catalog" role="document">
                        <!-- Modal content-->
                        <div class="modal-content">
                            <div class="modal-body catalog-body">
                                <%--TODO 953 : 375--%>
                                <div class="row">
                                    <div class="col-lg-9 catalog-img-container" id="catalog-img-container">
                                        <img class="catalog-img" src="http://via.placeholder.com/900x2500"/>
                                    </div>
                                    <div class="col-lg-3">
                                        <div class="catalog-list-container">
                                            <div class="d-flex" style="height: 20vh">
                                                <div class="m-auto">
                                                    Profile 영역
                                                </div>
                                            </div>
                                            <div class="owl-item c-item" style="width: 100%;">
                                                <div class="blog-entry">
                                                    <div class="entry--content beans-type">
                                                        <div class="entry--img">
                                                            <a href="#">
                                                                <img src="../../../resources/assets/images/blog/grid/5.jpg"
                                                                     alt="entry image">
                                                            </a>
                                                            <div class="entry--body">
                                                                <div class="oneline">
                                                                    케냐 기티투 AB 싱글빈 케냐 기티투 AB 싱글빈
                                                                </div>
                                                                <div class="pricing">
                                                                    <span class="sales">25,000원</span>
                                                                </div>
                                                            </div>
                                                            <div class="sales-indication">
                                                                40% 할인
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <!-- .entry-content end -->
                                                </div>
                                            </div>
                                            <div class="owl-item c-item" style="width: 100%;">
                                                <div class="blog-entry">
                                                    <div class="entry--content beans-type">
                                                        <div class="entry--img">
                                                            <a href="#">
                                                                <img src="../../../resources/assets/images/blog/grid/5.jpg"
                                                                     alt="entry image">
                                                            </a>
                                                            <div class="entry--body">
                                                                <div class="oneline">
                                                                    케냐 기티투 AB 싱글빈 케냐 기티투 AB 싱글빈
                                                                </div>
                                                                <div class="pricing">
                                                                    <span class="sales">25,000원</span>
                                                                </div>
                                                            </div>
                                                            <div class="sales-indication">
                                                                40% 할인
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <!-- .entry-content end -->
                                                </div>
                                            </div>
                                            <div class="owl-item c-item" style="width: 100%;">
                                                <div class="blog-entry">
                                                    <div class="entry--content beans-type">
                                                        <div class="entry--img">
                                                            <a href="#">
                                                                <img src="../../../resources/assets/images/blog/grid/5.jpg"
                                                                     alt="entry image">
                                                            </a>
                                                            <div class="entry--body">
                                                                <div class="oneline">
                                                                    케냐 기티투 AB 싱글빈 케냐 기티투 AB 싱글빈
                                                                </div>
                                                                <div class="pricing">
                                                                    <span class="sales">25,000원</span>
                                                                </div>
                                                            </div>
                                                            <div class="sales-indication">
                                                                40% 할인
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <!-- .entry-content end -->
                                                </div>
                                            </div>
                                            <%--<div class="owl-item c-item" style="width: 100%;">
                                                <div class="blog-entry">
                                                    <div class="entry--content beans-type">
                                                        <div class="entry--img">
                                                            <a href="#">
                                                                <img src="../../../resources/assets/images/blog/grid/5.jpg"
                                                                     alt="entry image">
                                                            </a>
                                                            <div class="entry--body">
                                                                <div class="oneline">
                                                                    케냐 기티투 AB 싱글빈 케냐 기티투 AB 싱글빈
                                                                </div>
                                                                <div class="pricing">
                                                                    <span class="origin">25,000원</span>
                                                                    <span class="sales">21,400원</span>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <!-- .entry-content end -->
                                                </div>
                                            </div>
                                            <div class="owl-item c-item" style="width: 100%;">
                                                <div class="blog-entry">
                                                    <div class="entry--content beans-type">
                                                        <div class="entry--img">
                                                            <a href="#">
                                                                <img src="../../../resources/assets/images/blog/grid/5.jpg"
                                                                     alt="entry image">
                                                            </a>
                                                            <div class="entry--body">
                                                                <div class="oneline">
                                                                    케냐 기티투 AB 싱글빈 케냐 기티투 AB 싱글빈
                                                                </div>
                                                                <div class="pricing">
                                                                    <span class="origin">25,000원</span>
                                                                    <span class="sales">21,400원</span>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <!-- .entry-content end -->
                                                </div>
                                            </div>
                                            <div class="owl-item c-item" style="width: 100%;">
                                                <div class="blog-entry">
                                                    <div class="entry--content beans-type">
                                                        <div class="entry--img">
                                                            <a href="#">
                                                                <img src="../../../resources/assets/images/blog/grid/5.jpg"
                                                                     alt="entry image">
                                                            </a>
                                                            <div class="entry--body">
                                                                <div class="oneline">
                                                                    케냐 기티투 AB 싱글빈 케냐 기티투 AB 싱글빈
                                                                </div>
                                                                <div class="pricing">
                                                                    <span class="origin">25,000원</span>
                                                                    <span class="sales">21,400원</span>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <!-- .entry-content end -->
                                                </div>
                                            </div>
                                            <div class="owl-item c-item" style="width: 100%;">
                                                <div class="blog-entry">
                                                    <div class="entry--content beans-type">
                                                        <div class="entry--img">
                                                            <a href="#">
                                                                <img src="../../../resources/assets/images/blog/grid/5.jpg"
                                                                     alt="entry image">
                                                            </a>
                                                            <div class="entry--body">
                                                                <div class="oneline">
                                                                    케냐 기티투 AB 싱글빈 케냐 기티투 AB 싱글빈
                                                                </div>
                                                                <div class="pricing">
                                                                    <span class="sales">25,000원</span>
                                                                </div>
                                                            </div>
                                                            <div class="sales-indication">
                                                                40% 할인
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <!-- .entry-content end -->
                                                </div>
                                            </div>--%>
                                            <%--TODO Margin bottom 120px--%>
                                            <div class="catalog-contact-container">
                                                <div class="r-card-container side-widget">
                                                    <h6>I rarely have access to coffee.</h6>
                                                    <span>I come across coffee occasionally, but I often drink it without knowing it.</span>
                                                </div>
                                                <div class="r-card-container side-widget">
                                                    <h6>I rarely have access to coffee.</h6>
                                                    <span>I come across coffee occasionally, but I often drink it without knowing it.</span>
                                                </div>
                                                <div class="r-card-container side-widget">
                                                    <h6>I rarely have access to coffee.</h6>
                                                    <span>I come across coffee occasionally, but I often drink it without knowing it.</span>
                                                </div>
                                                <div class="r-card-container side-widget">
                                                    <h6>I rarely have access to coffee.</h6>
                                                    <span>I come across coffee occasionally, but I often drink it without knowing it.</span>
                                                </div>
                                            </div>
                                            <div class="cancel-btn-container position">
                                                <a class="btn btn--primary btn--block" href="#">Button</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%--TODO Widget--%>
        <div class="row mt-20">
            <h3>Widget</h3>
        </div>
        <div class="row mt-20">
            <div class="col-xs-3">
                <div class="custom-widget product clearfix">
                    <img src="../../../resources/assets/images/shop/thumb/3.jpg" alt="product">
                    <div class="product-desc">
                        <div class="product-title">
                            <a href="#">Mexican Cheese Burger</a>
                        </div>
                        <div class="product-meta">
                            <span>$38.99</span>
                        </div>
                    </div>
                </div>
                <div class="custom-widget product clearfix">
                    <img src="../../../resources/assets/images/shop/thumb/3.jpg" alt="product">
                    <div class="product-desc">
                        <div class="product-title">
                            <a href="#">Mexican Cheese Burger</a>
                        </div>
                        <div class="product-meta">
                            <span>$38.99</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row mt-20">
            <h3>Pagenation</h3>
        </div>
        <div class="row mt-20">
            <div class="col-xs-3">
                <ul class="pagination">
                    <li class="disabled">
                        <a aria-label="Previous">
                            <span aria-hidden="true"><i class="fa fa-long-arrow-left"></i></span>
                        </a>
                    </li>
                    <li class="active"><a>1</a>
                    </li>
                    <li><a>2</a>
                    </li>
                    <li><a>3</a>
                    </li>
                    <li>
                        <a aria-label="Next">
                            <span aria-hidden="true"><i class="fa fa-long-arrow-right"></i></span>
                        </a>
                    </li>
                </ul>
            </div>
            <div class="col-xs-3">
                <ul class="pagination">
                    <li>
                        <a aria-label="Previous">
                            <span aria-hidden="true"><i class="fa fa-long-arrow-left"></i></span>
                        </a>
                    </li>
                    <li class="active"><a>1</a>
                    </li>
                    <li><a>2</a>
                    </li>
                    <li><a>3</a>
                    </li>
                    <li>
                        <a aria-label="Next">
                            <span aria-hidden="true"><i class="fa fa-long-arrow-right"></i></span>
                        </a>
                    </li>
                </ul>
            </div>
            <div class="col-xs-3">
                <ul class="pagination">
                    <li>
                        <a aria-label="Previous">
                            <span aria-hidden="true"><i class="fa fa-long-arrow-left"></i></span>
                        </a>
                    </li>
                    <li><a>1</a>
                    </li>
                    <li class="active"><a>2</a>
                    </li>
                    <li><a>3</a>
                    </li>
                    <li>
                        <a aria-label="Next">
                            <span aria-hidden="true"><i class="fa fa-long-arrow-right"></i></span>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
        <div class="row mt-20">
            <div class="col-xs-6">
                <div id="pagination_layout">
                    <div class="r-card-container">
                        <div class="add-icon-container only-text">
                            <h6>Coffee Maker (Machine)1</h6>
                        </div>
                    </div>
                    <div class="r-card-container">
                        <div class="add-icon-container only-text">
                            <h6>Coffee Maker (Machine)2</h6>
                        </div>
                    </div>
                    <div class="r-card-container">
                        <div class="add-icon-container only-text">
                            <h6>Coffee Maker (Machine)3</h6>
                        </div>
                    </div>
                    <div class="r-card-container">
                        <div class="add-icon-container only-text">
                            <h6>Coffee Maker (Machine)4</h6>
                        </div>
                    </div>
                    <div class="r-card-container">
                        <div class="add-icon-container only-text">
                            <h6>Coffee Maker (Machine)5</h6>
                        </div>
                    </div>
                    <div class="r-card-container">
                        <div class="add-icon-container only-text">
                            <h6>Coffee Maker (Machine)6</h6>
                        </div>
                    </div>
                    <div class="r-card-container">
                        <div class="add-icon-container only-text">
                            <h6>Coffee Maker (Machine)7</h6>
                        </div>
                    </div>
                    <div class="r-card-container">
                        <div class="add-icon-container only-text">
                            <h6>Coffee Maker (Machine)8</h6>
                        </div>
                    </div>
                    <div class="r-card-container">
                        <div class="add-icon-container only-text">
                            <h6>Coffee Maker (Machine)9</h6>
                        </div>
                    </div>
                    <div class="r-card-container">
                        <div class="add-icon-container only-text">
                            <h6>Coffee Maker (Machine)10</h6>
                        </div>
                    </div>
                    <div class="r-card-container">
                        <div class="add-icon-container only-text">
                            <h6>Coffee Maker (Machine)11</h6>
                        </div>
                    </div>
                    <div class="r-card-container">
                        <div class="add-icon-container only-text">
                            <h6>Coffee Maker (Machine)12</h6>
                        </div>
                    </div>
                </div>
                <div class="mt-20 text-center">
                    <ul id="nav-ul" class="pagination">
                        <li class="page-item prev">
                            <a class="page-link" aria-label="Previous">
                                <span aria-hidden="true"><i class="fa fa-long-arrow-left"></i></span>
                            </a>
                        </li>
                        <li class="page-item active"><a>1</a></li>
                        <li class="page-item"><a>2</a></li>
                        <li class="page-item"><a>3</a></li>
                        <li class="page-item next">
                            <a class="page-link" aria-label="Next">
                                <span aria-hidden="true"><i class="fa fa-long-arrow-right"></i></span>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="col-xs-6">
                <div id="pagination-layout-all">
                    <div class="r-card-container">
                        <div class="add-icon-container only-text">
                            <h6>Coffee Maker (Machine)1</h6>
                        </div>
                    </div>
                    <div class="r-card-container">
                        <div class="add-icon-container only-text">
                            <h6>Coffee Maker (Machine)2</h6>
                        </div>
                    </div>
                    <div class="r-card-container">
                        <div class="add-icon-container only-text">
                            <h6>Coffee Maker (Machine)3</h6>
                        </div>
                    </div>
                    <div class="r-card-container">
                        <div class="add-icon-container only-text">
                            <h6>Coffee Maker (Machine)4</h6>
                        </div>
                    </div>
                    <div class="r-card-container">
                        <div class="add-icon-container only-text">
                            <h6>Coffee Maker (Machine)5</h6>
                        </div>
                    </div>
                    <div class="r-card-container">
                        <div class="add-icon-container only-text">
                            <h6>Coffee Maker (Machine)6</h6>
                        </div>
                    </div>
                    <div class="r-card-container">
                        <div class="add-icon-container only-text">
                            <h6>Coffee Maker (Machine)7</h6>
                        </div>
                    </div>
                    <div class="r-card-container">
                        <div class="add-icon-container only-text">
                            <h6>Coffee Maker (Machine)8</h6>
                        </div>
                    </div>
                    <div class="r-card-container">
                        <div class="add-icon-container only-text">
                            <h6>Coffee Maker (Machine)9</h6>
                        </div>
                    </div>
                    <div class="r-card-container">
                        <div class="add-icon-container only-text">
                            <h6>Coffee Maker (Machine)10</h6>
                        </div>
                    </div>
                    <div class="r-card-container">
                        <div class="add-icon-container only-text">
                            <h6>Coffee Maker (Machine)11</h6>
                        </div>
                    </div>
                    <div class="r-card-container">
                        <div class="add-icon-container only-text">
                            <h6>Coffee Maker (Machine)12</h6>
                        </div>
                    </div>
                </div>
                <div class="mt-20 text-center">
                    <ul id="nav-ul-all" class="pagination">
                        <li class="page-item prev">
                            <a class="page-link" aria-label="Previous">
                                <span aria-hidden="true"><i class="fa fa-long-arrow-left"></i></span>
                            </a>
                        </li>
                        <li class="page-item active"><a>1</a></li>
                        <li class="page-item"><a>2</a></li>
                        <li class="page-item"><a>3</a></li>
                        <li class="page-item next">
                            <a class="page-link" aria-label="Next">
                                <span aria-hidden="true"><i class="fa fa-long-arrow-right"></i></span>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="row mt-20">
            <h3>Menu</h3>
        </div>
        <div class="row mt-20">
            <div class="col-xs-3">
                <div class="accordion accordion-menu accordion-3" id="accordion05">
                    <!-- Panel 01 -->
                    <div class="panel p-resize">
                        <div class="panel--heading">
                            <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion03"
                               href="#collapse05-1" aria-expanded="true">Menu</a>
                        </div>
                        <div id="collapse05-1" class="panel--body panel-collapse collapse in p-0" aria-expanded="true">
                            <ul>
                                <li><a>Action</a></li>
                                <li><a>Another action</a></li>
                                <li><a>Something else here</a></li>
                                <li><a>Separated link</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="panel p-resize">
                        <div class="panel--heading">
                            <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion05"
                               href="#collapse06-1" aria-expanded="true">Menu</a>
                        </div>
                        <div id="collapse06-1" class="panel--body panel-collapse collapse in p-0" aria-expanded="true">
                            <ul>
                                <li><a>Action</a></li>
                                <li><a>Another action</a></li>
                                <li><a>Something else here</a></li>
                                <li><a>Separated link</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="container-fluid" style="height: 40vh;">
    </div>
</div>
<%--TODO Footer--%>
<footer id="footer" class="footer footer-2">
    <!-- Widget Section
    ============================================= -->
    <div class="footer--widget">
        <div class="container-fluid">
            <div class="row">
                <div class="col-xs-12 col-sm-12 col-md-3">
                    <div class="footer--widget-content">
                        <img src="http://via.placeholder.com/60x80"/>
                        <p class="mt-20">서울특별시 동작구 사당 4동 222-12</p>
                        <!-- .widget end -->
                        <p>010-0000-0000</p>
                        <p>(주) 유알커피</p>
                        <p>대표: 임경직</p>
                        <p>사업자번호: 00-000-0000</p>
                        <div class="footer--social-icons mt-20">
                            <a href="#"><i class="fa fa-facebook"></i></a>
                            <a href="#"><i class="fa fa-twitter"></i></a>
                            <a href="#"><i class="fa fa-instagram"></i></a>
                            <a href="#"><i class="fa fa-pinterest"></i></a>
                            <a href="#"><i class="fa fa-tripadvisor"></i></a>
                        </div>
                    </div>
                </div>
                <!-- .col-md-3 end -->

                <div class="col-xs-12 col-sm-12 col-md-9">
                    <div class="footer--widget-content widget-reservations">
                        <div class="row">
                            <div class="col-xs-12 col-sm-6 col-md-10 col-lg-9">
                                <h3 class="mb-0 d-block pb-20 border-underlline">Sitemap</h3>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12 col-sm-6 col-md-3 col-lg-2">
                                <ul class="footer-ul-list">
                                    <li class="first">
                                        <a href="#">Object</a>
                                    </li>
                                    <li>
                                        <a href="#">Object</a>
                                    </li>
                                    <li>
                                        <a href="#">Object</a>
                                    </li>
                                    <li>
                                        <a href="#">Object</a>
                                    </li>
                                    <li>
                                        <a href="#">Object</a>
                                    </li>
                                </ul>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-3 col-lg-2">
                                <ul class="footer-ul-list">
                                    <li class="first">
                                        <a href="#">Object</a>
                                    </li>
                                    <li>
                                        <a href="#">Object</a>
                                    </li>
                                    <li>
                                        <a href="#">Object</a>
                                    </li>
                                    <li>
                                        <a href="#">Object</a>
                                    </li>
                                    <li>
                                        <a href="#">Object</a>
                                    </li>
                                </ul>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-3 col-lg-2">
                                <ul class="footer-ul-list">
                                    <li class="first">
                                        <a href="#">Object</a>
                                    </li>
                                    <li>
                                        <a href="#">Object</a>
                                    </li>
                                    <li>
                                        <a href="#">Object</a>
                                    </li>
                                    <li>
                                        <a href="#">Object</a>
                                    </li>
                                    <li>
                                        <a href="#">Object</a>
                                    </li>
                                </ul>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-3 col-lg-2">
                                <ul class="footer-ul-list">
                                    <li class="first">
                                        <a href="#">Object</a>
                                    </li>
                                    <li>
                                        <a href="#">Object</a>
                                    </li>
                                    <li>
                                        <a href="#">Object</a>
                                    </li>
                                    <li>
                                        <a href="#">Object</a>
                                    </li>
                                    <li>
                                        <a href="#">Object</a>
                                    </li>
                                </ul>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-3 col-lg-2">
                                <ul class="footer-ul-list">
                                    <li class="first">
                                        <a href="#">Object</a>
                                    </li>
                                    <li>
                                        <a href="#">Object</a>
                                    </li>
                                    <li>
                                        <a href="#">Object</a>
                                    </li>
                                    <li>
                                        <a href="#">Object</a>
                                    </li>
                                    <li>
                                        <a href="#">Object</a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- .col-md-3 end -->
            </div>
        </div>
        <!-- .container end -->
    </div>
    <!-- .footer-widget end -->
    <!-- Copyrights
    ============================================= -->
    <div class="footer--copyright">
        <div class="container-fluid">
            <div class="row">
                <div class="col-xs-12 col-sm-6 col-md-6">
                    <span>© Union of Roaster Coffee Inc. 2020. Copyright All Rights Reserved.</span>
                    <a href="#" style="margin-left: 8px;">개인 정보 처리방침</a>
                    <a href="#" style="margin-left: 8px;">서비스 이용약관</a>
                </div>
                <div class="col-xs-12 col-sm-6 col-md-6">
                    <div class="footer--widget-content text-right">
                        <div class="footer--social-icons">
                            <span class="mr-10">Follow Us </span>
                            <a href="#"><i class="fa fa-facebook"></i></a>
                            <a href="#"><i class="fa fa-twitter"></i></a>
                            <a href="#"><i class="fa fa-instagram"></i></a>
                            <a href="#"><i class="fa fa-pinterest"></i></a>
                            <a href="#"><i class="fa fa-tripadvisor"></i></a>
                        </div>
                        <!-- .social-icons end -->
                    </div>
                </div>
            </div>
        </div>
        <!-- .container end -->
    </div>
    <!-- .footer-copyright end -->
</footer>
<script src="../../../resources/assets/js/plugins.js"></script>
<script src="../../../resources/assets/js/functions.js"></script>
<!-- RS5.0 Core JS Files -->
<script src="../../../resources/assets/revolution/js/jquery.themepunch.tools.min.js?rev=5.0"></script>
<script src="../../../resources/assets/revolution/js/jquery.themepunch.revolution.min.js?rev=5.0"></script>
<script src="../../../resources/assets/revolution/js/extensions/revolution.extension.video.min.js"></script>
<script src="../../../resources/assets/revolution/js/extensions/revolution.extension.slideanims.min.js"></script>
<script src="../../../resources/assets/revolution/js/extensions/revolution.extension.actions.min.js"></script>
<script src="../../../resources/assets/revolution/js/extensions/revolution.extension.layeranimation.min.js"></script>
<script src="../../../resources/assets/revolution/js/extensions/revolution.extension.kenburn.min.js"></script>
<script src="../../../resources/assets/revolution/js/extensions/revolution.extension.navigation.min.js"></script>
<script src="../../../resources/assets/revolution/js/extensions/revolution.extension.migration.min.js"></script>
<script src="../../../resources/assets/revolution/js/extensions/revolution.extension.parallax.min.js"></script>
<!-- RS Configration JS Files -->
<script src="../../../resources/assets/js/rsconfig.js"></script>
<script src="../../../resources/js/textarea.js"></script>
<script src="../../../resources/assets/js/okiwi-pagination.js"></script>
<script src="../../../resources/js/header.js"></script>
<script src="../../../resources/js/common.js"></script>
<script>
    /*TODO HashTag Javascript*/
    $(document).ready(function () {
        var hash_input = document.getElementById("input-hash");
        var hash_container = document.getElementById('hash-container');
        hash_input.addEventListener('keyup', function (event) {
            if (event.keyCode == 13 && hash_input.value.length > 0) {
                var text = document.createTextNode(hash_input.value);
                var p = document.createElement('p');
                p.classList.add('tag');
                var element_text = document.createElement('span');
                element_text.classList.add('text');
                element_text.appendChild(text);
                var element_button = document.createElement('span');
                element_button.classList.add('x-button');
                p.appendChild(element_text);
                p.appendChild(element_button);
                hash_container.appendChild(p);
                hash_input.value = '';
                var deleteTags = hash_container.querySelectorAll('.tag');
                for (let j = 0; j < deleteTags.length; j++) {
                    deleteTags[j].addEventListener('click', function () {
                        hash_container.removeChild(deleteTags[j]);
                    });
                }
            }
        });
    });
    /*TODO HashTag Javascript End*/

    /*TODO File Input Javascript*/
    // 이벤트를 바인딩해서 input에 파일이 올라올때 위의 함수를 this context로 실행합니다.
    $('#custom-file-input').change(function () {
        readURL(this, 'custom-file-background', 'custom-file-name');
    });

    function readURL(input, preview, file_name) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function (e) {
                var file = input.files[0];
                var fileType = file['type'];
                var validImageTypes = ['image/gif', 'image/jpeg', 'image/png', 'image/svg+xml'];
                if (!validImageTypes.includes(fileType)) {
                    // invalid file type code goes here.
                    $('#' + preview).css('background-image', 'url(' + '../resources/assets/images/background/5.jpg' + ')');
                } else {
                    $('#' + preview).css('background-image', 'url(' + e.target.result + ')');
                }
                $('#' + file_name).attr('value', getFileName(input.id));
            };
            reader.readAsDataURL(input.files[0]);
        }
    }

    function getFileName(id) {
        var fileValue = $('#' + id).val().split("\\");
        var fileName = fileValue[fileValue.length - 1];
        return fileName;
    }

    /*TODO File Input Javascript End*/

    /*TODO Progress bar type-1 javascript start*/
    let els = document.getElementsByClassName('step');
    let steps = [];
    Array.prototype.forEach.call(els, (e) => {
        steps.push(e);
        e.addEventListener('click', (x) => {
            progress(x.target.id);
        });
    });

    function progress(stepNum) {
        let p = stepNum * 30;
        document.getElementsByClassName('percent')[0].style.width = `${p}%`;
        steps.forEach((e) => {
            if (e.id === stepNum) {
                e.classList.add('selected');
                e.classList.remove('completed');
            }
            if (e.id < stepNum) {
                e.classList.add('completed');
            }
            if (e.id > stepNum) {
                e.classList.remove('selected', 'completed');
            }
        });
    }

    /*TODO Progress bar javascript end*/

    /*TODO Dropdown list checkbox javascript start*/
    $(".checkbox-menu").on("change", "input[type='checkbox']", function () {
        $(this).closest("li").toggleClass("active", this.checked);
    });

    $(document).on('click', '.allow-focus', function (e) {
        e.stopPropagation();
    });

    $(document).ready(function () {
        $('.checkbox').change(function () {
            var ul = $(this).parent().parent().parent().parent();
            var checks_total_element = ul.children('div.checks-total')[0];
            while (checks_total_element.firstChild) {
                checks_total_element.removeChild(checks_total_element.lastChild);
            }
            var li_elements = ul.children('li:not(.divider)');
            for (var i = 0; i < li_elements.length; i++) {
                var object = li_elements[i];
                var text = object.querySelector('label.checkbox-type span');
                var checkbox = object.querySelector('label.checkbox-type div.checks input.checkbox');
                if (checkbox.checked) {
                    var p = document.createElement('p');
                    p.innerText = text.innerText;
                    checks_total_element.appendChild(p);
                }
            }
        });
    });
    /*TODO Dropdown list checkbox javascript end*/

    /*TODO Catalog Modal Resizing javascript start*/
    const resize_ob = new ResizeObserver(function (entries) {
        // since we are observing only a single element, so we access the first element in entries array
        var list_element = document.getElementsByClassName('catalog-list-container')[0];
        let rect = entries[0].contentRect;

        // current width & height
        let width = rect.width;
        let height = rect.height;

        var button_container = document.getElementsByClassName('cancel-btn-container')[0];

        if (list_element.offsetHeight < height) {
            /*TODO position*/
            document.getElementsByClassName('catalog-list-container')[0].style.height = height + 'px';
            document.getElementsByClassName('catalog-list-container')[0].style.maxHeight = height + 'px';
        } else {
            /*TODO unposition*/
            document.getElementsByClassName('catalog-list-container')[0].style.height = height + 'px';
            document.getElementsByClassName('catalog-list-container')[0].style.maxHeight = height + 'px';
            if (button_container.classList.contains('position'))
                button_container.classList.add('unposition');
            else {
                if (!button_container.classList.contains('unposition'))
                    button_container.classList.add('unposition');
            }
        }
    });
    $(document).ready(function () {
        // start observing for resize
        resize_ob.observe(document.querySelector('#catalog-img-container'));
    });
    /*TODO Catalog Modal Resizing javascript end*/
    /*TODO Pagination javascript start*/
    $(document).ready(function () {
        var pagination_id = 'nav-ul';
        var layout_id = 'pagination_layout';
        var divider_item_name = 'div.r-card-container';
        runPagination(pagination_id, layout_id, divider_item_name);
    });
    $(document).ready(function () {
        var pagination_id = 'nav-ul-all';
        var layout_id = 'pagination-layout-all';
        var divider_item_name = 'div.r-card-container';
        runPagination(pagination_id, layout_id, divider_item_name);
    });
    /*TODO Pagination javascript end*/
</script>
</body>
</html>