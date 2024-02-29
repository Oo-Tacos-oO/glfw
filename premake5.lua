-- Tools lib --

project "GLFW"
	kind "StaticLib"
	language "C"
	staticruntime "off"
	systemversion "latest"

	targetdir (binariesDir .. "/%{prj.name}")
	objdir (binariesIntermediateDir .. "/%{prj.name}")

	files {
		"src/**.h",
		"src/**.c",

		"include/GLFW/**.h"
	}
	removefiles {
		"src/**.vs*/**"
	}

	filter "system:Windows"
		defines {
			"_GLFW_WIN32",
			"_CRT_SECURE_NO_WARNINGS"
		}
	}

	filter "configurations:Debug"
		runtime "Debug"
		symbols "on"

	filter "configurations:Release"
		runtime "Release"
		optimize "speed"

	filter "configurations:Distribution"
		runtime "Release"
		optimize "speed"
		symbols "off"