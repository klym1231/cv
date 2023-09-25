<html>
  <head>
    <title>${User.username}'s Profile | Photoblog</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <jsp:include page="/WEB-INF/jsp/component/styles/style.jsp" />
  </head>
  <body class="bg-[#fafafa]">
    <jsp:include page="/WEB-INF/jsp/component/frontpage/navbar.jsp" />

    <div id="photo-gallery" class="flex justify-center w-full">
      <div id="user-container" class="w-3/5 bg-white">
        <div
          class="flex flex-col items-center space-y-6 border rounded-lg shadow-lg py-6"
        >
          <img
            class="rounded-full w-24 aspect-square"
            src="https://cdn3.iconfinder.com/data/icons/google-material-design-icons/48/ic_timer_auto_48px-512.png"
          />
          <div>
            <div class="text-xl">${User.username}</div>
            <div class="text-sm">@${User.username}</div>
          </div>

          <div class="text-xl px-6 border-b py-2 border-slate-400">
            About me
          </div>
          <div class="text-center w-4/5 leading">${User.description}</div>
          <div class="space-y-3">
            <div id="email" class="flex items-center gap-3">
              <div>
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
                    d="M2.25 13.5h3.86a2.25 2.25 0 012.012 1.244l.256.512a2.25 2.25 0 002.013 1.244h3.218a2.25 2.25 0 002.013-1.244l.256-.512a2.25 2.25 0 012.013-1.244h3.859m-19.5.338V18a2.25 2.25 0 002.25 2.25h15A2.25 2.25 0 0021.75 18v-4.162c0-.224-.034-.447-.1-.661L19.24 5.338a2.25 2.25 0 00-2.15-1.588H6.911a2.25 2.25 0 00-2.15 1.588L2.35 13.177a2.25 2.25 0 00-.1.661z"
                  />
                </svg>
              </div>
              <div>${User.email}</div>
            </div>
            <div id="phoneNumber" class="flex items-center gap-3">
              <div>
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
                    d="M10.5 1.5H8.25A2.25 2.25 0 006 3.75v16.5a2.25 2.25 0 002.25 2.25h7.5A2.25 2.25 0 0018 20.25V3.75a2.25 2.25 0 00-2.25-2.25H13.5m-3 0V3h3V1.5m-3 0h3m-3 18.75h3"
                  />
                </svg>
              </div>
              <div>${User.phoneNumber}</div>
            </div>
          </div>
          <div class="text-xl px-6 border-b py-2 border-slate-400">Gallery</div>
          <div class="text-center w-4/5 leading">
            <div class="grid grid-cols-3 gap-6 py-6 px-6">
              <c:forEach items="${photoList}" var="photo">
                <a href="/photos/${photo.id}">
                  <div class="aspect-square bg-gray-100 rounded-md">
                    <img
                      src="data:image/png;base64, ${photo.src}"
                      class="object-cover w-full h-full"
                    />
                  </div>
                </a>
              </c:forEach>
            </div>
          </div>
        </div>
      </div>
    </div>

    <div id="footer" class="flex items-center w-full justify-center h-16 mt-3">
      <div class="w-4/5 text-sm">
        &copy; PhotoBlog, 2023. All rights reserved.
      </div>
    </div>
  </body>
</html>
<script></script>
