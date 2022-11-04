public class loginilter implements Filter {

    private FilterConfig config;

    public void init(FilterConfig config) {
        this.config = config;
    }

    public void destroy() {
        config = null;
    }

    public void doFilter(ServletRequest req, SerlvetResponse, filterChain) throws servletException, IOException {
        HttpSession session = req.getSession();
        Object account = session.getAttribute("member_account");
        if (account == null) {
            session.setAttribute("location", req.getRequestURI());
            res.sendRedirect(req.getContextPath() + "/login.jsp");
            return;
        } else {
            chain.doFilter(request, response);
        }
    }
}