<html>
<head>
	<title>Login | Photoblog</title>
	<script src="https://cdn.tailwindcss.com"></script>
	<jsp:include page="/WEB-INF/jsp/component/styles/style.jsp"/>
</head>
<body class="bg-[#eeeeee]">
<jsp:include page="/WEB-INF/jsp/component/frontpage/navbar.jsp"/>
	<div id="panel" class="flex justify-center items-center w-full">
		<div
				id="container"
				class="w-3/5"
		>
			<c:if test="${delete == 'success'}">
				<div class="w-full bg-green-500 text-grey p-4 rounded-lg">You deleted your photo successfully</div>
			</c:if>


			<h1 class="text-xl my-6">My photos</h1>
					<div class="bg-white shadow rounded-sm">
						<c:if test="${photoList.size() == 0}">
							<div class="p-6">You didn't upload any photos</div>
						</c:if>
						<div
							class="grid grid-cols-4 gap-6 py-6 px-6"
						>
							<c:forEach items="${photoList}" var="p">
							<div class="flex items-center justify-center">
							<div>
								<a href="/photos/${p.id}">
									<div class="relative aspect-square bg-gray-100 rounded-md rounded-lg hover:opacity">
										<img src="data:image/png;base64, ${p.src}" class="object-cover w-full h-full" />
										<a href="/photos/delete/${p.id}">
										<div class="absolute w-full bottom-0 w-full bg-gray-700 h-12 text-white opacity-75 flex items-center justify-center"><svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-6 h-6">
											<path stroke-linecap="round" stroke-linejoin="round" d="M14.74 9l-.346 9m-4.788 0L9.26 9m9.968-3.21c.342.052.682.107 1.022.166m-1.022-.165L18.16 19.673a2.25 2.25 0 01-2.244 2.077H8.084a2.25 2.25 0 01-2.244-2.077L4.772 5.79m14.456 0a48.108 48.108 0 00-3.478-.397m-12 .562c.34-.059.68-.114 1.022-.165m0 0a48.11 48.11 0 013.478-.397m7.5 0v-.916c0-1.18-.91-2.164-2.09-2.201a51.964 51.964 0 00-3.32 0c-1.18.037-2.09 1.022-2.09 2.201v.916m7.5 0a48.667 48.667 0 00-7.5 0" />
										</svg>

									</div>
										</a>
									</div>
								</a>

							</div>
							</div>
							</c:forEach>

						</div>
					</div>
		</div></div>
			</div>
		</div>
	</body>
</html>
