<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Forgot Password</title>

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

        .forgot-container{
            width: 100%;
            max-width: 420px;
            background: #ffffff;
            padding: 35px;
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.08);
        }

        .forgot-container h2{
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

        .reset-btn{
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

        .reset-btn:hover{
            background: #333;
        }

        .back-login{
            text-align: center;
            margin-top: 18px;
            font-size: 14px;
        }

        .back-login a{
            text-decoration: none;
            color: #000;
        }

        .back-login a:hover{
            text-decoration: underline;
        }

        @media (max-width: 480px){
            .forgot-container{
                padding: 25px;
            }
        }
    </style>
</head>

<body>

    <form class="forgot-container" action="/Foot_Wear_Showroom_Management/fpwd/action" method="POST">

        <h2>Reset Password</h2>

        <div class="form-group">
            <label>Email</label>
            <input type="email" placeholder="Enter your email" name="email" required>
        </div>

        <div class="form-group">
            <label>Admin ID</label>
            <input type="text" placeholder="Enter admin ID" name="admin_id" required>
        </div>


        <div class="form-group">
            <label>New Password</label>
            <input type="password" placeholder="Enter new password" name="new_pwd" required>
        </div>

        <button type="submit" class="reset-btn">
            Reset Password
        </button>

        <div class="back-login">
            <a href="/Foot_Wear_Showroom_Management/admin/">Back to Login</a>
        </div>

    </form>

</body>
</html>