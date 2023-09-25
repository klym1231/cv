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
            <div class="py-3 px-6 border-b text-sm">Photo History</div>

            <div id="users-table" class="px-6 py-6 space-y-6 text-sm">
              <table class="text-sm w-full">
                <thead>
                  <tr class="border-y">
                    <td class="w-1/12 p-3 border-r">
                      <div class="flex justify-center">Photo</div>
                    </td>
                    <td class="w-1/12 p-3 border-r">
                      <div class="flex justify-center">User</div>
                    </td>
                    <td class="w-5/12 p-3 border-r">Description</td>
                    <td class="w-2/12 p-3">Created At</td>
                  </tr>
                </thead>
                <tbody>
                  <c:if test="${photoList.size() == 0}">
                    <div class="p-6">Empty history</div>
                  </c:if>
                  <c:forEach items="${photoList}" var="p">
                    <tr class="border-b">
                      <td class="p-3 border-r">
                        <a href="/photos/${p.id}">
                          <div
                            class="relative aspect-square rounded-md rounded-lg hover:opacity"
                          >
                            <img
                              src="data:image/png;base64, ${p.src}"
                              class="object-cover w-full h-full"
                            />
                            <center class="text-xs">(#${p.id})</center>
                          </div>
                        </a>
                      </td>
                      <td class="p-3 border-r">
                        <div class="flex justify-center">${p.username}</div>
                      </td>

                      <td class="p-3 border-r">${p.description}</td>
                      <td class="p-3 border-r">${p.date}</td>
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
