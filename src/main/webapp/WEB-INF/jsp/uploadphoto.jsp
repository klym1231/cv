<html>
<head>
	<title>Upload Photo | Photoblog</title>
	<script src="https://cdn.tailwindcss.com"></script>
	<jsp:include page="/WEB-INF/jsp/component/styles/style.jsp"/>
</head>
<body class="bg-[#fafafa]">
<jsp:include page="/WEB-INF/jsp/component/frontpage/navbar.jsp"/>
<div id="panel" class="flex justify-center w-full">
			<div
					id="container"
					class="sm:w-4/5 md:w-3/5 lg:w-3/5"
			>
				<h1 class="text-xl my-6">Upload photo</h1>
					<div class="bg-white shadow rounded-sm">
						<form:form method="POST" enctype="multipart/form-data" modelAttribute="photoForm"  >
							<div
								id="form"
								class="px-6 py-6 space-y-6 text-sm"
							>
								<label for="photo">
								<div class="border-dashed border-2 w-full h-80 border flex items-center justify-center text-sm text-slate-700 cursor-pointer">
									Click here to upload photo (accept png, gif, ipeg)
								</div></label>
								<div
									class="flex items-center hidden"
								>

									<div
										class="w-1/5"
									>
										Photo*
									</div>
									<div
										class="w-3/5"
									>
										<input
											name="attachment"
											type="file"
											id="photo"
											accept="image/png, image/gif, image/jpeg"
										/> 
									</div>
								</div>
								<div
									class="flex items-center"
								>
									<div
										class="w-1/5"
									>
										Preview
									</div>
								<div class="w-3/5 flex items-center justify-center">
									<img
										id="preview"
										class="w-3/5 border-0 object-cover"
									/>
								</div>

								</div>
								<div
									class="flex items-center"
								>
									<div
										class="w-1/5"
									>
										Description *
									</div>
									<div
										class="w-3/5"
									>
										<form:input
											type="text"
											class="outline-none border px-3 py-2 rounded-lg w-full"
											required="required"
											path="description"
										/>
									</div>
								</div>
								<div
									class="flex justify-end"
								>
									<button
										type="submit"
										class="border border-slate-500 rounded-lg px-3 py-2 transition-all hover:scale-110 duration-500"
									>
										Submit
									</button>
								</div>
							</div>
						</form:form>
					</div>
				</div>
			</div>
		</div>
	<jsp:include page="/WEB-INF/jsp/component/frontpage/footer.jsp"/>
	</body>
</html>
<script>
	document.querySelector("input#photo").addEventListener("change", (e)=>{
		const image = document.querySelector("img#preview")
		image.src = URL.createObjectURL(e.target.files[0]);
	})

</script>

