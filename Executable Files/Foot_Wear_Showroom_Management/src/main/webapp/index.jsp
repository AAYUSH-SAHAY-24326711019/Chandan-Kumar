<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>SoleMahal</title>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">

<link rel="stylesheet" href="css_files/index_css.css">
</head>
<body>
<div class="popup-overlay" id="popupOverlay">

    <div class="premium-popup">

        <button class="close-popup" id="closePopup">×</button>

        <div class="popup-left">

            <p class="popup-tag">
                PREMIUM FOOTWEAR EXPERIENCE
            </p>

            <h2>
                Join The <span>SoleMahal</span> Network
            </h2>

            <p>
                Explore festive collections, dealership partnerships,
                and premium footwear opportunities crafted for the Indian market.
            </p>

        </div>

        <div class="popup-right">

            <form>

                <label>I am</label>

                <select>
                    <option>Consumer</option>
                    <option>Dealer & Supplier</option>
                    <option>Sales & Marketing Professional</option>
                </select>

                <label>Contact</label>
                <input type="text" placeholder="Enter Contact Number">

                <label>Email</label>
                <input type="email" placeholder="Enter Email Address">

                <label>Message</label>
                <textarea placeholder="Write your message"></textarea>

                <button type="submit">
                    Forward Details
                </button>

            </form>

        </div>

    </div>

</div>
<nav>
    <div class="logo">SOLEMAHAL</div>

    <ul>
        <li>Men</li>
        <li>Women</li>
        <li>Festive</li>
        <li>Luxury</li>
        <li>Brands</li>
    </ul>
</nav>

<section class="hero">

    <div class="hero-text">

        <div class="tag">
            INDIA'S PREMIUM FOOTWEAR DESTINATION
        </div>

        <h1>
            Walk Into Every <span>Festival</span> In Style
        </h1>

        <p>
            Luxury footwear showroom crafted for Indian celebrations,
            wedding seasons, festive shopping, office elegance and
            premium lifestyle fashion.
        </p>

        <div class="buttons">
            <button class="btn primary">Explore Collection</button>
            <button class="btn secondary">Festive Offers</button>
        </div>

    </div>

</section>

<div class="festival-strip">
    <span>
        ✨ Diwali Sale • Wedding Collection • Durga Puja Offers • Festive Luxury • Premium Sneakers • Ethnic Footwear •
    </span>
</div>

<section class="brands">

    <h2 class="section-title">
        Premium <span>Brands</span>
    </h2>

    <p>
        Trusted by modern Indian consumers.
    </p>

    <div class="brand-grid">

        <div class="brand-card">NIKE</div>
        <div class="brand-card">PUMA</div>
        <div class="brand-card">ADIDAS</div>
        <div class="brand-card">WOODLAND</div>
        <div class="brand-card">REDTAPE</div>
        <div class="brand-card">BATA</div>

    </div>

</section>

<section class="collection">

    <h2 class="section-title">
        Festive <span>Collections</span>
    </h2>

    <div class="cards">

        <div class="card">
            <img src="https://images.unsplash.com/photo-1549298916-b41d501d3772?q=80&w=1200">
            <div class="card-content">
                <h3>Luxury Sneakers</h3>
                <p>
                    Modern streetwear inspired sneakers crafted for premium fashion lovers.
                </p>
            </div>
        </div>

        <div class="card">
            <img src="https://images.unsplash.com/photo-1525966222134-fcfa99b8ae77?q=80&w=1200">
            <div class="card-content">
                <h3>Wedding Collection</h3>
                <p>
                    Elegant festive footwear specially designed for Indian wedding celebrations.
                </p>
            </div>
        </div>

        <div class="card">
            <img src="https://images.unsplash.com/photo-1460353581641-37baddab0fa2?q=80&w=1200">
            <div class="card-content">
                <h3>Daily Premium Wear</h3>
                <p>
                    Comfort driven premium footwear for office and casual lifestyle.
                </p>
            </div>
        </div>

    </div>

</section>

<section class="offer">

    <h2>DIWALI GRAND SALE</h2>

    <p>
        Up To 50% OFF On Premium Footwear Collections
    </p>

    <button class="btn primary">
        Shop Now
    </button>

</section>

<footer>
    © 2026 SoleMahal • Premium Indian Footwear Experience
</footer>

</body>

<script>

/* =========================
AUTO POPUP AFTER 5 SECONDS
========================= */

const popupOverlay = document.getElementById("popupOverlay");
const closePopup = document.getElementById("closePopup");

setTimeout(() => {
    popupOverlay.classList.add("active");
}, 5000);

closePopup.addEventListener("click", () => {
    popupOverlay.classList.remove("active");
});

/* CLOSE ON OUTSIDE CLICK */

popupOverlay.addEventListener("click", (e) => {

    if(e.target === popupOverlay){
        popupOverlay.classList.remove("active");
    }

});

</script>
</html>