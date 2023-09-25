<%-- Created by IntelliJ IDEA. User: David Date: 2023/3/20 Time: 下午 09:52 To
change this template use File | Settings | File Templates. --%> <%@ page
contentType="text/html;charset=UTF-8" language="java" %>
<div id="navgiation" class="w-[250px] h-full bg-[#2c3e50] fixed left-0">
  <div class="flex items-start justify-center">
    <div
      id="navgiation-container"
      class="text-white py-3 w-full space-y-3 text-sm"
    >
      <a href="/">
        <div class="text-center py-6 px-12">PhotoBlog</div>
      </a>
<%--      <a href="/admin/dashboard" class="text-xs">--%>
<%--        <div--%>
<%--          class="flex items-center py-2 px-8 hover:bg-sky-700 duration-500 transition-all"--%>
<%--        >--%>
<%--          <div class="mr-2.5">--%>
<%--            <svg--%>
<%--              xmlns="http://www.w3.org/2000/svg"--%>
<%--              fill="none"--%>
<%--              viewBox="0 0 24 24"--%>
<%--              stroke-width="1.5"--%>
<%--              stroke="currentColor"--%>
<%--              class="w-6 h-6"--%>
<%--            >--%>
<%--              <path--%>
<%--                stroke-linecap="round"--%>
<%--                stroke-linejoin="round"--%>
<%--                d="M10.5 6a7.5 7.5 0 107.5 7.5h-7.5V6z"--%>
<%--              />--%>
<%--              <path--%>
<%--                stroke-linecap="round"--%>
<%--                stroke-linejoin="round"--%>
<%--                d="M13.5 10.5H21A7.5 7.5 0 0013.5 3v7.5z"--%>
<%--              />--%>
<%--            </svg>--%>
<%--          </div>--%>
<%--          <div class="">Dashboard</div>--%>
<%--        </div>--%>
<%--      </a>--%>
      <a href="/admin/users" class="text-xs">
        <div
          class="flex items-center py-2 px-8 hover:bg-sky-700 duration-500 transition-all"
        >
          <div class="mr-2.5">
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
                d="M15.75 6a3.75 3.75 0 11-7.5 0 3.75 3.75 0 017.5 0zM4.501 20.118a7.5 7.5 0 0114.998 0A17.933 17.933 0 0112 21.75c-2.676 0-5.216-.584-7.499-1.632z"
              />
            </svg>
          </div>
          <div class="">Users</div>
        </div>
      </a>
      <a href="/admin/photos" class="text-xs">
        <div
          class="flex items-center py-2 px-8 hover:bg-sky-700 duration-500 transition-all"
        >
          <div class="mr-2.5">
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
                d="M2.25 15.75l5.159-5.159a2.25 2.25 0 013.182 0l5.159 5.159m-1.5-1.5l1.409-1.409a2.25 2.25 0 013.182 0l2.909 2.909m-18 3.75h16.5a1.5 1.5 0 001.5-1.5V6a1.5 1.5 0 00-1.5-1.5H3.75A1.5 1.5 0 002.25 6v12a1.5 1.5 0 001.5 1.5zm10.5-11.25h.008v.008h-.008V8.25zm.375 0a.375.375 0 11-.75 0 .375.375 0 01.75 0z"
              />
            </svg>
          </div>
          <div class="">Photos</div>
        </div>
      </a>
      <a href="/admin/photo_history" class="text-xs">
        <div
                class="flex items-center py-2 px-8 hover:bg-sky-700 duration-500 transition-all"
        >
          <div class="mr-2.5">
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
                      d="M2.25 15.75l5.159-5.159a2.25 2.25 0 013.182 0l5.159 5.159m-1.5-1.5l1.409-1.409a2.25 2.25 0 013.182 0l2.909 2.909m-18 3.75h16.5a1.5 1.5 0 001.5-1.5V6a1.5 1.5 0 00-1.5-1.5H3.75A1.5 1.5 0 002.25 6v12a1.5 1.5 0 001.5 1.5zm10.5-11.25h.008v.008h-.008V8.25zm.375 0a.375.375 0 11-.75 0 .375.375 0 01.75 0z"
              />
            </svg>
          </div>
          <div class="">Photo History</div>
        </div>
      </a>
      <a href="/admin/comments" class="text-xs">
        <div
          class="flex items-center py-2 px-8 hover:bg-sky-700 duration-500 transition-all"
        >
          <div class="mr-2.5">
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
                d="M19.5 14.25v-2.625a3.375 3.375 0 00-3.375-3.375h-1.5A1.125 1.125 0 0113.5 7.125v-1.5a3.375 3.375 0 00-3.375-3.375H8.25m2.25 0H5.625c-.621 0-1.125.504-1.125 1.125v17.25c0 .621.504 1.125 1.125 1.125h12.75c.621 0 1.125-.504 1.125-1.125V11.25a9 9 0 00-9-9z"
              />
            </svg>
          </div>
          <div class="">Comments</div>
        </div>
      </a>
      <a href="/logout" class="text-xs">
        <div
          class="flex items-center py-2 px-8 hover:bg-sky-700 duration-500 transition-all"
        >
          <div class="mr-2.5">
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
                d="M15.75 9V5.25A2.25 2.25 0 0013.5 3h-6a2.25 2.25 0 00-2.25 2.25v13.5A2.25 2.25 0 007.5 21h6a2.25 2.25 0 002.25-2.25V15M12 9l-3 3m0 0l3 3m-3-3h12.75"
              />
            </svg>
          </div>
          <div class="">Logout</div>
        </div>
      </a>
    </div>
  </div>
</div>
