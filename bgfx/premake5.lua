project "bgfx"
	kind "StaticLib"
	language "C++"
	cppdialect "C++14"
	exceptionhandling "Off"
	rtti "Off"
	defines "__STDC_FORMAT_MACROS"
	targetdir ("%{wks.location}/bin/" .. outputdir .. "/%{prj.name}")
	objdir ("%{wks.location}/bin-int/" .. outputdir .. "/%{prj.name}")
	files
	{
		path.join(LibraryDir["BGFX"], "include/bgfx/**.h"),
		path.join(LibraryDir["BGFX"], "src/*.cpp"),
		path.join(LibraryDir["BGFX"], "src/*.h"),
	}
	excludes
	{
		path.join(LibraryDir["BGFX"], "src/amalgamated.cpp"),
	}
	includedirs
	{
		path.join(LibraryDir["BX"], "include"),
		path.join(LibraryDir["BIMG"], "include"),
		path.join(LibraryDir["BGFX"], "include"),
		path.join(LibraryDir["BGFX"], "3rdparty"),
		path.join(LibraryDir["BGFX"], "3rdparty/dxsdk/include"),
		path.join(LibraryDir["BGFX"], "3rdparty/khronos")
	}
	filter "configurations:Debug"
		defines "BGFX_CONFIG_DEBUG=1"
		defines "BX_CONFIG_DEBUG=1"
	filter "action:vs*"
		defines "_CRT_SECURE_NO_WARNINGS"
		excludes
		{
			path.join(LibraryDir["BGFX"], "src/glcontext_glx.cpp"),
			path.join(LibraryDir["BGFX"], "src/glcontext_egl.cpp")
		}
	filter "system:macosx"
		files
		{
			path.join(LibraryDir["BGFX"], "src/*.mm"),
		}
	setBxCompat()