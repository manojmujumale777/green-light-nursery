<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String email = (String)session.getAttribute("email");
boolean loggedIn = (email != null);
%>

<%
String lang = (String)session.getAttribute("lang");
if(lang == null) lang = "en";

String HOME = lang.equals("mr") ? "मुख्यपृष्ठ" : "Home";
String PLANTS = lang.equals("mr") ? "रोपे" : "Plants";
String ABOUT = lang.equals("mr") ? "आमच्याबद्दल" : "About Us";
String LOGIN = lang.equals("mr") ? "लॉग इन" : "Login";
String REGISTER = lang.equals("mr") ? "नोंदणी" : "Register";

String HERO_BADGE = lang.equals("mr") ? "उत्तम रोपे" : "Premium Plant Collection";
String HERO_TITLE1 = lang.equals("mr") ? "तुमच्या घरात" : "Bring Nature Into";
String HERO_TITLE2 = lang.equals("mr") ? "निसर्ग आणा" : "Your Living Space";

String HERO_PARA = lang.equals("mr") ?
"घरासाठी योग्य अशी इनडोअर व आउटडोअर रोपे शोधा. आजच तुमची बाग तयार करा." :
"Discover a wide variety of indoor and outdoor plants curated for every home.";

String SHOP = lang.equals("mr") ? "खरेदी करा" : "Shop Now";
String STORY = lang.equals("mr") ? "आमची कथा" : "Our Story";
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Green Light Nursery | Home</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <script src="https://unpkg.com/lucide@latest"></script>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@300;400;500;600;700&display=swap');
        
        body {
            font-family: 'Plus Jakarta Sans', sans-serif;
            scroll-behavior: smooth;
        }

        .hero-gradient {
            background: linear-gradient(rgba(6, 78, 59, 0.7), rgba(6, 78, 59, 0.5)), 
                        url('https://images.unsplash.com/photo-1466692476868-aef1dfb1e735?ixlib=rb-1.2.1&auto=format&fit=crop&w=1920&q=80');
            background-size: cover;
            background-position: center;
        }

        .glass-nav {
            background: rgba(255, 255, 255, 0.8);
            backdrop-filter: blur(10px);
        }
    </style>
</head>
<body class="bg-stone-50 text-stone-900">

    <!-- Navigation Menu -->
    <nav class="fixed w-full z-50 glass-nav border-b border-emerald-100">
        <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
            <div class="flex justify-between h-20 items-center">
                <!-- Logo -->
                <div class="flex items-center space-x-2">
                    <div class="bg-emerald-600 p-2 rounded-lg">
                        <i data-lucide="leaf" class="text-white w-6 h-6"></i>
                    </div>
                    <span class="text-2xl font-bold text-emerald-900 tracking-tight">Green Light Nursery</span>
                </div>

                <!-- Desktop Menu -->
                <div class="hidden md:flex items-center space-x-8">
                    <a href="home.jsp" class="text-emerald-900 font-semibold hover:text-emerald-600 transition"><%=HOME%></a>
                    <a href="#categories" class="text-stone-600 font-medium hover:text-emerald-600 transition"><%=PLANTS%></a>
                    <a href="#about" class="text-stone-600 font-medium hover:text-emerald-600 transition"><%=ABOUT%></a>
                    <div class="flex items-center space-x-4 pl-4 border-l border-stone-200">

<% if(!loggedIn){ %>

    <a href="signin.jsp" class="text-emerald-700 font-semibold"><%=LOGIN%></a>
    <a href="signup.jsp" class="bg-emerald-600 hover:bg-emerald-700 text-white px-6 py-2.5 rounded-full font-bold">
        <%=REGISTER%>
    </a>

<% } else { %>

    <span class="text-emerald-700 font-bold">
        <%= lang.equals("mr")?"स्वागत आहे":"Welcome" %>,
        <%= session.getAttribute("name") %>
    </span>

    <a href="index.jsp"
       class="bg-red-500 hover:bg-red-600 text-white px-6 py-2.5 rounded-full font-bold">
       Logout
    </a>

<% } %>

</div>

                    <div class="flex items-center space-x-2">
   <a href="Language?lang=en" class="text-sm border px-2 py-1 rounded">English</a>
   <a href="Language?lang=mr" class="text-sm border px-2 py-1 rounded">मराठी</a>
