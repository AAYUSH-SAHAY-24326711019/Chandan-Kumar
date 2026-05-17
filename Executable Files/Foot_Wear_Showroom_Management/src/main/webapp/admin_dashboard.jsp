<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Footwear Shop Dashboard</title>

<!-- GOOGLE FONT -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap"
	rel="stylesheet">

<!-- FONT AWESOME -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" />

<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

body {
	font-family: 'Poppins', sans-serif;
	background: #f5f7fb;
	overflow-x: hidden;
	color: #1f2937;
}

a {
	text-decoration: none;
	color: inherit;
}

/* =========================
        LAYOUT
    ========================== */
.container {
	display: flex;
	min-height: 100vh;
}

/* =========================
        SIDEBAR
    ========================== */
.sidebar {
	width: 260px;
	background: #111827;
	color: #fff;
	padding: 24px 18px;
	position: fixed;
	height: 100vh;
	left: 0;
	top: 0;
	transition: 0.3s ease;
	z-index: 999;
}

.logo {
	font-size: 24px;
	font-weight: 700;
	margin-bottom: 40px;
	letter-spacing: 1px;
}

.logo span {
	color: #60a5fa;
}

.menu {
	display: flex;
	flex-direction: column;
	gap: 12px;
}

.menu a {
	display: flex;
	align-items: center;
	gap: 14px;
	padding: 14px 16px;
	border-radius: 12px;
	transition: 0.25s ease;
	font-size: 15px;
	color: #d1d5db;
}

.menu a:hover, .menu a.active {
	background: #1f2937;
	color: #fff;
	transform: translateX(3px);
}

.menu i {
	width: 20px;
	text-align: center;
}

/* =========================
        MAIN
    ========================== */
.main {
	margin-left: 260px;
	width: 100%;
	padding: 24px;
}

/* =========================
        TOPBAR
    ========================== */
.topbar {
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin-bottom: 24px;
}

.topbar h1 {
	font-size: 28px;
	font-weight: 600;
}

.topbar .profile {
	width: 44px;
	height: 44px;
	border-radius: 50%;
	background: #111827;
	display: flex;
	align-items: center;
	justify-content: center;
	color: #fff;
	font-size: 18px;
}

/* =========================
        SLIDER
    ========================== */
.slider {
	position: relative;
	width: 100%;
	height: 340px;
	border-radius: 24px;
	overflow: hidden;
	margin-bottom: 30px;
	background: #ddd;
	box-shadow: 0 10px 30px rgba(0, 0, 0, 0.08);
}

.slides {
	display: flex;
	width: 300%;
	height: 100%;
	transition: 0.6s ease;
}

.slide {
	width: 100%;
	flex-shrink: 0;
	position: relative;
}

.slide img {
	width: 100%;
	height: 100%;
	object-fit: cover;
}

.slide-content {
	position: absolute;
	left: 40px;
	bottom: 40px;
	color: #fff;
	background: rgba(0, 0, 0, 0.45);
	padding: 20px;
	border-radius: 16px;
	backdrop-filter: blur(6px);
}

.slide-content h2 {
	font-size: 32px;
	margin-bottom: 8px;
}

.slide-content p {
	font-size: 15px;
	opacity: 0.95;
}

/* =========================
        CARDS
    ========================== */
.cards {
	display: grid;
	grid-template-columns: repeat(auto-fit, minmax(230px, 1fr));
	gap: 20px;
}

.card {
	background: #fff;
	border-radius: 20px;
	padding: 24px;
	box-shadow: 0 5px 20px rgba(0, 0, 0, 0.05);
	transition: 0.3s ease;
}

.card:hover {
	transform: translateY(-4px);
}

.card-top {
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin-bottom: 18px;
}

.card-icon {
	width: 54px;
	height: 54px;
	border-radius: 14px;
	background: #eff6ff;
	color: #2563eb;
	display: flex;
	align-items: center;
	justify-content: center;
	font-size: 22px;
}

.card h3 {
	font-size: 16px;
	color: #6b7280;
	margin-bottom: 10px;
	font-weight: 500;
}

.card h2 {
	font-size: 30px;
	font-weight: 700;
}

/* =========================
        MOBILE MENU
    ========================== */
.menu-btn {
	display: none;
	width: 44px;
	height: 44px;
	border: none;
	border-radius: 10px;
	background: #111827;
	color: #fff;
	font-size: 18px;
	cursor: pointer;
}

/* =========================
        RESPONSIVE
    ========================== */
@media ( max-width :900px) {
	.sidebar {
		left: -260px;
	}
	.sidebar.active {
		left: 0;
	}
	.main {
		margin-left: 0;
	}
	.menu-btn {
		display: block;
	}
	.topbar {
		gap: 10px;
	}
	.topbar h1 {
		font-size: 22px;
	}
	.slider {
		height: 260px;
	}
	.slide-content {
		left: 20px;
		right: 20px;
		bottom: 20px;
	}
	.slide-content h2 {
		font-size: 22px;
	}
}

