#version 450

layout(location = 0) flat out int _4;

void main()
{
    vec4 _63 = vec4(0.0);
    _63.y = float(((-10) + 2));
    vec4 _66 = _63;
    _66.z = float((100u % 5u));
    vec4 _52 = _66 + vec4(ivec4(20, 30, 0, 0));
    vec2 _56 = _52.xy + vec2(ivec2(ivec4(20, 30, 0, 0).y, ivec4(20, 30, 0, 0).x));
    gl_Position = vec4(_56.x, _56.y, _52.z, _52.w);
    _4 = ivec4(20, 30, 0, 0).y;
}