</div>
                    
                </div>

                <!-- Mobile Menu Button -->
                <div class="md:hidden">
                    <button id="mobile-menu-button" class="text-emerald-900 p-2">
                        <i data-lucide="menu" class="w-8 h-8"></i>
                    </button>
                </div>
            </div>
        </div>

        <!-- Mobile Menu (Hidden by default) -->
        <div id="mobile-menu" class="hidden md:hidden bg-white border-b border-stone-100 px-4 py-6 space-y-4">
            <a href="home.jsp" class="block text-emerald-900 font-bold text-lg"><%=HOME%></a>
            <a href="#categories" class="block text-stone-600 font-medium text-lg"><%=PLANTS%></a>
            <a href="#about" class="block text-stone-600 font-medium text-lg"><%=ABOUT%></a>
            <div class="flex items-center space-x-4 pl-4 border-l border-stone-200">

<% if(!loggedIn){ %>

    <a href="signin.jsp" class="text-emerald-700 font-semibold"><%=LOGIN%></a>
    <a href="signup.jsp" class="bg-emerald-600 hover:bg-emerald-700 text-white px-6 py-2.5 rounded-full font-bold">
        <%=REGISTER%>
    </a>

<% } else { %>

    <span class="text-emerald-700 font-bold">
        <%= lang.equals("mr")?"स्वागत आहे":"Welcome" %>,
        <%= session.getAttribute("name") %>
    </span>

    <a href="logout.jsp"
       class="bg-red-500 hover:bg-red-600 text-white px-6 py-2.5 rounded-full font-bold">
       Logout
    </a>

<% } %>

</div>

        </div>
    </nav>

    <!-- Hero Section -->
    <header class="hero-gradient min-h-screen flex items-center pt-20">
        <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 text-center md:text-left">
            <div class="max-w-3xl">
                <span class="inline-block px-4 py-1.5 bg-emerald-500/20 text-emerald-300 rounded-full text-sm font-bold tracking-widest uppercase mb-6 backdrop-blur-md">
                    <%=HERO_BADGE%>
                </span>
                <h1 class="text-5xl md:text-7xl font-extrabold text-white mb-6 leading-tight">
                    <%=HERO_TITLE1%> <br><span class="text-emerald-400"><%=HERO_TITLE2%></span>
                </h1>
                <p class="text-xl text-emerald-50 mb-10 leading-relaxed max-w-2xl">
                    <%=HERO_PARA%>
                </p>
                <div class="flex flex-col sm:flex-row space-y-4 sm:space-y-0 sm:space-x-4 justify-center md:justify-start">
                    <a href="#categories" class="bg-emerald-500 hover:bg-emerald-400 text-white px-10 py-4 rounded-full font-bold text-lg shadow-2xl shadow-emerald-900/40 transition flex items-center justify-center">
                        <%=SHOP%> <i data-lucide="shopping-bag" class="ml-2 w-5 h-5"></i>
                    </a>
                    <a href="#about" class="bg-white/10 hover:bg-white/20 text-white border border-white/30 backdrop-blur-md px-10 py-4 rounded-full font-bold text-lg transition flex items-center justify-center">
                       <%=STORY%>
                    </a>
                </div>
            </div>
        </div>
    </header>

   <!-- Features Section -->
<section class="py-20 bg-white">
<div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
<div class="grid grid-cols-1 md:grid-cols-3 gap-12 text-center">

<div class="p-6">
<div class="w-16 h-16 bg-emerald-50 text-emerald-600 rounded-2xl flex items-center justify-center mx-auto mb-6">
<i data-lucide="truck" class="w-8 h-8"></i>
</div>
<h3 class="text-xl font-bold text-stone-900 mb-2">
<%= lang.equals("mr") ? "जलद डिलिव्हरी" : "Fast Delivery" %>
</h3>
<p class="text-stone-500">
<%= lang.equals("mr") ? "२ ते ३ दिवसांत सुरक्षितपणे तुमच्यापर्यंत पोहोचवले जाते." : "Safely shipped to your doorstep in 2-3 business days." %>
</p>
</div>

<div class="p-6">
<div class="w-16 h-16 bg-emerald-50 text-emerald-600 rounded-2xl flex items-center justify-center mx-auto mb-6">
<i data-lucide="shield-check" class="w-8 h-8"></i>
</div>
<h3 class="text-xl font-bold text-stone-900 mb-2">
<%= lang.equals("mr") ? "सुरक्षित पेमेंट" : "Safe Payment" %>
</h3>
<p class="text-stone-500">
<%= lang.equals("mr") ? "सर्व व्यवहार पूर्णपणे सुरक्षित आहेत." : "Secure transactions with end-to-end encryption." %>
</p>
</div>

