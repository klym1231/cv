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
        <div class="py-3 px-6 border-b text-sm">Comments</div>

        <div id="users-table" class="px-6 py-6 space-y-6 text-sm">
          <table class="text-sm w-full">
            <thead>
            <tr class="border-y">

              <td class="w-5/12 p-3 border-r border-l">Comment</td>
              <td class="w-2/12 p-3 border-r ">User</td>
              <td class="w-2/12 p-3 border-r ">Created At</td>
              <td class="w-2/12 p-3 border-r ">Link</td>
              <td class="w-2/12 p-3 border-r">Action</td>
            </tr>
            </thead>
            <tbody>
            <c:if test="${comments.size() == 0}">
              <div class="p-6">Empty Comment</div>
            </c:if>
            <c:forEach items="${comments}" var="c">
              <tr class="border-b">


                <td class="p-3 border-r border-l">${c.description}</td>
                <td class="p-3 border-r">${c.username}</td>
                <td class="p-3 border-r">${c.date}</td>
                <td class="p-3 border-r text-blue-700 italic"><a href="/photos/${c.photoId}">Link to commented photo</a></td>
                <td class="p-3 border-r">
                  <form:form method="POST" action="./comments/delete/${c.id}" class="m-0 p-0">
                    <button type="submit" >
                      <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-4 h-4">
                        <path stroke-linecap="round" stroke-linejoin="round" d="M14.74 9l-.346 9m-4.788 0L9.26 9m9.968-3.21c.342.052.682.107 1.022.166m-1.022-.165L18.16 19.673a2.25 2.25 0 01-2.244 2.077H8.084a2.25 2.25 0 01-2.244-2.077L4.772 5.79m14.456 0a48.108 48.108 0 00-3.478-.397m-12 .562c.34-.059.68-.114 1.022-.165m0 0a48.11 48.11 0 013.478-.397m7.5 0v-.916c0-1.18-.91-2.164-2.09-2.201a51.964 51.964 0 00-3.32 0c-1.18.037-2.09 1.022-2.09 2.201v.916m7.5 0a48.667 48.667 0 00-7.5 0" />
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
