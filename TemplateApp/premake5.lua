project "TemplateApp"
   kind "ConsoleApp"
   language "C++"
   cppdialect "C++20"
   staticruntime "off"

   pchheader "stdafx.h"
   pchsource "../%{prj.name}/src/stdafx.cpp"

   files { "src/**.h", "src/**.cpp" }

   includedirs
   {
      "src/"
   }

   targetdir ("../bin/" .. outputdir .. "-%{prj.name}")
   objdir ("../bin-int/" .. outputdir .. "-%{prj.name}")

   filter "system:windows"
      systemversion "latest"
      defines { "WL_PLATFORM_WINDOWS" }
   filter "system:linux"
      systemversion "latest"
      defines { "WL_PLATFORM_LINUX" }

   filter "configurations:Debug"
      defines { "WL_DEBUG" }
      runtime "Debug"
      symbols "On"

   filter "configurations:Release"
      defines { "WL_RELEASE" }
      runtime "Release"
      optimize "On"
      symbols "On"

   filter "configurations:Dist"
      kind "WindowedApp"
      defines { "WL_DIST" }
      runtime "Release"
      optimize "Speed"
      symbols "Off"
