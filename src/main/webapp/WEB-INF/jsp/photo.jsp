<html>
  <head>
    <title>Photo | Photoblog</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <jsp:include page="/WEB-INF/jsp/component/styles/style.jsp" />
  </head>
  <body class="bg-[#eeeeee]">
    <jsp:include page="/WEB-INF/jsp/component/frontpage/navbar.jsp" />
    <div id="panel" class="flex justify-center w-full">
      <div id="container" class="sm:w-4/5 md:w-4/5 lg:w-4/5">
        <div class="bg-white shadow-lg rounded-lg flex justify-between">
          <div
            class=" px-6 w-full flex justify-center rounded-lg"
          >
            <img
              class="object-contain"
              src="data:image/png;base64, ${img}"
              alt="picture"
            />
          </div>
          <div class="px-6 w-full space-y-6 text-sm border bg-slate-100">
            <div id="avatar">
              <a href="/profile/user/${photo.username}">
              <div class="flex items-center gap-3 m-3 relative">
                <img
                  src="https://cdn3.iconfinder.com/data/icons/google-material-design-icons/48/ic_timer_auto_48px-512.png"
                  class="rounded-full w-12 h-12"
                />
                
                <div id="user">
                  <div class="sm">${photo.username}</div>
                  <div class="text-xs">@${photo.username}</div>
                </div>
                <hr>

              </div></a>
            </div>
            <span class="text-xs text-slate-600">Posted at ${photo.date}</span>
            <div class="text-lg bg-white h-40 p-4">${photo.description}</div>
            <div id="comment-box" class="space-y-3">
              <div class="font-bold text-lg">Comment</div>
              <security:authorize access="hasAnyRole('USER', 'ADMIN')">
                <form:form method="POST" action="/photos/${photo.id}/comment/create">
                  <div class="relative">
                    <input name="comment" type="text" class="outline-none border px-3 pr-9 py-2 rounded-lg w-full" required="required">
                    <button
                      type="submit"
                      class="absolute right-0 h-full rounded-lg px-2 transition-all hover:scale-110 duration-500"><svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-6 h-6">
                        <path stroke-linecap="round" stroke-linejoin="round" d="M6 12L3.269 3.126A59.768 59.768 0 0121.485 12 59.77 59.77 0 013.27 20.876L5.999 12zm0 0h7.5" />
                      </svg>
                      </button>
                  </div>
              </form:form>
              </security:authorize>
              <security:authorize access="!hasAnyRole('USER', 'ADMIN')">
                <div class="font-bold">
                  You should
                  <a href="/signin" class="text-slate-400">login</a> first to
                  leave your comment.
                </div>
              </security:authorize>
              <hr>
              <div class="space-y-3 pb-9">

                  <c:forEach items="${comments}" var="comment">
                      <div class="bg-white px-2 py-2 rounded-lg shadow">
                      <div class="space-y-3"><span class="font-bold">${comment.username}</span> • <span class="text-sm text-gray-500">${comment.date}</span></div>
                      <div class="text-sm">${comment.description}</div>
                    </div>
                  </c:forEach>
                  

              </div>
            </div>
          </div>
          <div></div>
        </div>
      </div>
    </div>
    <jsp:include page="/WEB-INF/jsp/component/frontpage/footer.jsp" />
  </body>
</html>