<div class="p-6">
<div class="w-16 h-16 bg-emerald-50 text-emerald-600 rounded-2xl flex items-center justify-center mx-auto mb-6">
<i data-lucide="sprout" class="w-8 h-8"></i>
</div>
<h3 class="text-xl font-bold text-stone-900 mb-2">
<%= lang.equals("mr") ? "रोपांची काळजी" : "Plant Care Support" %>
</h3>
<p class="text-stone-500">
<%= lang.equals("mr") ? "तुमच्या रोपांसाठी २४x७ तज्ज्ञ मदत उपलब्ध." : "Expert advice available 24/7 for your green friends." %>
</p>
</div>

</div>
</div>
</section>

<!-- Category Section -->
<section id="categories" class="py-24 bg-stone-50">
<div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 text-center mb-16">
<h2 class="text-4xl font-bold text-stone-900 mb-4">
<%= lang.equals("mr") ? "श्रेणी नुसार खरेदी करा" : "Shop by Category" %>
</h2>
<p class="text-lg text-stone-600 max-w-2xl mx-auto">
<%= lang.equals("mr") ? "तुमच्या गरजेनुसार निवडलेली उत्तम रोपे." : "Explore our curated selections tailored for your environment." %>
</p>
</div>


<div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
<div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-8">

<div class="group relative overflow-hidden rounded-3xl h-96 shadow-lg transition hover:shadow-2xl">
<img src="https://images.unsplash.com/photo-1545241047-6083a3684587?ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=80" class="absolute inset-0 w-full h-full object-cover">
<div class="absolute inset-0 bg-gradient-to-t from-emerald-900/90 flex flex-col justify-end p-8">
<h4 class="text-2xl font-bold text-white">
<%= lang.equals("mr") ? "इनडोअर रोपे" : "Indoor Plants" %>
</h4>
<p class="text-emerald-100 text-sm">
<%= lang.equals("mr") ? "हवा शुद्ध करणारी रोपे" : "Air purifying & elegant" %>
</p>
</div>
</div>

<div class="group relative overflow-hidden rounded-3xl h-96 shadow-lg transition hover:shadow-2xl">
<img src="https://images.unsplash.com/photo-1592150621344-82841b500e21?ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=80" class="absolute inset-0 w-full h-full object-cover">
<div class="absolute inset-0 bg-gradient-to-t from-emerald-900/90 flex flex-col justify-end p-8">
<h4 class="text-2xl font-bold text-white">
<%= lang.equals("mr") ? "आउटडोअर रोपे" : "Outdoor Plants" %>
</h4>
<p class="text-emerald-100 text-sm">
<%= lang.equals("mr") ? "मजबूत आणि सुंदर" : "Hardy & beautiful" %>
</p>
</div>
</div>

<div class="group relative overflow-hidden rounded-3xl h-96 shadow-lg transition hover:shadow-2xl">
<img src="https://images.unsplash.com/photo-1520302630591-fd1c66ed818d?ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=80" class="absolute inset-0 w-full h-full object-cover">
<div class="absolute inset-0 bg-gradient-to-t from-emerald-900/90 flex flex-col justify-end p-8">
<h4 class="text-2xl font-bold text-white">
<%= lang.equals("mr") ? "सक्युलंट्स" : "Succulents" %>
</h4>
<p class="text-emerald-100 text-sm">
<%= lang.equals("mr") ? "कमी देखभाल" : "Low maintenance" %>
</p>
</div>
</div>

<div class="group relative overflow-hidden rounded-3xl h-96 shadow-lg transition hover:shadow-2xl">
<img src="https://images.unsplash.com/photo-1416870213410-d474160d6ca7?ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=80" class="absolute inset-0 w-full h-full object-cover">
<div class="absolute inset-0 bg-gradient-to-t from-emerald-900/90 flex flex-col justify-end p-8">
<h4 class="text-2xl font-bold text-white">
<%= lang.equals("mr") ? "बागेची साधने" : "Garden Tools" %>
</h4>
<p class="text-emerald-100 text-sm">
<%= lang.equals("mr") ? "उत्तम दर्जाची साधने" : "Quality accessories" %>
</p>
</div>
</div>




<%@ page import="java.sql.*" %>

<%
Connection con=null;
Statement st=null;
ResultSet rs=null;

Class.forName("com.mysql.cj.jdbc.Driver");
con=DriverManager.getConnection(
    "jdbc:mysql://localhost:3306/greenlightnursery",
    "root","root"
);

