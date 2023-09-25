<!DOCTYPE html>
<html>
  <head>
    <title>Photoblog</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <jsp:include page="/WEB-INF/jsp/component/styles/style.jsp" />
  </head>
  <body class="bg-[#fafafa]">
    <jsp:include page="/WEB-INF/jsp/component/frontpage/navbar.jsp" />
    <div id="photo-gallery" class="flex justify-center w-full">
      <div id="photo-container" class="w-4/5">
        <div class="grid grid-cols-4 gap-3">
          <c:forEach items="${photo}" var="p">
            <div class="items-center justify-center">
              <a href="/photos/${p.id}">
                <img src="data:image/png;base64, ${p.src}" class="w-full" />
              </a>
              <div id="avatar" class="bg-white rounded-b-lg">
                <a href="./profile/user/${p.username}">
                  <div class="flex items-center gap-3 p-3 relative">
                    <img
                      src="https://cdn3.iconfinder.com/data/icons/google-material-design-icons/48/ic_timer_auto_48px-512.png"
                      class="rounded-full w-12 h-12"
                    />
                    <div id="user">
                      <div class="sm">${p.username}</div>
                      <div class="text-xs">@${p.username}</div>
                    </div>
                  </div>
                </a>
              </div>
            </div>
          </c:forEach>
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
