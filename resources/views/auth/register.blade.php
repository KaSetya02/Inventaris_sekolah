<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>SIMVENT Politeknik TEDC Bandung - Register</title>

  <!-- Custom fonts for this template-->
  <link href="{{url('assets/vendor/fontawesome-free/css/all.min.css" rel="stylesheet')}}" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="{{url('assets/css/sb-admin-2.min.css')}}" rel="stylesheet">
 
  <link rel="shortcut icon" href="img/logo.png">
</head>

<body class="bg-primary">

  <div class="container">

    <!-- Outer Row -->
    <div class="row justify-content-center">

      <div class="col-xl-8 col-lg-12 col-md-9" >

        <div class="card o-hidden border-0 shadow-lg my-5">
          <div class="card-body p-0">
            <!-- Nested Row within Card Body -->
            <div class="row">
             
              <div class="col-lg-12">
                <div class="p-5">
                  <div class="text-center">
                     <img src="img/logo1.png" alt="" width="50px" style="margin-bottom: 7px;">
                    <h1 class="h4 text-gray-900 mb-4">Register</h1>
                  </div>
                   @if (session('status'))
                        <div class="alert alert-success" role="alert">
                            {{ session('status') }}
                        </div>
                    @endif
                 <form method="POST" action="{{ route('register') }}">
                        @csrf

                        <div class="form-group row">
                            <label for="name" class="col-md-4 col-form-label text-md-right">{{ __('Name') }}</label>

                            <div class="col-md-6">
                                <input id="name" type="text" class="form-control @error('name') is-invalid @enderror" name="name" value="{{ old('name') }}" required autocomplete="name" placeholder="Enter full name" autofocus>

                                @error('name')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                            </div>
                        </div>

                        <div class="form-group{{ $errors->has('username') ? ' has-error' : '' }} row">
                            <label class="col-md-4 col-form-label text-md-right">Username</label>
                         
                             <div class="col-md-6">
                                <input type="text" class="form-control" name="username" value="{{ old('username') }}" placeholder="Enter Username">
                         
                                @if ($errors->has('username'))
                                   <span class="help-block">
                                      <strong>{{ $message }}</strong>
                                   </span>
                                @endif
                             </div>
                         </div>

                        <div class="form-group row">
                            <label for="email" class="col-md-4 col-form-label text-md-right">{{ __('E-Mail Address') }}</label>

                            <div class="col-md-6">
                                <input id="email" type="email" class="form-control @error('email') is-invalid @enderror" name="email" value="{{ old('email') }}" required autocomplete="email" placeholder="Enter Email">

                                @error('email')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="password" class="col-md-4 col-form-label text-md-right">{{ __('Password') }}</label>

                            <div class="col-md-6">
                                <input id="password" type="password" class="form-control @error('password') is-invalid @enderror" name="password" required autocomplete="new-password" placeholder="Enter Password">

                                @error('password')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="password-confirm" class="col-md-4 col-form-label text-md-right">{{ __('Confirm Password') }}</label>

                            <div class="col-md-6">
                                <input id="password-confirm" type="password" class="form-control" name="password_confirmation" required autocomplete="new-password" placeholder="Enter Confirm Password">
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="password-confirm" class="col-md-4 col-form-label text-md-right">{{ __('Role') }}</label>

                            <div class="col-md-6">
                                <select name="level" class="form-control">
                                    <option selected disabled>--Pilih--</option>
                                    <option value="admin">Admin</option>
                                    <option value="pj">Pj Ruangan</option>
                                </select>
                            </div>
                        </div>

                        <div class="form-group row mb-0">
                            <div class="col-md-6 offset-md-4">
                                <button type="submit" class="btn btn-primary">
                                    {{ __('Register') }}
                                </button>
                            </div>
                        </div>
                    </form>
                  <hr>
                  <div class="text-center">
                    <a class="small" href="login" style="text-decoration:none;">Sign In!</a>
                  </div>
                  <div class="text-center">
                    <a class="small" href="{{ route('password.request') }}" style="text-decoration:none;">Forgot Password?</a>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>

      </div>

    </div>

  </div>

  <!-- Bootstrap core JavaScript-->
  <script src="{{url('assets/vendor/jquery/jquery.min.js')}}"></script>
  <script src="{{url('assets/vendor/bootstrap/js/bootstrap.bundle.min.js')}}"></script>

  <!-- Core plugin JavaScript-->
  <script src="{{url('assets/vendor/jquery-easing/jquery.easing.min.js')}}"></script>

  <!-- Custom scripts for all pages-->
  <script src="{{url('assets/js/sb-admin-2.min.js')}}"></script>

</body>

</html>



