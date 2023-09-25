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

          <div class="mb-24 py-6 shadow">
            <div class="py-3 px-6 border-b text-sm">User Detail</div>
          <table class="text-sm">
          <tr">
            <td class="p-3">Username:</td><td> ${User.username}</td>
          </tr>
            <tr>
            <td class="p-3">Email: </td><td>${User.email}</td>
            </tr>
            <tr>
            <td class="p-3">Phone Number: </td><td>${User.phoneNumber}</td>
          </tr>
          </table>
          </div>
          <div class="bg-white shadow rounded-sm mt-3">
            <div class="py-3 px-6 border-b text-sm border-t">Comments History</div>

            <div id="users-table" class="px-6 py-6 space-y-6 text-sm">
              <table class="text-sm w-full">
                <thead>
                  <tr class="border-y">

                    <td class="w-5/12 p-3 border-r border-l">Comment</td>
                    <td class="w-2/12 p-3">Created At</td>
                    <td class="w-2/12 p-3">Link</td>
                  </tr>
                </thead>
                <tbody>
                  <c:if test="${CommentHistory.size() == 0}">
                    <div class="p-6">Empty history</div>
                  </c:if>
                  <c:forEach items="${CommentHistory}" var="c">
                    <tr class="border-b">


                      <td class="p-3 border-r border-l">${c.description}</td>
                      <td class="p-3 border-r">${c.date}</td>
                      <td class="p-3 border-r text-blue-700 italic"><a href="/photos/${c.photoId}">Link to commented photo</a></td>
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
