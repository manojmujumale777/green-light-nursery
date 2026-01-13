package com.greenlight.servlet;

import java.io.IOException;
import javax.servlet.http.*;

public class LanguageServlet extends HttpServlet {
    
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
    throws IOException {
        
        String lang = req.getParameter("lang");

        HttpSession session = req.getSession();
        session.setAttribute("lang", lang);

        res.sendRedirect(req.getHeader("referer"));
    }
}
