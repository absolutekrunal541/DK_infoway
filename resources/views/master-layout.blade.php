<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">

<head>
    <title>DK Infoway</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    @yield('customCss')
    <style>
        .bg-grey {
            background-color: grey;
            color: #fff;
        }

        .navbar-expand-lg .navbar-nav .nav-link,
        .navbar-expand-lg a {
            color: #fff;
        }
    </style>
</head>

<body class="font-sans antialiased dark:bg-black dark:text-white/50">
    <nav class="navbar navbar-expand-lg navbar-grey bg-grey">
        <a class="navbar-brand" href="#">DK Infoway</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <!-- set condition for authentication -->
        <div class="collapse navbar-collapse" id="auth-section"></div>
    </nav>
    <div class="container-fluid mt-5">
        @yield('content')
    </div>
</body>
<script>
    $(document).on('click', '.btn-logout', function() {
        if (confirm('Are you sure you want to logout ?')) {
            localStorage.removeItem("Authorization");
            $.ajax({
                type: 'get',
                url: '{{ url("/api/logout") }}',
                headers: {
                    "Authorization": "Bearer " + AuthToken
                },
                success: function(response, status, xhr) {
                    window.location.href = "{{route('auth.login')}}";
                },
                error: function(xhr, textStatus, errorThrown) {
                    if (xhr.status === 401) {
                        window.location.href = "{{route('auth.login')}}";
                    }
                }
            });
        }
    });
    let AuthToken = localStorage.getItem("Authorization");

    let authSection = document.getElementById("auth-section");

    if (AuthToken) {
        // If authenticated (Show Logout + Stock)
        authSection.innerHTML = `
            <ul class="navbar-nav mr-auto">
                <li class="nav-item active">
                    <a class="nav-link" href="{{route('stock.list')}}">Stock</a>
                </li>
            </ul>
            <div class="d-flex">
                <a class="btn btn-warning btn-logout">Logout</a>
            </div>
        `;
    } else {
        // If not authenticated (Show Login)
        authSection.innerHTML = `
            <ul class="navbar-nav mr-auto"></ul>
            <div class="d-flex justify-content-end">
                <a class="btn btn-primary" href="{{route('auth.login')}}">Login</a>
            </div>
        `;
    }
</script>
@yield('customJs')

</html>