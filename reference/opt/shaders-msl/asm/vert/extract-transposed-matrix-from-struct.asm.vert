#pragma clang diagnostic ignored "-Wmissing-braces"
#pragma clang diagnostic ignored "-Wunused-variable"

#include <metal_stdlib>
#include <simd/simd.h>
	
template <typename T, size_t Num>
struct unsafe_array
{
	T __Elements[Num ? Num : 1];
	
	constexpr size_t size() const thread { return Num; }
	constexpr size_t max_size() const thread { return Num; }
	constexpr bool empty() const thread { return Num == 0; }
	
	constexpr size_t size() const device { return Num; }
	constexpr size_t max_size() const device { return Num; }
	constexpr bool empty() const device { return Num == 0; }
	
	constexpr size_t size() const constant { return Num; }
	constexpr size_t max_size() const constant { return Num; }
	constexpr bool empty() const constant { return Num == 0; }
	
	constexpr size_t size() const threadgroup { return Num; }
	constexpr size_t max_size() const threadgroup { return Num; }
	constexpr bool empty() const threadgroup { return Num == 0; }
	
	thread T &operator[](size_t pos) thread
	{
		return __Elements[pos];
	}
	constexpr const thread T &operator[](size_t pos) const thread
	{
		return __Elements[pos];
	}
	
	device T &operator[](size_t pos) device
	{
		return __Elements[pos];
	}
	constexpr const device T &operator[](size_t pos) const device
	{
		return __Elements[pos];
	}
	
	constexpr const constant T &operator[](size_t pos) const constant
	{
		return __Elements[pos];
	}
	
	threadgroup T &operator[](size_t pos) threadgroup
	{
		return __Elements[pos];
	}
	constexpr const threadgroup T &operator[](size_t pos) const threadgroup
	{
		return __Elements[pos];
	}
};

using namespace metal;

struct InstanceData
{
    float4x4 MATRIX_MVP;
    float4 Color;
};

struct gInstanceData
{
    unsafe_array<InstanceData,1> _data;
};

struct main0_out
{
    float4 _entryPointOutput_Color [[user(locn0)]];
    float4 gl_Position [[position]];
};

struct main0_in
{
    float3 PosL [[attribute(0)]];
};

vertex main0_out main0(main0_in in [[stage_in]], const device gInstanceData& gInstanceData_1 [[buffer(0)]], uint gl_InstanceIndex [[instance_id]], uint gl_BaseInstance [[base_instance]])
{
    main0_out out = {};
    out.gl_Position = float4(in.PosL, 1.0) * gInstanceData_1._data[(gl_InstanceIndex - gl_BaseInstance)].MATRIX_MVP;
    out._entryPointOutput_Color = gInstanceData_1._data[(gl_InstanceIndex - gl_BaseInstance)].Color;
    return out;
}

