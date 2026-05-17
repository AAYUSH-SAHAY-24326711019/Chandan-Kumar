<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Footwear Shop Login</title>

    <style>
        *{
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: Arial, Helvetica, sans-serif;
        }

        body{
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            background: #f4f4f4;
            padding: 20px;
        }

        .login-container{
            width: 100%;
            max-width: 400px;
            background: #ffffff;
            padding: 35px;
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.08);
        }

        .login-container h2{
            text-align: center;
            margin-bottom: 25px;
            color: #222;
        }

        .form-group{
            margin-bottom: 18px;
        }

        .form-group label{
            display: block;
            margin-bottom: 6px;
            font-size: 14px;
            color: #444;
        }

        .form-group input{
            width: 100%;
            padding: 12px;
            border: 1px solid #ccc;
            border-radius: 6px;
            outline: none;
            transition: 0.3s;
        }

        .form-group input:focus{
            border-color: #000;
        }

        .options{
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
            font-size: 14px;
        }

        .options a{
            text-decoration: none;
            color: #000;
        }

        .options a:hover{
            text-decoration: underline;
        }

        .login-btn{
            width: 100%;
            padding: 12px;
            border: none;
            background: #000;
            color: #fff;
            font-size: 16px;
            border-radius: 6px;
            cursor: pointer;
            transition: 0.3s;
        }

        .login-btn:hover{
            background: #333;
        }

        @media (max-width: 480px){
            .login-container{
                padding: 25px;
            }
        }
    </style>
</head>

<body>

    <form class="login-container" action="/Foot_Wear_Showroom_Management/admin/login" method="POST">

        <h2>Footwear Shop Login</h2>

        <div class="form-group">
            <label>Email</label>
            <input type="email" placeholder="Enter your email" name="email" required>
        </div>

        <div class="form-group">
            <label>Password</label>
            <input type="password" placeholder="Enter your password" name="password" required>
        </div>

        <div class="options">
            <label>
                <input type="checkbox">
                Remember me
            </label>

            <a href="fpwd/">Forgot Password?</a>
        </div>

        <button type="submit" class="login-btn">
            Login
        </button>

    </form>

</body>
</html>