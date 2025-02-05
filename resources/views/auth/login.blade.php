@extends('master-layout')
@section('content')
<div class="card">
    <div class="card-header">
        <h5>Login </h5>
    </div>
    <div class="card-body">
        <div id="message"></div>
        <form method="post" name="inquiry-form" id="inquiry-form">
            <div class="form-group">
                <label for="email">Email</label>
                <input type="text" class="form-control" id="email" name="email" placeholder="Email">
                <span class="error_email required-filed"></span>
            </div>
            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" class="form-control" id="password" name="password" placeholder="Password">
                <span class="error_password required-filed"></span>
            </div>
            <button type="submit" class="btn btn-primary">Login</button>
        </form>
    </div>
</div>
@endsection

@section('customJs')
<script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.5/dist/jquery.validate.min.js"></script>

<script>
    $(document).ready(function() {
        // Initialize form validation
        $('#inquiry-form').validate({
            rules: {
                email: {
                    required: true,
                    email: true
                },
                password: {
                    required: true
                }
            },
            messages: {
                email: {
                    required: "Please enter a email."
                },
                password: {
                    required: "Please enter a password."
                }
            },
            errorPlacement: function(error, element) {
                var name = element.attr('name');
                error.addClass('error_' + name);
                error.insertAfter(element);
            },
            submitHandler: function(form) {
                // Perform AJAX request on form submission
                $.ajax({
                    type: 'POST',
                    url: "{{ url('api/login-user') }}",
                    data: $(form).serialize(),
                    success: function(response, status, xhr) {
                        if (xhr.status === 200) {
                            // Success message
                            localStorage.setItem('Authorization', response.token);
                            $("#message").html('<div class="alert alert-success" role="alert"> ' + response.message + '</div>');

                            // Redirect
                            setTimeout(() => {
                                location.href = "{{ route('stock.list') }}";
                            }, 2000);
                        } else {
                            // Error message
                            $("#message").html('<div class="alert alert-danger" role="alert"> ' + response.message + '</div>');
                        }
                    },
                    error: function(xhr) {
                        // Handle server validation errors
                        var errors = xhr.responseJSON.errors;
                        $.each(errors, function(key, value) {
                            $('.error_' + key).text(value[0]);
                        });
                    }
                });
            }
        });
    });
</script>
@endsection