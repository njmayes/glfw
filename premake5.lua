project "glfw"
    kind "StaticLib"
    language "C"
    staticruntime "off"

    targetdir 	("%{wks.location}/bin/%{prj.name}/" .. outputDir)
    objdir 		("%{wks.location}/obj/%{prj.name}/" .. outputDir)

    files 
    { 
		"include/GLFW/glfw3.h",
		"include/GLFW/glfw3native.h",
		"src/context.c",
		"src/platform.c",
		"src/init.c",
		"src/input.c",
		"src/monitor.c",
		"src/vulkan.c",
		"src/window.c",
		"src/egl_context.c", 
		"src/osmesa_context.c", 
		"src/null_init.c", 
		"src/null_monitor.c", 
		"src/null_window.c", 
		"src/null_joystick.c"
    }
	
	filter "files:**.h"
		compileas "HeaderUnit"
	
	filter "system:linux"
		pic "On"

		systemversion "latest"

		files
		{
			"src/posix_time.c",
			"src/posix_thread.c",
			"src/posix_module.c",
			"src/xkb_unicode.h",
			"src/x11_init.c",
			"src/x11_monitor.c",
			"src/x11_window.c",
			"src/xkb_unicode.c",
			"src/glx_context.c",
			"src/linux_joystick.c"
		}

		defines
		{
			"_GLFW_X11"
		}

	filter "system:windows"
		systemversion "latest"

		files
		{
			"src/win32_time.c",
			"src/win32_thread.c",
			"src/win32_module.c",
			"src/win32_init.c",
			"src/win32_joystick.c",
			"src/win32_monitor.c",
			"src/win32_window.c",
			"src/wgl_context.c"
		}

		defines 
		{ 
			"_GLFW_WIN32",
			"_CRT_SECURE_NO_WARNINGS"
		}

    filter "system:windows"
        systemversion "latest"

	filter "configurations:Debug"
		runtime "Debug"
        symbols "on"

	filter "configurations:Release"
		runtime "Release"
		optimize "on"