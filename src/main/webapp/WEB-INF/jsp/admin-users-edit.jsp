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
            <div class="py-3 px-6 border-b text-sm font-bold">Update User Information</div>
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
                    readonly="true"

                    value="${User.username}"
                    class="outline-none border px-3 py-2 rounded-lg w-full"
                  />
                </div>
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
                    placeholder="Leave blank if no changes" 
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
                    value="${User.email}"
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
                    value="${User.phoneNumber}"
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
                    <c:forEach items="${User.roles}" var="role">

                      <c:if test="${role.role == 'ROLE_ADMIN'}">
                        <c:set var="ADMIN_FLAG" value="checked" />
                      </c:if>
                      <c:if test="${role.role == 'ROLE_USER'}">
                        <c:set var="USER_FLAG" value="checked" />
                      </c:if>
                    </c:forEach>
                  <form:checkbox
                    path="roles"
                    checked="${ADMIN_FLAG}"
                    value="ROLE_ADMIN" /> Administrator
                  </div>
                  <div>
                    <form:checkbox
                    path="roles"
                    checked="${USER_FLAG}"
                    value="ROLE_USER" /> Normal User
                  </div>

              </div>
              <div class="my-3 pb-3 flex justify-between">
                <button
                  type="submit"
                  class="border border-slate-500 shadow-sm drop-shadow rounded-lg px-3 py-2 transition-all hover:scale-110 duration-500"
                >
                Update
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
