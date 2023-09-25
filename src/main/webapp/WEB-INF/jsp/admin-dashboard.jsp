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
          <div class="grid grid-cols-5 px-3 py-3 text-sm gap-12">
            <div class="bg-white shadow-md rounded-lg p-3 relative">
              <div
                class="absolute right-3 top-3 bg-red-300 rounded-full p-1 flex items-center justify-center"
              >
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
                    d="M21 8.25c0-2.485-2.099-4.5-4.688-4.5-1.935 0-3.597 1.126-4.312 2.733-.715-1.607-2.377-2.733-4.313-2.733C5.1 3.75 3 5.765 3 8.25c0 7.22 9 12 9 12s9-4.78 9-12z"
                  />
                </svg>
              </div>
              <div class="text-md">Likes</div>
              <div class="text-xs">Likes on your photo</div>
              <div class="text-2xl mt-3 font-bold">9999+</div>
              <div class="text-xs">Yesterday</div>
            </div>
            <div class="bg-white shadow-md rounded-lg p-3 relative">
              <div
                class="absolute right-3 top-3 bg-sky-300 rounded-full p-1 flex items-center justify-center"
              >
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
                    d="M7.5 8.25h9m-9 3H12m-9.75 1.51c0 1.6 1.123 2.994 2.707 3.227 1.129.166 2.27.293 3.423.379.35.026.67.21.865.501L12 21l2.755-4.133a1.14 1.14 0 01.865-.501 48.172 48.172 0 003.423-.379c1.584-.233 2.707-1.626 2.707-3.228V6.741c0-1.602-1.123-2.995-2.707-3.228A48.394 48.394 0 0012 3c-2.392 0-4.744.175-7.043.513C3.373 3.746 2.25 5.14 2.25 6.741v6.018z"
                  />
                </svg>
              </div>
              <div class="text-md">Comments</div>
              <div class="text-xs">Comments on your photo</div>
              <div class="text-2xl mt-3 font-bold">9999+</div>
              <div class="text-xs">Yesterday</div>
            </div>
            <div class="bg-white shadow-md rounded-lg p-3 relative">
              <div
                class="absolute right-3 top-3 bg-green-300 rounded-full p-1 flex items-center justify-center"
              >
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
              <div class="text-md">Photo</div>
              <div class="text-xs">Photo you have uploaded</div>
              <div class="text-2xl mt-3 font-bold">9999+</div>
              <div class="text-xs">Yesterday</div>
            </div>
            <div class="bg-white shadow-md rounded-lg p-3 relative">
              <div
                class="absolute right-3 top-3 bg-sky-300 rounded-full p-1 flex items-center justify-center"
              >
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
                    d="M7.5 8.25h9m-9 3H12m-9.75 1.51c0 1.6 1.123 2.994 2.707 3.227 1.129.166 2.27.293 3.423.379.35.026.67.21.865.501L12 21l2.755-4.133a1.14 1.14 0 01.865-.501 48.172 48.172 0 003.423-.379c1.584-.233 2.707-1.626 2.707-3.228V6.741c0-1.602-1.123-2.995-2.707-3.228A48.394 48.394 0 0012 3c-2.392 0-4.744.175-7.043.513C3.373 3.746 2.25 5.14 2.25 6.741v6.018z"
                  />
                </svg>
              </div>
              <div class="text-md">Comments</div>
              <div class="text-xs">Comments on your photo</div>
              <div class="text-2xl mt-3 font-bold">9999+</div>
              <div class="text-xs">Yesterday</div>
            </div>
          </div>
          <div class="bg-white shadow rounded-sm mt-3">
            <div class="py-3 px-6 border-b text-sm">
              Latest comments about your photo
            </div>
            <div id="comment-table" class="px-6 py-6 space-y-6 text-sm">
              <table class="text-sm w-full">
                <thead>
                  <tr class="border-y">
                    <td class="w-5/12 h-12 p-3 border-r">Photo</td>
                    <td class="w-4/12 p-3 border-r">Comment</td>
                    <td class="w-1/12 p-3 border-r">By</td>
                    <td class="w-2/12 p-3">Time</td>
                  </tr>
                </thead>
                <tbody>
                  <tr class="border-b">
                    <td class="flex items-center gap-6 p-3 border-r">
                      <img
                        class="object-fit-cover h-24 aspect-video"
                        src="https://r1.ilikewallpaper.net/iphone-wallpapers/download/27124/Paris-Night-France-City-Dark-Eiffel-Tower-iphone-wallpaper-ilikewallpaper_com_200.jpg"
                      />
                      <div class="p-3 space-y-3">
                        <div>
                          Lorem ipsum dolor sit amet consectetur, adipisicing
                          elit.
                        </div>
                        <div class="text-gray-500 text-xs">#95387</div>
                      </div>
                    </td>
                    <td class="p-3 border-r">The photo is great!</td>
                    <td class="p-3 border-r">David Chan</td>
                    <td class="p-3">2022-01-01 04:03</td>
                  </tr>
                  <tr class="border-b">
                    <td class="flex items-center gap-6 p-3 border-r">
                      <img
                        class="object-fit-cover h-24 aspect-video"
                        src="https://r1.ilikewallpaper.net/iphone-wallpapers/download/27124/Paris-Night-France-City-Dark-Eiffel-Tower-iphone-wallpaper-ilikewallpaper_com_200.jpg"
                      />
                      <div class="p-3 space-y-3">
                        <div>
                          Lorem ipsum dolor sit amet consectetur, adipisicing
                          elit.
                        </div>
                        <div class="text-gray-500 text-xs">#95387</div>
                      </div>
                    </td>
                    <td class="p-3 border-r">The photo is great!</td>
                    <td class="p-3 border-r">David Chan</td>
                    <td class="p-3">2022-01-01 04:03</td>
                  </tr>
                  <tr class="border-b">
                    <td class="flex items-center gap-6 p-3 border-r">
                      <img
                        class="object-fit-cover h-24 aspect-video"
                        src="https://r1.ilikewallpaper.net/iphone-wallpapers/download/27124/Paris-Night-France-City-Dark-Eiffel-Tower-iphone-wallpaper-ilikewallpaper_com_200.jpg"
                      />
                      <div class="p-3 space-y-3">
                        <div>
                          Lorem ipsum dolor sit amet consectetur, adipisicing
                          elit.
                        </div>
                        <div class="text-gray-500 text-xs">#95387</div>
                      </div>
                    </td>
                    <td class="p-3 border-r">The photo is great!</td>
                    <td class="p-3 border-r">David Chan</td>
                    <td class="p-3">2022-01-01 04:03</td>
                  </tr>
                  <tr class="border-b">
                    <td class="flex items-center gap-6 p-3 border-r">
                      <img
                        class="object-fit-cover h-24 aspect-video"
                        src="https://r1.ilikewallpaper.net/iphone-wallpapers/download/27124/Paris-Night-France-City-Dark-Eiffel-Tower-iphone-wallpaper-ilikewallpaper_com_200.jpg"
                      />
                      <div class="p-3 space-y-3">
                        <div>
                          Lorem ipsum dolor sit amet consectetur, adipisicing
                          elit.
                        </div>
                        <div class="text-gray-500 text-xs">#95387</div>
                      </div>
                    </td>
                    <td class="p-3 border-r">The photo is great!</td>
                    <td class="p-3 border-r">David Chan</td>
                    <td class="p-3">2022-01-01 04:03</td>
                  </tr>
                  <tr class="border-b">
                    <td class="flex items-center gap-6 p-3 border-r">
                      <img
                        class="object-fit-cover h-24 aspect-video"
                        src="https://r1.ilikewallpaper.net/iphone-wallpapers/download/27124/Paris-Night-France-City-Dark-Eiffel-Tower-iphone-wallpaper-ilikewallpaper_com_200.jpg"
                      />
                      <div class="p-3 space-y-3">
                        <div>
                          Lorem ipsum dolor sit amet consectetur, adipisicing
                          elit.
                        </div>
                        <div class="text-gray-500 text-xs">#95387</div>
                      </div>
                    </td>
                    <td class="p-3 border-r">The photo is great!</td>
                    <td class="p-3 border-r">David Chan</td>
                    <td class="p-3">2022-01-01 04:03</td>
                  </tr>
                </tbody>
              </table>
            </div>
            <div
              id="page-navigation"
              class="py-6 px-6 flex justify-between items-center text-sm"
            >
              <div>Showing 1 to 5 entries</div>
              <div class="max-w-fit text-sm flex border rounded-lg">
                <button type="button" class="py-2 px-3 hover:bg-slate-100">
                  Previous
                </button>
                <button
                  type="button"
                  class="py-2 h-10 aspect-square hover:bg-slate-100"
                >
                  1
                </button>
                <button
                  type="button"
                  class="py-2 h-10 aspect-square hover:bg-slate-100"
                >
                  2
                </button>
                <button
                  type="button"
                  class="py-2 h-10 aspect-square hover:bg-slate-100"
                >
                  3
                </button>
                <button
                  type="button"
                  class="py-2 h-10 aspect-square hover:bg-slate-100"
                >
                  4
                </button>
                <button
                  type="button"
                  class="py-2 h-10 aspect-square hover:bg-slate-100"
                >
                  5
                </button>
                <button
                  type="button"
                  class="py-2 h-10 aspect-square hover:bg-slate-100"
                >
                  6
                </button>
                <button
                  type="button"
                  class="py-2 h-10 aspect-square hover:bg-slate-100"
                >
                  7
                </button>
                <button
                  type="button"
                  class="py-2 h-10 aspect-square hover:bg-slate-100"
                >
                  8
                </button>
                <button
                  type="button"
                  class="py-2 h-10 aspect-square hover:bg-slate-100"
                >
                  9
                </button>
                <button
                  type="button"
                  class="py-2 h-10 aspect-square hover:bg-slate-100"
                >
                  10
                </button>
                <button
                  type="button"
                  class="py-2 px-3 hover:bg-slate-100 rounded-r-lg"
                >
                  Next
                </button>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </body>
</html>
