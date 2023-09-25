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
                <div class="py-3 px-6 border-b text-sm">Photo List</div>

                <div class="grid grid-cols-4 text-sm py-3 px-6 gap-12">
                    <c:forEach items="${photoList}" var="photo">
                        <form:form method="POST" action="./photos/delete/${photo.id}">
                            <div class="aspect-square w-full bg-slate-200 relative">
                                <img class="z-0 w-full h-full object-fit" src="data:image/png;base64,${photo.src}"/>
                                <button type="submit" data-photo-id="${photo.id}" class="absolute bottom-0 w-full bg-gray-700 h-12 text-white opacity-75 flex items-center justify-center"><svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-6 h-6">
                                    <path stroke-linecap="round" stroke-linejoin="round" d="M14.74 9l-.346 9m-4.788 0L9.26 9m9.968-3.21c.342.052.682.107 1.022.166m-1.022-.165L18.16 19.673a2.25 2.25 0 01-2.244 2.077H8.084a2.25 2.25 0 01-2.244-2.077L4.772 5.79m14.456 0a48.108 48.108 0 00-3.478-.397m-12 .562c.34-.059.68-.114 1.022-.165m0 0a48.11 48.11 0 013.478-.397m7.5 0v-.916c0-1.18-.91-2.164-2.09-2.201a51.964 51.964 0 00-3.32 0c-1.18.037-2.09 1.022-2.09 2.201v.916m7.5 0a48.667 48.667 0 00-7.5 0" />
                                </svg>
                                </button>
                            </div>
                        </form:form>

                    </c:forEach>

                </div>
            </div>
        </div>
    </div>
</div
</body>
</html>
