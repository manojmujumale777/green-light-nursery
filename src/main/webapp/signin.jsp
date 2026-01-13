<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - Green Haven Nursery</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <script src="https://unpkg.com/lucide@latest"></script>
    <style>
        body {
            background-image: linear-gradient(rgba(0, 0, 0, 0.4), rgba(0, 0, 0, 0.4)), url('https://images.unsplash.com/photo-1585320806297-9794b3e4eeae?ixlib=rb-1.2.1&auto=format&fit=crop&w=1920&q=80');
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
        }
        .login-glass {
            background: rgba(255, 255, 255, 0.92);
            backdrop-filter: blur(12px);
            border: 1px solid rgba(255, 255, 255, 0.3);
        }
    </style>
</head>
<body class="min-h-screen flex items-center justify-center p-4">

    <div class="login-glass w-full max-w-md p-10 rounded-3xl shadow-2xl">
        <div class="text-center mb-10">
            <div class="inline-flex items-center justify-center w-16 h-16 bg-emerald-100 text-emerald-600 rounded-full mb-4">
                <i data-lucide="leaf" class="w-8 h-8"></i>
            </div>
            <h1 class="text-3xl font-bold text-emerald-900">Welcome Back</h1>
            <p class="text-emerald-700 mt-2 font-medium">Return to your green sanctuary</p>
        </div>

        <%-- Error Message Handling --%>
        <% 
            String msg = request.getParameter("msg");
            if ("invalid".equals(msg)) {
        %>
            <div class="bg-red-50 border-l-4 border-red-400 text-red-700 p-4 mb-6 rounded-lg flex items-center" role="alert">
                <i data-lucide="alert-circle" class="w-5 h-5 mr-3"></i>
                <p class="text-sm">Invalid email or password. Please try again.</p>
            </div>
        <% } %>

        <form action="loginAction.jsp" method="post" class="space-y-6">
            <div>
                <label for="email" class="block text-sm font-semibold text-emerald-900 mb-1.5 ml-1">Email Address</label>
                <div class="relative">
                    <span class="absolute inset-y-0 left-0 pl-3 flex items-center text-emerald-500">
                        <i data-lucide="mail" class="w-5 h-5"></i>
                    </span>
                    <input type="email" id="email" name="email" required 
                        class="w-full pl-10 pr-4 py-3 rounded-xl border border-emerald-200 focus:ring-2 focus:ring-emerald-500 focus:border-emerald-500 outline-none transition duration-200 bg-white"
                        placeholder="your@email.com">
                </div>
            </div>

            <div>
                <label for="password" class="block text-sm font-semibold text-emerald-900 mb-1.5 ml-1">Password</label>
                <div class="relative">
                    <span class="absolute inset-y-0 left-0 pl-3 flex items-center text-emerald-500">
                        <i data-lucide="lock" class="w-5 h-5"></i>
                    </span>
                    <input type="password" id="password" name="password" required 
                        class="w-full pl-10 pr-4 py-3 rounded-xl border border-emerald-200 focus:ring-2 focus:ring-emerald-500 focus:border-emerald-500 outline-none transition duration-200 bg-white"
                        placeholder="••••••••">
                </div>
            </div>

            <div class="flex items-center justify-between px-1">
                <div class="flex items-center">
                    <input id="remember-me" type="checkbox" class="h-4 w-4 text-emerald-600 border-emerald-300 rounded focus:ring-emerald-500">
                    <label for="remember-me" class="ml-2 block text-sm text-emerald-700">Remember me</label>
                </div>
                <a href="forgotPassword.jsp" class="text-sm font-semibold text-emerald-600 hover:text-emerald-700 transition">Forgot password?</a>
            </div>

            <button type="submit" 
                class="w-full bg-emerald-600 hover:bg-emerald-700 text-white font-bold py-4 rounded-xl shadow-lg shadow-emerald-200 transform active:scale-[0.98] transition-all duration-200 flex items-center justify-center">
                Sign In
                <i data-lucide="log-in" class="w-5 h-5 ml-2"></i>
            </button>
        </form>

        <div class="mt-8 pt-6 border-t border-emerald-100 text-center">
            <p class="text-emerald-800">New to our garden? 
                <a href="signup.jsp" class="font-bold text-emerald-600 hover:text-emerald-700 hover:underline underline-offset-4">Create Account</a>
            </p>
        </div>
    </div>

    <script>
        lucide.createIcons();
    </script>
</body>
</html>