</style>
</head>

<body>

	<%
	if (session.getAttribute("admin_email") == null) {

		response.sendRedirect(request.getContextPath() + "/admin/");
	}
	%>

	<div class="container">

		<!-- SIDEBAR -->
		<aside class="sidebar" id="sidebar">

			<div class="logo">
				Shoe<span>Store</span>
			</div>

			<nav class="menu">

				<a href="#" class="active"> <i class="fa-solid fa-house"></i>
					Home
				</a> 
				<a href="/Foot_Wear_Showroom_Management/messages/" target="_blank"
				id="view_msg"> <i class="fa-solid fa-house"></i> View Messages
				</a>
				 <a href="#"> <i class="fa-solid fa-box"></i> Inventory
				</a> <a href="#"> <i class="fa-solid fa-cart-shopping"></i> Orders &
					Sales
				</a> <a href="#"> <i class="fa-solid fa-address-book"></i> Buyers /
					Dealers
				</a> <a href="#"> <i class="fa-solid fa-gear"></i> Site Settings
				</a> <a href="/Foot_Wear_Showroom_Management/admin/logout"> <i
					class="fa-solid fa-gear"></i> Logout
				</a>

			</nav>

		</aside>

		<!-- MAIN -->
		<main class="main">

			<!-- TOPBAR -->
			<div class="topbar">

				<div style="display: flex; align-items: center; gap: 14px;">

					<button class="menu-btn" id="menuBtn">
						<i class="fa-solid fa-bars"></i>
					</button>

					<h1>Dashboard</h1>

				</div>

				<div class="profile">
					<i class="fa-solid fa-user"></i>
				</div>

			</div>

			<!-- SLIDER -->
			<section class="slider">

				<div class="slides" id="slides">

					<div class="slide">
						<img
							src="https://images.unsplash.com/photo-1542291026-7eec264c27ff?q=80&w=1600&auto=format&fit=crop"
							alt="">
						<div class="slide-content">
							<h2>Premium Sneakers</h2>
							<p>Modern collection with premium comfort.</p>
						</div>
					</div>

					<div class="slide">
						<img
							src="https://images.unsplash.com/photo-1460353581641-37baddab0fa2?q=80&w=1600&auto=format&fit=crop"
							alt="">
						<div class="slide-content">
							<h2>Elegant Footwear</h2>
							<p>Simple, clean and premium styles.</p>
						</div>
					</div>

					<div class="slide">
						<img
							src="https://images.unsplash.com/photo-1525966222134-fcfa99b8ae77?q=80&w=1600&auto=format&fit=crop"
							alt="">
						<div class="slide-content">
							<h2>Latest Collection</h2>
							<p>Responsive store dashboard UI design.</p>
						</div>
					</div>

				</div>

			</section>

			<!-- DASHBOARD CARDS -->
			<section class="cards">

				<div class="card">

					<div class="card-top">
						<div>
							<h3>Total Products</h3>
							<h2>1,250</h2>
						</div>

						<div class="card-icon">
							<i class="fa-solid fa-shoe-prints"></i>
						</div>
					</div>

				</div>

				<div class="card">

					<div class="card-top">
						<div>
							<h3>Orders</h3>
							<h2>320</h2>
						</div>

						<div class="card-icon">
							<i class="fa-solid fa-bag-shopping"></i>
						</div>
					</div>

				</div>

				<div class="card">

					<div class="card-top">
						<div>
							<h3>Dealers</h3>
							<h2>84</h2>
						</div>

						<div class="card-icon">
							<i class="fa-solid fa-users"></i>
						</div>
					</div>

				</div>

				<div class="card">

					<div class="card-top">
						<div>
							<h3>Total Sales</h3>
							<h2>₹4.8L</h2>
						</div>

						<div class="card-icon">
							<i class="fa-solid fa-chart-line"></i>
						</div>
					</div>

				</div>

			</section>

		</main>

	</div>

	<script>

    // =========================
    // MOBILE SIDEBAR
    // =========================

    const menuBtn = document.getElementById('menuBtn');
    const sidebar = document.getElementById('sidebar');

    menuBtn.addEventListener('click', () => {
      sidebar.classList.toggle('active');
    });

    // =========================
    // AUTO SLIDER
    // =========================

    const slides = document.getElementById('slides');

    let index = 0;

    function autoSlide(){

      index++;

      if(index > 2){
        index = 0;
      }

      slides.style.transform = `translateX(-${index * 100}%)`;

    }

    setInterval(autoSlide, 3500);
    
   

  </script>

</body>
</html>