st=con.createStatement();
rs=st.executeQuery("SELECT * FROM plants");

while(rs.next()){
%>

<div class="group relative overflow-hidden rounded-3xl h-96 shadow-lg transition hover:shadow-2xl">
    <img src="images/<%=rs.getString("image")%>"
         class="absolute inset-0 w-full h-full object-cover">

    <div class="absolute inset-0 bg-gradient-to-t from-emerald-900/90 flex flex-col justify-end p-8">
        <h4 class="text-2xl font-bold text-white">
            <%=rs.getString("name")%>
        </h4>

        <p class="text-emerald-100">
            ₹ <%=rs.getDouble("price")%>
        </p>
    </div>
</div>

<%
}
%>





</div>
</div>
</section>

<!-- Footer -->
<footer class="bg-emerald-950 text-white pt-16 pb-8">
<div class="max-w-7xl mx-auto px-6">

<div class="grid grid-cols-1 md:grid-cols-4 gap-12 mb-16">

<!-- Our Office -->
<div>
<h3 class="text-xl font-bold mb-6">
<%= lang.equals("mr") ? "आमचा पत्ता" : "Our Office" %>
</h3>

<ul class="space-y-4 text-emerald-200/80">
<li class="flex items-center space-x-3">
<i data-lucide="map-pin" class="w-5 h-5 text-emerald-400"></i>
<span>Pune, Maharashtra, India</span>
</li>

<li class="flex items-center space-x-3">
<i data-lucide="phone" class="w-5 h-5 text-emerald-400"></i>
<span>+91 98765 43210</span>
</li>
</ul>

<div class="flex space-x-4 mt-6">
<a href="#" class="w-10 h-10 bg-emerald-800 hover:bg-emerald-600 rounded-full flex items-center justify-center transition">
<i data-lucide="facebook"></i>
</a>
<a href="#" class="w-10 h-10 bg-emerald-800 hover:bg-emerald-600 rounded-full flex items-center justify-center transition">
<i data-lucide="instagram"></i>
</a>
<a href="#" class="w-10 h-10 bg-emerald-800 hover:bg-emerald-600 rounded-full flex items-center justify-center transition">
<i data-lucide="twitter"></i>
</a>
</div>
</div>

<!-- Services -->
<div>
<h3 class="text-xl font-bold mb-6">
<%= lang.equals("mr") ? "आमच्या सेवा" : "Our Services" %>
</h3>

<ul class="space-y-3 text-emerald-200/80">
<li>Indoor Plants</li>
<li>Outdoor Plants</li>
<li>Garden Tools</li>
<li>Plant Pots</li>
<li>Soil & Fertilizers</li>
</ul>
</div>

<!-- Quick Links -->
<div>
<h3 class="text-xl font-bold mb-6">
<%= lang.equals("mr") ? "दुवे" : "Quick Links" %>
</h3>

<ul class="space-y-3 text-emerald-200/80">
<li><a href="home.jsp" class="hover:text-white"><%=HOME%></a></li>
<li><a href="#categories" class="hover:text-white"><%=PLANTS%></a></li>
<li><a href="#about" class="hover:text-white"><%=ABOUT%></a></li>
<li><a href="signin.jsp" class="hover:text-white"><%=LOGIN%></a></li>
<li><a href="signup.jsp" class="hover:text-white"><%=REGISTER%></a></li>
</ul>
</div>

<!-- About Nursery -->
<div>
<h3 class="text-xl font-bold mb-6">
<%= lang.equals("mr") ? "ग्रीन लाईट नर्सरी" : "Green Light Nursery" %>
</h3>

<p class="text-emerald-200/80 leading-relaxed">
<%= lang.equals("mr") 
? "आम्ही तुमच्या घरासाठी सर्वोत्तम दर्जाची रोपे आणि बागेची उत्पादने पुरवतो." 
: "We provide premium quality plants and gardening products for your home and garden." %>
</p>
</div>

</div>

<div class="border-t border-white/10 pt-6 flex flex-col md:flex-row justify-between items-center text-emerald-200/40 text-sm">
<span>© 2024 Green Light Nursery. All rights reserved.</span>
<span>Designed for Green Light Nursery</span>
</div>

</div>
</footer>




    <script>
        // Initialize Lucide Icons
        lucide.createIcons();

        // Mobile Menu Toggle
        const btn = document.getElementById('mobile-menu-button');
        const menu = document.getElementById('mobile-menu');

        btn.addEventListener('click', () => {
            menu.classList.toggle('hidden');
        });
    </script>
</body>
</html>