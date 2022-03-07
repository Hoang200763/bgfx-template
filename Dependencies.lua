LibraryDir = {}

LibraryDir["BGFX"] = "%{wks.location}/bgfx/bgfx"
LibraryDir["BX"] = "%{wks.location}/bx/bx"
LibraryDir["BIMG"] = "%{wks.location}/bimg/bimg"
LibraryDir["GLFW"] = "%{wks.location}/glfw/glfw"
LibraryDir["GLM"] = "%{wks.location}/glm"

function setBxCompat()
	filter "action:vs*"
		includedirs { path.join(LibraryDir["BX"], "include/compat/msvc") }
	filter { "system:windows", "action:gmake" }
		includedirs { path.join(LibraryDir["BX"], "include/compat/mingw") }
	filter { "system:macosx" }
		includedirs { path.join(LibraryDir["BX"], "include/compat/osx") }
		buildoptions { "-x objective-c++" }
end