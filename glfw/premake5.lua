project "GLFW"
kind "StaticLib"
language "C"

targetdir ("bin/" .. outputdir .. "/%{prj.name}")
objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

files
{
    path.join(LibraryDir["GLFW"], "include/GLFW/glfw3.h"),
    path.join(LibraryDir["GLFW"], "include/GLFW/glfw3native.h"),
    path.join(LibraryDir["GLFW"], "src/internal.h"),
    path.join(LibraryDir["GLFW"], "src/platform.h"),
    path.join(LibraryDir["GLFW"], "src/mappings.h"),
    path.join(LibraryDir["GLFW"], "src/context.c"),
    path.join(LibraryDir["GLFW"], "src/init.c"),
    path.join(LibraryDir["GLFW"], "src/input.c"),
    path.join(LibraryDir["GLFW"], "src/monitor.c"),
    path.join(LibraryDir["GLFW"], "src/platform.c"),
    path.join(LibraryDir["GLFW"], "src/vulkan.c"),
    path.join(LibraryDir["GLFW"], "src/window.c"),
    path.join(LibraryDir["GLFW"], "src/egl_context.c"),
    path.join(LibraryDir["GLFW"], "src/osmesa_context.c"),
    path.join(LibraryDir["GLFW"], "src/null_platform.h"),
    path.join(LibraryDir["GLFW"], "src/null_joystick.h"),
    path.join(LibraryDir["GLFW"], "src/null_init.c"),

    path.join(LibraryDir["GLFW"], "src/null_monitor.c"),
    path.join(LibraryDir["GLFW"], "src/null_window.c"),
    path.join(LibraryDir["GLFW"], "src/null_joystick.c")

}
filter "system:linux"
    pic "On"

    systemversion "latest"
    staticruntime "On"

    files
    {
        path.join(LibraryDir["GLFW"], "src/x11_init.c"),
        path.join(LibraryDir["GLFW"], "src/x11_monitor.c"),
        path.join(LibraryDir["GLFW"], "src/x11_window.c"),
        path.join(LibraryDir["GLFW"], "src/xkb_unicode.c"),
        path.join(LibraryDir["GLFW"], "src/posix_time.c"),
        path.join(LibraryDir["GLFW"], "src/posix_thread.c"),
        path.join(LibraryDir["GLFW"], "src/glx_context.c"),
        path.join(LibraryDir["GLFW"], "src/egl_context.c"),
        path.join(LibraryDir["GLFW"], "src/osmesa_context.c"),
        path.join(LibraryDir["GLFW"], "src/linux_joystick.c")
    }

    defines
    {
        "_GLFW_X11"
        
    }

filter "system:windows"
    systemversion "latest"
    staticruntime "On"
    
    -- buildoptions{
    --     "/MT"
    -- }

    files
    {
        path.join(LibraryDir["GLFW"], "src/win32_init.c"),
        path.join(LibraryDir["GLFW"], "src/win32_module.c"),
        path.join(LibraryDir["GLFW"], "src/win32_joystick.c"),
        path.join(LibraryDir["GLFW"], "src/win32_monitor.c"),
        path.join(LibraryDir["GLFW"], "src/win32_time.h"),
        path.join(LibraryDir["GLFW"], "src/win32_time.c"),
        path.join(LibraryDir["GLFW"], "src/win32_thread.h"),
        path.join(LibraryDir["GLFW"], "src/win32_thread.c"),
        path.join(LibraryDir["GLFW"], "src/win32_window.c"),
        path.join(LibraryDir["GLFW"], "src/wgl_context.c"),
        path.join(LibraryDir["GLFW"], "src/egl_context.c"),
        path.join(LibraryDir["GLFW"], "src/osmesa_context.c")
    }

    defines 
    { 
        "_GLFW_WIN32",
        "_CRT_SECURE_NO_WARNINGS"

    }

filter "system:macosx"
	defines "_GLFW_COCOA"
	files
	{
		path.join(LibraryDir["GLFW"], "src/cocoa_*.*"),
		path.join(LibraryDir["GLFW"], "src/posix_thread.h"),
		path.join(LibraryDir["GLFW"], "src/nsgl_context.h"),
		path.join(LibraryDir["GLFW"], "src/egl_context.h"),
		path.join(LibraryDir["GLFW"], "src/osmesa_context.h"),

		path.join(LibraryDir["GLFW"], "src/posix_thread.c"),
		path.join(LibraryDir["GLFW"], "src/nsgl_context.m"),
		path.join(LibraryDir["GLFW"], "src/egl_context.c"),
		path.join(LibraryDir["GLFW"], "src/nsgl_context.m"),
		path.join(LibraryDir["GLFW"], "src/osmesa_context.c"),                       
	}

filter "configurations:Debug"
    runtime "Debug"
    symbols "On"

filter "configurations:Release"
    runtime "Release"
    optimize "On"