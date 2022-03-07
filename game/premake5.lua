project "game"
	kind "ConsoleApp"
	language "C++"
	cppdialect "C++14"
	exceptionhandling "Off"
	rtti "Off"
	targetdir ("%{wks.location}/bin/" .. outputdir .. "/%{prj.name}")
	objdir ("%{wks.location}/bin-int/" .. outputdir .. "/%{prj.name}")
	files 
    {
        "src/**.cpp",
        "src/**.h",
    }
	includedirs
	{
		path.join(LibraryDir["BGFX"], "include"),
		path.join(LibraryDir["BX"], "include"),
		path.join(LibraryDir["GLFW"], "include"),
		LibraryDir["GLM"]
	}
	links { "bgfx", "bimg", "bx", "glfw" }
	filter "configurations:Debug"
		defines "BX_CONFIG_DEBUG=1"
	filter "system:windows"
		links { "gdi32", "kernel32", "psapi" }
	filter "system:linux"
		links { "dl", "GL", "pthread", "X11" }
	filter "system:macosx"
		links { "QuartzCore.framework", "Metal.framework", "Cocoa.framework", "IOKit.framework", "CoreVideo.framework" }
	setBxCompat()