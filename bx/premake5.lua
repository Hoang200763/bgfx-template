project "bx"
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
		path.join(LibraryDir["BX"], "include/bx/*.h"),
		path.join(LibraryDir["BX"], "include/bx/inline/*.inl"),
		path.join(LibraryDir["BX"], "src/*.cpp")
	}
	excludes
	{
		path.join(LibraryDir["BX"], "src/amalgamated.cpp"),
		path.join(LibraryDir["BX"], "src/crtnone.cpp")
	}
	includedirs
	{
		path.join(LibraryDir["BX"], "3rdparty"),
		path.join(LibraryDir["BX"], "include")
	}
	filter "action:vs*"
		defines "_CRT_SECURE_NO_WARNINGS"
	filter "configurations:Debug"
		defines "BX_CONFIG_DEBUG=1"
	setBxCompat()