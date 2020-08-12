project "SPIRV-Cross"
	kind "StaticLib"
	language "C++"
	cppdialect "C++17"
	staticruntime "on"
	
	targetdir("bin/%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}/%prj.name")
	objectdir("bin/%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}/%prj.name")
	
	files
	{
		"GLSL.std.450.h",
		"spirv_common.hpp",
		"spirv_cross_containers.hpp",
		"spirv_cross_error_handling.hpp",
		"spirv.hpp",
		"spirv_cross.hpp",
		"spirv_cross.cpp",
		"spirv_parser.hpp",
		"spirv_parser.cpp",
		"spirv_cross_parsed_ir.hpp",
		"spirv_cross_parsed_ir.cpp",
		"spirv_cfg.hpp",
		"spirv_cfg.cpp"
	}
	
	
	
