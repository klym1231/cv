<%--
  Created by IntelliJ IDEA.
  User: David
  Date: 2023/3/21
  Time: 上午 12:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div id="nav" class="h-16 bg-slate-0 shadow-md bg-white">
  <div class="flex h-full justify-between items-center">
    <div class="ml-12">Dashboard</div>
    <div class="mr-12 flex gap-8 text-sm">
      <a
              class="hover:scale-125 transition-all duration-500 px-2 py-2 border-slate-500"
              href="/logout"
      >
        <div class="flex items-center space-x-3">
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
                      d="M15.75 9V5.25A2.25 2.25 0 0013.5 3h-6a2.25 2.25 0 00-2.25 2.25v13.5A2.25 2.25 0 007.5 21h6a2.25 2.25 0 002.25-2.25V15M12 9l-3 3m0 0l3 3m-3-3h12.75"
              />
            </svg>
          </div>
          <div>Logout</div>
        </div>
      </a>
    </div>
  </div>
</div>