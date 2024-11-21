<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>V2-AIRWAYS</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        /* Custom styles */
        .center {
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 100px;q
        }

        form {
            border: 1px solid white;
            padding: 50px;
            width: 50%;
        }

        video {
            position: fixed;
            z-index: -1;
            width: 100%;
            height: 100%;
            object-fit: cover;
        }
    </style>
</head>
<body>

<div class="col-12 video-container">
    <video autoplay loop muted>
        <source src="video/AIR.mp4" type="video/mp4">
     
    </video>
</div>

<marquee><h1 style="text-align: center; color:white">WELCOME TO V2-AIRWAYS</h1></marquee>

<div class="center">
    <form action="login" method="post">
        <div class="mb-3">
            <h2>Login</h2>
            <label for="exampleInputEmail1" class="form-label">Email</label>
            <input type="email" class="form-control" name="email" required id="exampleInputEmail1" aria-describedby="emailHelp">
            <div id="emailHelp" class="form-text">We'll never share your user email with anyone else.</div>
        </div>
        <div class="mb-3">
            <label for="exampleInputPassword1" class="form-label">Password</label>
            <input type="password" class="form-control" name="password" required id="exampleInputPassword1">
        </div>

        <div class="form-check">
            <input class="form-check-input" type="radio" name="radio" value="admin" id="flexRadioDefault1">
            <label class="form-check-label" for="flexRadioDefault1">Admin</label>
        </div>

        <div class="form-check">
            <input class="form-check-input" type="radio" name="radio" value="user" checked id="flexRadioDefault2">
            <label class="form-check-label" for="flexRadioDefault2">User</label>
        </div>
        <button type="submit" class="btn btn-primary">Submit</button>
        <a href="NewUser.jsp" class="btn btn-link">Click here for new user</a>
    </form>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
