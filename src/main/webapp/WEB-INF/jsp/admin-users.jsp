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
          <c:if test="${delete == 'fail'}">
            <div
              class="bg-red-600 rounded-lg px-3 py-3 text-white my-3 flex items-center"
            >
              <div id="icon" class="text-white mr-3">
                <svg
                  xmlns="http://www.w3.org/2000/svg"
                  fill="none"
                  viewBox="0 0 24 24"
                  stroke-width="1.5"
                  stroke="currentColor"
                  class="w-6 h-6"
                >
                  <path
                    stroke-linecap="round"
                    stroke-linejoin="round"
                    d="M12 9v3.75m9-.75a9 9 0 11-18 0 9 9 0 0118 0zm-9 3.75h.008v.008H12v-.008z"
                  />
                </svg>
              </div>
              <div>You cannot delete yourself</div>
            </div>
          </c:if>
          <c:if test="${add == 'success'}">
            <div
              class="bg-emerald-600 rounded-lg px-3 py-3 text-white my-3 flex items-center"
            >
              <div id="icon" class="text-white mr-3">
                <svg
                  xmlns="http://www.w3.org/2000/svg"
                  fill="none"
                  viewBox="0 0 24 24"
                  stroke-width="1.5"
                  stroke="currentColor"
                  class="w-6 h-6"
                >
                  <path
                    stroke-linecap="round"
                    stroke-linejoin="round"
                    d="M9 12.75L11.25 15 15 9.75M21 12a9 9 0 11-18 0 9 9 0 0118 0z"
                  />
                </svg>
              </div>
              <div>You have successfully created an new user.</div>
            </div>
          </c:if>
          <c:if test="${delete == 'success'}">
            <div
              class="bg-emerald-600 rounded-lg px-3 py-3 text-white my-3 flex items-center"
            >
              <div id="icon" class="text-white mr-3">
                <svg
                  xmlns="http://www.w3.org/2000/svg"
                  fill="none"
                  viewBox="0 0 24 24"
                  stroke-width="1.5"
                  stroke="currentColor"
                  class="w-6 h-6"
                >
                  <path
                    stroke-linecap="round"
                    stroke-linejoin="round"
                    d="M9 12.75L11.25 15 15 9.75M21 12a9 9 0 11-18 0 9 9 0 0118 0z"
                  />
                </svg>
              </div>
              <div>You have successfully deleted an user.</div>
            </div>
          </c:if>
          <div class="bg-white shadow rounded-sm mt-3">
            <div class="py-3 px-6 border-b text-sm">Manager users</div>

            <a href="/admin/users/add"
              ><div
                class="rounded bg-emerald-400 px-6 duration-500 text-emerald-800 py-2 mx-3 mt-3 max-w-fit text-sm shadow-lg hover:text-emerald-200 hover:bg-emerald-700"
              >
                + New User
              </div></a
            >
            <div id="users-table" class="px-6 py-6 space-y-6 text-sm">
              <table class="text-sm w-full">
                <thead>
                  <tr class="border-y">
                    <td class="w-2/12 h-12 p-3 border-r">User</td>
                    <td class="w-4/12 p-3 border-r">Role</td>
                    <td class="w-2/12 p-3 border-r">Telephone Number</td>
                    <td class="w-2/12 p-3 border-r">Email</td>
                    <td class="w-2/12 p-3">Action</td>
                  </tr>
                </thead>
                <tbody>
                  <c:forEach items="${Users}" var="user">
                    <tr class="border-b">
                      <td class="p-3 border-r"><a href="/admin/users/${user.username}">${user.username}</a></td>
                      <td class="p-3 border-r">
                        <c:forEach items="${user.roles}" var="role">
                          <span class="mx-1 text-sm rounded-lg border p-1"
                            >${role.role}</span
                          >
                        </c:forEach>
                      </td>
                      <td class="p-3 border-r">${user.phoneNumber}</td>
                      <td class="p-3 border-r">${user.email}</td>
                      <td class="p-3 flex gap-3">
                        <a href="/admin/users/edit/${user.username}">
                          <button type="submit">
                            <svg
                              xmlns="http://www.w3.org/2000/svg"
                              fill="none"
                              viewBox="0 0 24 24"
                              stroke-width="1.5"
                              stroke="currentColor"
                              class="w-4 h-4"
                            >
                              <path
                                stroke-linecap="round"
                                stroke-linejoin="round"
                                d="M16.862 4.487l1.687-1.688a1.875 1.875 0 112.652 2.652L10.582 16.07a4.5 4.5 0 01-1.897 1.13L6 18l.8-2.685a4.5 4.5 0 011.13-1.897l8.932-8.931zm0 0L19.5 7.125M18 14v4.75A2.25 2.25 0 0115.75 21H5.25A2.25 2.25 0 013 18.75V8.25A2.25 2.25 0 015.25 6H10"
                              />
                            </svg>
                          </button>
                        </a>
                        <form:form
                          action="/admin/users/delete"
                          method="POST"
                          class="m-0 p-0"
                        >
                          <input
                            type="hidden"
                            name="username"
                            value="${user.username}"
                          />
                          <button type="submit">
                            <svg
                              xmlns="http://www.w3.org/2000/svg"
                              fill="none"
                              viewBox="0 0 24 24"
                              stroke-width="1.5"
                              stroke="currentColor"
                              class="w-4 h-4"
                            >
                              <path
                                stroke-linecap="round"
                                stroke-linejoin="round"
                                d="M14.74 9l-.346 9m-4.788 0L9.26 9m9.968-3.21c.342.052.682.107 1.022.166m-1.022-.165L18.16 19.673a2.25 2.25 0 01-2.244 2.077H8.084a2.25 2.25 0 01-2.244-2.077L4.772 5.79m14.456 0a48.108 48.108 0 00-3.478-.397m-12 .562c.34-.059.68-.114 1.022-.165m0 0a48.11 48.11 0 013.478-.397m7.5 0v-.916c0-1.18-.91-2.164-2.09-2.201a51.964 51.964 0 00-3.32 0c-1.18.037-2.09 1.022-2.09 2.201v.916m7.5 0a48.667 48.667 0 00-7.5 0"
                              />
                            </svg>
                          </button>
                        </form:form>
                      </td>
                    </tr>
                  </c:forEach>
                </tbody>
              </table>
            </div>
          </div>
        </div>
      </div>
    </div>
  </body>
</html>
