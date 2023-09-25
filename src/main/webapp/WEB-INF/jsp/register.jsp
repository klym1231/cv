<html>
	<head>
		<title>Register | Photoblog</title>
		<script src="https://cdn.tailwindcss.com"></script>
		<jsp:include page="/WEB-INF/jsp/component/styles/style.jsp"/>
	</head>
	<body class="bg-[#fafafa]">
	<jsp:include page="/WEB-INF/jsp/component/frontpage/navbar.jsp"/>

		<div id="login-panel" class="flex justify-center w-full">
			<div
				id="photo-container"
				class="sm:w-4/5 md:w-3/5 lg:w-2/5"
			>
				<h1 class="text-xl my-6">
					Create your account
				</h1>
				<div
					class="bg-white rounded-lg shadow-lg py-3 px-6"
				>
					<form:form method="POST">
					<div class="my-3">
						<div>
							Username
							<span
								class="text-red-600"
								>*</span
							>
						</div>
						<div>
							<input
								type="text"
								name="username"
								placeholder="Username"
								class="outline-none border px-3 py-2 rounded-lg w-full"
							/>
						</div>
						<c:if test="${username_empty_error}">
							<div class="my-6 p-4 bg-red-300 text-grey-200 w-full shadow border rounded">
								<div>Error, Your username is empty</div>
							</div>
						</c:if>
						<c:if test="${username_duplicated_error}">
							<div class="my-6 p-4 bg-red-300 text-grey-200 w-full shadow border rounded">
								<div>Error, this username has been taken</div>
							</div>
						</c:if>
					</div>

					<div class="my-6">
						<div>
							Password
							<span
								class="text-red-600"
								>*</span
							>
						</div>
						<div>
							<input
								type="password"
								name="password"
								placeholder="Password"
								class="outline-none border px-3 py-2 rounded-lg w-full"
							/>
						</div>
						<c:if test="${password_empty_error}">
							<div class="my-6 p-4 bg-red-300 text-grey-200 w-full shadow border rounded">
								<div>Error, your password is empty</div>
							</div>
						</c:if>
					</div>
					<div class="my-6">
						<div>
							Confirmation Password:
							<span
								class="text-red-600"
								>*</span
							>
						</div>
						<div>
							<input
								type="password"
								name="confirmation_password"
								placeholder="Confirmation Password"
								class="outline-none border px-3 py-2 rounded-lg w-full"
							/>
						</div>
						<c:if test="${confirmation_password_empty_error}">
							<div class="my-6 p-4 bg-red-300 text-grey-200 w-full shadow border rounded">
								<div>Error, your confirmation password is empty</div>
							</div>
						</c:if>
					</div>
					<div class="my-6">
						<div>
							Email
							<span
								class="text-red-600"
								>*</span
							>
						</div>
						<div>
							<input
								type="email"
								name="email"
								placeholder="Email"
								class="outline-none border px-3 py-2 rounded-lg w-full"
							/>
						</div>
						<c:if test="${email_empty_error}">
							<div class="my-6 p-4 bg-red-300 text-grey-200 w-full shadow border rounded">
								<div>Error, your email is empty</div>
							</div>
						</c:if>
						<c:if test="${email_duplicated_error}">
							<div class="my-6 p-4 bg-red-300 text-grey-200 w-full shadow border rounded">
								<div>Error, this email has been used</div>
							</div>
						</c:if>
					</div>
					<div class="my-6">
						<div>
							Phone Number
							<span
								class="text-red-600"
								>*</span
							>
						</div>
						<div>
							<input
								type="text"
								name="number"
								placeholder="Phone Number"
								class="outline-none border px-3 py-2 rounded-lg w-full"
							/>
						</div>
						<c:if test="${phoneNumber_empty_error}">
							<div class="my-6 p-4 bg-red-300 text-grey-200 w-full shadow border rounded">
								<div>Error, your email is empty</div>
							</div>
						</c:if>
						<c:if test="${phone_number_duplicated_error}">
							<div class="my-6 p-4 bg-red-300 text-grey-200 w-full shadow border rounded">
								<div>Error, this phone number has been used</div>
							</div>
						</c:if>
					</div>
					<div class="my-6 flex justify-between">
						<button
							type="submit"
							class="border border-slate-500 shadow-sm drop-shadow rounded-lg px-3 py-2 transition-all hover:scale-110 duration-500"
						>
							Register
						</button>
					</div>
					</form:form>
					<a
						href="/login"
						class="underline text-sm pb-6"
						>Already have an account?</a
					>
				</div>
			</div>
		</div>

		<div
			id="footer"
			class="flex items-center w-full justify-center h-16"
		>
			<div class="w-4/5 text-sm">
				&copy; PhotoBlog, 2023. All rights reserved.
			</div>
		</div>
	</body>
</html>
