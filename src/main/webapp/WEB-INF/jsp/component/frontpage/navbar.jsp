<%-- Created by IntelliJ IDEA. User: David Date: 2023/3/16 Time: 下午 09:37 To
change this template use File | Settings | File Templates. --%> <%@ page
contentType="text/html;charset=UTF-8" language="java" %>
<div id="nav" class="h-24 bg-slate-0 shadow-lg mb-6 bg-white">
  <div class="flex h-full justify-between items-center">
    <div class="ml-12">
      <a href="/">
        <img src="/images/logo.png" alt="My Image" />
      </a>
    </div>
    <div class="mr-12 flex gap-8 text-sm items-center">
      <a class="hover:border-b px-2 py-2 border-slate-500" href="/">Home</a>
      <security:authorize access="!hasAnyRole('USER', 'ADMIN')">
        <a class="hover:border-b px-2 py-2 border-slate-500" href="/signin">
          Login / Register
        </a>
      </security:authorize>
      <security:authorize access="hasAnyRole('USER', 'ADMIN')">
        <a
          class="hover:border-b px-2 py-2 border-slate-500"
          href="/photos/upload"
          >Upload photo</a
        >
        <a class="hover:border-b px-2 py-2 border-slate-500" href="/photos/my"
          >My photos</a
        >
        <a class="hover:border-b px-2 py-2 border-slate-500" href="/profile/my"
          >Profile</a
        >
        <security:authorize access="hasAnyRole('ADMIN')">
          <a
            class="hover:border-b px-2 py-2 border-slate-500"
            href="/admin/users"
            >Manage website</a
          >
        </security:authorize>
        <div>
          <form action="/logout" method="POST" class="m-0 p-0">
            <input
              type="hidden"
              name="${_csrf.parameterName}"
              value="${_csrf.token}"
            />
            <button
              type="submit"
              class="hover:border-b px-2 py-2 border-slate-500 m-0"
            >
              Logout
            </button>
          </form>
        </div>
      </security:authorize>
    </div>
  </div>
</div>
