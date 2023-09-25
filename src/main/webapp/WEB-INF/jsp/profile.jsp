<html>
  <head>
    <title>Profile | Photoblog</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <jsp:include page="/WEB-INF/jsp/component/styles/style.jsp" />
  </head>
  <body class="bg-[#eeeeee]">
    <jsp:include page="/WEB-INF/jsp/component/frontpage/navbar.jsp" />
    <div id="panel" class="flex justify-center w-full">
      <div id="container" class="sm:w-4/5 md:w-3/5 lg:w-3/5">
        <h1 class="text-xl my-6">Edit your personal information</h1>
        <c:if test="${Success == true}">
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
            <div>You have successfully changed your profile.</div>
          </div>
        </c:if>
        <div class="bg-white shadow-lg rounded-lg py-3 px-6">
          <form:form method="POST">
            <div class="px-6 py-6 space-y-6 text-sm">
              <div class="flex items-center">
                <div class="w-1/5">Email</div>
                <div class="w-3/5">${User.getEmail()}</div>
              </div>
              <div class="flex items-center">
                <div class="w-1/5">Username</div>
                <div class="w-3/5">${User.getUsername()}</div>
              </div>
              <hr />
              <div class="flex items-center">
                <div class="w-1/5">About you</div>
                <div class="w-3/5">
                  <input
                    name="description"
                    type="text"
                    value="${User.description}"
                    class="outline-none border px-3 py-2 rounded-lg w-full"
                  />
                </div>
              </div>
              <div class="flex justify-end">
                <button
                  type="submit"
                  class="border border-slate-500 rounded-lg px-3 py-2 transition-all hover:scale-110 duration-500"
                >
                  Submit
                </button>
              </div>
            </div>
          </form:form>
          <a
            href="/profile/user/${User.username}"
            class="text-sm italic underline"
            >Click here to view my profile</a
          >
        </div>
      </div>
    </div>
    <jsp:include page="/WEB-INF/jsp/component/frontpage/footer.jsp" />
  </body>
</html>
