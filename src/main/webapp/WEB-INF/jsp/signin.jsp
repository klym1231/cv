<html>
  <head>
    <title>Login | Photoblog</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <jsp:include page="/WEB-INF/jsp/component/styles/style.jsp" />
  </head>
  <body class="bg-[#fafafa]">
    <jsp:include page="/WEB-INF/jsp/component/frontpage/navbar.jsp" />

    <div id="login-panel" class="flex justify-center w-full">
      <div id="photo-container" class="sm:w-4/5 md:w-3/5 lg:w-2/5">
        <h1 class="text-xl my-6">Login your account</h1>
        <c:if test="${success == true}">
          <div class="bg-emerald-600 rounded-lg px-3 py-3 text-white my-3">
            You have successfully registered. Please log in here.
          </div>
        </c:if>
        <c:if test="${error == true}"> test </c:if>
        <div class="bg-white shadow-lg rounded-lg py-3 px-6">
          <form method="POST" action="/signin">
            <input
              type="hidden"
              name="${_csrf.parameterName}"
              value="${_csrf.token}"
            />
            <div class="my-3">
              <div>Username</div>
              <div>
                <input
                  type="text"
                  name="username"
                  placeholder="Username"
                  class="outline-none border px-3 py-2 rounded-lg w-full"
                />
              </div>
              <c:if test="${username_empty_error}">
                <div
                  class="my-6 p-4 bg-red-300 text-grey-200 w-full shadow rounded"
                >
                  <div>Error, your username is empty</div>
                </div>
              </c:if>
              <c:if test="${user_not_exist_error}">
                <div
                  class="my-6 p-4 bg-red-300 text-grey-200 w-full shadow rounded"
                >
                  <div>Error, this username does not exist</div>
                </div>
              </c:if>
            </div>
            <div class="my-6">
              <div>Password</div>
              <div>
                <input
                  type="password"
                  name="password"
                  placeholder="Password"
                  class="outline-none border px-3 py-2 rounded-lg w-full"
                />
              </div>
              <c:if test="${password_mismatch_error}">
                <div
                  class="my-6 p-4 bg-red-300 text-grey-200 w-full shadow rounded"
                >
                  <div>Error, your password is invalid</div>
                </div>
              </c:if>

              <c:if test="${password_empty_error}">
                <div
                  class="my-6 p-4 bg-red-300 text-grey-200 w-full shadow rounded"
                >
                  <div>Error, your password is empty</div>
                </div>
              </c:if>
            </div>

            <div class="my-6 flex justify-between">
              <button
                type="submit"
                class="border border-slate-500 shadow-sm drop-shadow rounded-lg px-3 py-2 transition-all hover:scale-110 duration-500"
              >
                Login
              </button>
            </div>
          </form>

          <a href="register" class="underline text-sm"
            >Do not have an account?</a
          >
        </div>
      </div>
    </div>

    <div id="footer" class="flex items-center w-full justify-center h-16">
      <div class="w-4/5 text-sm">
        &copy; PhotoBlog, 2023. All rights reserved.
      </div>
    </div>
  </body>
</html>
