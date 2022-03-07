project "bimg"
	kind "StaticLib"
	language "C++"
	cppdialect "C++14"
	exceptionhandling "Off"
	rtti "Off"
	targetdir ("%{wks.location}/bin/" .. outputdir .. "/%{prj.name}")
	objdir ("%{wks.location}/bin-int/" .. outputdir .. "/%{prj.name}")
	files
	{
		path.join(LibraryDir["BIMG"], "include/bimg/*.h"),
		path.join(LibraryDir["BIMG"], "src/image.cpp"),
		path.join(LibraryDir["BIMG"], "src/image_gnf.cpp"),
		path.join(LibraryDir["BIMG"], "src/*.h"),
		path.join(LibraryDir["BIMG"], "3rdparty/astc-codec/src/decoder/*.cc")
	}
	includedirs
	{
		path.join(LibraryDir["BX"], "include"),
		path.join(LibraryDir["BIMG"], "include"),
		path.join(LibraryDir["BIMG"], "3rdparty/astc-codec"),
		path.join(LibraryDir["BIMG"], "3rdparty/astc-codec/include"),
	}
	filter "configurations:Debug"
		defines "BX_CONFIG_DEBUG=1"
	setBxCompat()
