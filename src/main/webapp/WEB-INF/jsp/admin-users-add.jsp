<html>
  <head>
    <title>Welcome | Photoblog</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <jsp:include page="/WEB-INF/jsp/component/styles/style.jsp" />
  </head>
  <body>
    <div class="flex justify-end w-full bg-slate-50">
      <jsp:include page="/WEB-INF/jsp/component/backpage/navigation.jsp" />
      
      <div id="container" class="w-[calc(100%-250px)]">
        <div id="content" class="px-6 pt-6 w-full mb-6">
          <div class="bg-white shadow rounded-sm mt-3">
            <div class="py-3 px-6 border-b text-sm font-bold">+ New User</div>
            <form:form method="POST" class="px-6 text-sm" modelAttribute="userForm">
              <div class="my-3">
                <div>
                  Username
                  <span
                    class="text-red-600"
                    >*</span
                  >
                </div>
                <div>
                  <form:input
                    type="text"
                    path="username"
                    placeholder="Username"
                    class="outline-none border px-3 py-2 rounded-lg w-full"
                  />
                </div>
                <c:if test="${username_empty_error}">
                  <div class="my-6 p-4 bg-red-300 text-grey-200 w-full shadow border rounded">
                    <div>Error, Your username is empty</div>
                  </div>
                </c:if>
                <c:if test="${username_duplicated_error}">
                  <div class="my-6 p-4 bg-red-300 text-grey-200 w-full shadow border rounded">
                    <div>Error, this username has been taken</div>
                  </div>
                </c:if>
              </div>
    
              <div class="my-6">
                <div>
                  Password
                  <span
                    class="text-red-600"
                    >*</span
                  >
                </div>
                <div>
                  <form:input
                    type="password"
                    path="password"
                    placeholder="Password"
                    class="outline-none border px-3 py-2 rounded-lg w-full"
                  />
                </div>
                <c:if test="${password_empty_error}">
                  <div class="my-6 p-4 bg-red-300 text-grey-200 w-full shadow border rounded">
                    <div>Error, your password is empty</div>
                  </div>
                </c:if>
              </div>
              <div class="my-6">
                <div>
                  Email
                  <span
                    class="text-red-600"
                    >*</span
                  >
                </div>
                <div>
                  <form:input
                    type="email"
                    path="email"
                    placeholder="Email"
                    class="outline-none border px-3 py-2 rounded-lg w-full"
                  />
                </div>
                <c:if test="${email_empty_error}">
                  <div class="my-6 p-4 bg-red-300 text-grey-200 w-full shadow border rounded">
                    <div>Error, your email is empty</div>
                  </div>
                </c:if>
                <c:if test="${email_duplicated_error}">
                  <div class="my-6 p-4 bg-red-300 text-grey-200 w-full shadow border rounded">
                    <div>Error, this email has been used</div>
                  </div>
                </c:if>
              </div>
              <div class="my-6">
                <div>
                  Phone Number
                  <span
                    class="text-red-600"
                    >*</span
                  >
                </div>
                <div>
                  <form:input
                    type="text"
                    path="phoneNumber"
                    placeholder="Phone Number"
                    class="outline-none border px-3 py-2 rounded-lg w-full"
                  />
                </div>
                <c:if test="${phoneNumber_empty_error}">
                  <div class="my-6 p-4 bg-red-300 text-grey-200 w-full shadow border rounded">
                    <div>Error, your email is empty</div>
                  </div>
                </c:if>
                <c:if test="${phone_number_duplicated_error}">
                  <div class="my-6 p-4 bg-red-300 text-grey-200 w-full shadow border rounded">
                    <div>Error, this phone number has been used</div>
                  </div>
                </c:if>
              </div>
              <div class="mt-6">
                <div>
                  User Role
                  <span
                    class="text-red-600"
                    >*</span
                  >
                </div>
                <div>
                  <div>
                  <form:checkbox
                    path="roles"
                    value="ROLE_ADMIN" /> Administrator
                  </div>
                  <div>
                    <form:checkbox
                    path="roles"
                    checked="checked"
                    readonly="true"
                    value="ROLE_USER" /> Normal User
                  </div>

              </div>
              <div class="my-3 pb-3 flex justify-between">
                <button
                  type="submit"
                  class="border border-slate-500 shadow-sm drop-shadow rounded-lg px-3 py-2 transition-all hover:scale-110 duration-500"
                >
                  Create
                </button>
              </div>
              </form:form>
            </div>
          </div>
        </div>
      </div>
    </div>
  </body>
</html>
