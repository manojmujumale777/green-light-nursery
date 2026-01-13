<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Join Green Haven Nursery</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <script src="https://unpkg.com/lucide@latest"></script>
    <style>
        body {
            background-image: linear-gradient(rgba(0, 0, 0, 0.4), rgba(0, 0, 0, 0.4)), url('https://images.unsplash.com/photo-1470058869958-2a77a61712ef?ixlib=rb-1.2.1&auto=format&fit=crop&w=1920&q=80');
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
        }
        .form-glass {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(10px);
        }
    </style>
</head>
<body class="min-h-screen flex items-center justify-center p-6 py-12">

    <div class="form-glass w-full max-w-4xl p-8 md:p-12 rounded-3xl shadow-2xl">
        <div class="text-center mb-10">
            <div class="inline-flex items-center justify-center w-12 h-12 bg-emerald-100 text-emerald-600 rounded-full mb-4">
                <i data-lucide="sprout" class="w-6 h-6"></i>
            </div>
            <h1 class="text-3xl font-bold text-emerald-900">Create Your Account</h1>
            <p class="text-emerald-700 mt-2">Start your journey with Green Haven Nursery</p>
        </div>

        <%-- Message Handling --%>
       <% 
String msg = request.getParameter("msg");

if ("valid".equals(msg)) {
%>
<div class="bg-emerald-50 border-l-4 border-emerald-500 text-emerald-700 p-4 mb-6 rounded-lg flex items-center">
    <i data-lucide="check-circle" class="w-5 h-5 mr-3"></i>
    <p>Registration successful! You can now <a href="signin.jsp" class="font-bold underline">Login</a>.</p>
</div>

<% } else if ("exists".equals(msg)) { %>

<div class="bg-yellow-50 border-l-4 border-yellow-500 text-yellow-800 p-4 mb-6 rounded-lg flex items-center">
    <i data-lucide="alert-triangle" class="w-5 h-5 mr-3"></i>
    <p>Email already registered. Please <a href="signin.jsp" class="font-bold underline">Login</a>.</p>
</div>

<% } else if ("invalid".equals(msg)) { %>

<div class="bg-red-50 border-l-4 border-red-500 text-red-700 p-4 mb-6 rounded-lg flex items-center">
    <i data-lucide="alert-circle" class="w-5 h-5 mr-3"></i>
    <p>Something went wrong. Please try again.</p>
</div>

<% } %>


        <form action="signupAction.jsp" method="post" class="grid grid-cols-1 md:grid-cols-2 gap-6">
            <!-- Personal Info -->
            <div class="space-y-4">
                <h3 class="text-lg font-bold text-emerald-800 border-b border-emerald-100 pb-2 flex items-center">
                    <i data-lucide="user" class="w-4 h-4 mr-2"></i> Basic Information
                </h3>
                
                <input type="text" name="name" placeholder="Full Name" required class="w-full px-4 py-3 rounded-xl border border-emerald-200 focus:ring-2 focus:ring-emerald-500 outline-none">
                <input type="email" name="email" placeholder="Email Address" required class="w-full px-4 py-3 rounded-xl border border-emerald-200 focus:ring-2 focus:ring-emerald-500 outline-none">
                <input type="text" name="mobileNumber" placeholder="Mobile Number" required class="w-full px-4 py-3 rounded-xl border border-emerald-200 focus:ring-2 focus:ring-emerald-500 outline-none">
                
                <select name="securityQuestion" class="w-full px-4 py-3 rounded-xl border border-emerald-200 focus:ring-2 focus:ring-emerald-500 outline-none bg-white">
                    <option disabled selected>Select Security Question</option>
                    <option>What is the name of your first pet?</option>
                    <option>What was your first plant?</option>
                    <option>What is your favorite flower?</option>
                </select>
                <input type="text" name="answer" placeholder="Your Answer" required class="w-full px-4 py-3 rounded-xl border border-emerald-200 focus:ring-2 focus:ring-emerald-500 outline-none">
                <input type="password" name="password" placeholder="Create Password" required class="w-full px-4 py-3 rounded-xl border border-emerald-200 focus:ring-2 focus:ring-emerald-500 outline-none">
            </div>

            <!-- Address Info -->
            <div class="space-y-4">
                <h3 class="text-lg font-bold text-emerald-800 border-b border-emerald-100 pb-2 flex items-center">
                    <i data-lucide="map-pin" class="w-4 h-4 mr-2"></i> Delivery Address
                </h3>
                <textarea name="address" placeholder="Flat No / House No / Street" required class="w-full px-4 py-3 rounded-xl border border-emerald-200 focus:ring-2 focus:ring-emerald-500 outline-none h-24"></textarea>
                <input type="text" name="city" placeholder="City" required class="w-full px-4 py-3 rounded-xl border border-emerald-200 focus:ring-2 focus:ring-emerald-500 outline-none">
                <input type="text" name="state" placeholder="State" required class="w-full px-4 py-3 rounded-xl border border-emerald-200 focus:ring-2 focus:ring-emerald-500 outline-none">
                <input type="text" name="country" placeholder="Country" required class="w-full px-4 py-3 rounded-xl border border-emerald-200 focus:ring-2 focus:ring-emerald-500 outline-none">
            </div>

            <div class="md:col-span-2 mt-4">
                <button type="submit" class="w-full bg-emerald-600 hover:bg-emerald-700 text-white font-bold py-4 rounded-xl shadow-xl transition-all flex items-center justify-center text-lg">
                    Complete Registration
                    <i data-lucide="check-circle" class="ml-2 w-5 h-5"></i>
                </button>
                <p class="text-center mt-6 text-emerald-800">
                    Already a member? <a href="signin.jsp" class="font-bold text-emerald-600 hover:underline">Sign In here</a>
                </p>
            </div>
        </form>
    </div>

    <script>lucide.createIcons();</script>
</body>
</html>