! Author:  Philipp Engel
! Licence: ISC
module raylib_gl
    !! Fortran 2018 interface bindings to `rlgl.h`.
    use :: raylib
    implicit none (type, external)
    private

    ! Texture parameters (equivalent to OpenGL defines)
    integer(c_int), parameter, public :: RL_TEXTURE_WRAP_S                    = int(z'2802') !! GL_TEXTURE_WRAP_S
    integer(c_int), parameter, public :: RL_TEXTURE_WRAP_T                    = int(z'2803') !! GL_TEXTURE_WRAP_T
    integer(c_int), parameter, public :: RL_TEXTURE_MAG_FILTER                = int(z'2800') !! GL_TEXTURE_MAG_FILTER
    integer(c_int), parameter, public :: RL_TEXTURE_MIN_FILTER                = int(z'2801') !! GL_TEXTURE_MIN_FILTER

    integer(c_int), parameter, public :: RL_TEXTURE_FILTER_NEAREST            = int(z'2600') !! GL_NEAREST
    integer(c_int), parameter, public :: RL_TEXTURE_FILTER_LINEAR             = int(z'2601') !! GL_LINEAR
    integer(c_int), parameter, public :: RL_TEXTURE_FILTER_MIP_NEAREST        = int(z'2700') !! GL_NEAREST_MIPMAP_NEAREST
    integer(c_int), parameter, public :: RL_TEXTURE_FILTER_NEAREST_MIP_LINEAR = int(z'2702') !! GL_NEAREST_MIPMAP_LINEAR
    integer(c_int), parameter, public :: RL_TEXTURE_FILTER_LINEAR_MIP_NEAREST = int(z'2701') !! GL_LINEAR_MIPMAP_NEAREST
    integer(c_int), parameter, public :: RL_TEXTURE_FILTER_MIP_LINEAR         = int(z'2703') !! GL_LINEAR_MIPMAP_LINEAR
    integer(c_int), parameter, public :: RL_TEXTURE_FILTER_ANISOTROPIC        = int(z'3000') !! Anisotropic filter (custom identifier)
    integer(c_int), parameter, public :: RL_TEXTURE_MIPMAP_BIAS_RATIO         = int(z'4000') !! Texture mipmap bias, percentage ratio (custom identifier)

    integer(c_int), parameter, public :: RL_TEXTURE_WRAP_REPEAT               = int(z'2901') !! GL_REPEAT
    integer(c_int), parameter, public :: RL_TEXTURE_WRAP_CLAMP                = int(z'812F') !! GL_CLAMP_TO_EDGE
    integer(c_int), parameter, public :: RL_TEXTURE_WRAP_MIRROR_REPEAT        = int(z'8370') !! GL_MIRRORED_REPEAT
    integer(c_int), parameter, public :: RL_TEXTURE_WRAP_MIRROR_CLAMP         = int(z'8742') !! GL_MIRROR_CLAMP_EXT

    ! Matrix modes (equivalent to OpenGL)
    integer(c_int), parameter, public :: RL_MODELVIEW  = int(z'1700') !! GL_MODELVIEW
    integer(c_int), parameter, public :: RL_PROJECTION = int(z'1701') !! GL_PROJECTION
    integer(c_int), parameter, public :: RL_TEXTURE    = int(z'1702') !! GL_TEXTURE

    ! Primitive assembly draw modes
    integer(c_int), parameter, public :: RL_LINES     = int(z'0001') !! GL_LINES
    integer(c_int), parameter, public :: RL_TRIANGLES = int(z'0004') !! GL_TRIANGLES
    integer(c_int), parameter, public :: RL_QUADS     = int(z'0007') !! GL_QUADS

    ! GL equivalent data types
    integer(c_int), parameter, public :: RL_UNSIGNED_BYTE = int(z'1401') !! GL_UNSIGNED_BYTE
    integer(c_int), parameter, public :: RL_FLOAT         = int(z'1406') !! GL_FLOAT

    ! GL buffer usage hint
    integer(c_int), parameter, public :: RL_STREAM_DRAW  = int(z'88E0') !! GL_STREAM_DRAW
    integer(c_int), parameter, public :: RL_STREAM_READ  = int(z'88E1') !! GL_STREAM_READ
    integer(c_int), parameter, public :: RL_STREAM_COPY  = int(z'88E2') !! GL_STREAM_COPY
    integer(c_int), parameter, public :: RL_STATIC_DRAW  = int(z'88E4') !! GL_STATIC_DRAW
    integer(c_int), parameter, public :: RL_STATIC_READ  = int(z'88E5') !! GL_STATIC_READ
    integer(c_int), parameter, public :: RL_STATIC_COPY  = int(z'88E6') !! GL_STATIC_COPY
    integer(c_int), parameter, public :: RL_DYNAMIC_DRAW = int(z'88E8') !! GL_DYNAMIC_DRAW
    integer(c_int), parameter, public :: RL_DYNAMIC_READ = int(z'88E9') !! GL_DYNAMIC_READ
    integer(c_int), parameter, public :: RL_DYNAMIC_COPY = int(z'88EA') !! GL_DYNAMIC_COPY

    ! GL Shader type
    integer(c_int), parameter, public :: RL_FRAGMENT_SHADER = int(z'8B30') !! GL_FRAGMENT_SHADER
    integer(c_int), parameter, public :: RL_VERTEX_SHADER   = int(z'8B31') !! GL_VERTEX_SHADER
    integer(c_int), parameter, public :: RL_COMPUTE_SHADER  = int(z'91B9') !! GL_COMPUTE_SHADER

    ! GL blending factors
    integer(c_int), parameter, public :: RL_ZERO                     = 0            !! GL_ZERO
    integer(c_int), parameter, public :: RL_ONE                      = 1            !! GL_ONE
    integer(c_int), parameter, public :: RL_SRC_COLOR                = int(z'0300') !! GL_SRC_COLOR
    integer(c_int), parameter, public :: RL_ONE_MINUS_SRC_COLOR      = int(z'0301') !! GL_ONE_MINUS_SRC_COLOR
    integer(c_int), parameter, public :: RL_SRC_ALPHA                = int(z'0302') !! GL_SRC_ALPHA
    integer(c_int), parameter, public :: RL_ONE_MINUS_SRC_ALPHA      = int(z'0303') !! GL_ONE_MINUS_SRC_ALPHA
    integer(c_int), parameter, public :: RL_DST_ALPHA                = int(z'0304') !! GL_DST_ALPHA
    integer(c_int), parameter, public :: RL_ONE_MINUS_DST_ALPHA      = int(z'0305') !! GL_ONE_MINUS_DST_ALPHA
    integer(c_int), parameter, public :: RL_DST_COLOR                = int(z'0306') !! GL_DST_COLOR
    integer(c_int), parameter, public :: RL_ONE_MINUS_DST_COLOR      = int(z'0307') !! GL_ONE_MINUS_DST_COLOR
    integer(c_int), parameter, public :: RL_SRC_ALPHA_SATURATE       = int(z'0308') !! GL_SRC_ALPHA_SATURATE
    integer(c_int), parameter, public :: RL_CONSTANT_COLOR           = int(z'8001') !! GL_CONSTANT_COLOR
    integer(c_int), parameter, public :: RL_ONE_MINUS_CONSTANT_COLOR = int(z'8002') !! GL_ONE_MINUS_CONSTANT_COLOR
    integer(c_int), parameter, public :: RL_CONSTANT_ALPHA           = int(z'8003') !! GL_CONSTANT_ALPHA
    integer(c_int), parameter, public :: RL_ONE_MINUS_CONSTANT_ALPHA = int(z'8004') !! GL_ONE_MINUS_CONSTANT_ALPHA

    ! GL blending functions/equations
    integer(c_int), parameter, public :: RL_FUNC_ADD              = int(z'8006')      !! GL_FUNC_ADD
    integer(c_int), parameter, public :: RL_MIN                   = int(z'8007')      !! GL_MIN
    integer(c_int), parameter, public :: RL_MAX                   = int(z'8008')      !! GL_MAX
    integer(c_int), parameter, public :: RL_FUNC_SUBTRACT         = int(z'800A')      !! GL_FUNC_SUBTRACT
    integer(c_int), parameter, public :: RL_FUNC_REVERSE_SUBTRACT = int(z'800B')      !! GL_FUNC_REVERSE_SUBTRACT
    integer(c_int), parameter, public :: RL_BLEND_EQUATION        = int(z'8009')      !! GL_BLEND_EQUATION
    integer(c_int), parameter, public :: RL_BLEND_EQUATION_RGB    = int(z'8009')      !! GL_BLEND_EQUATION_RGB (same as BLEND_EQUATION)
    integer(c_int), parameter, public :: RL_BLEND_EQUATION_ALPHA  = int(z'883D')      !! GL_BLEND_EQUATION_ALPHA
    integer(c_int), parameter, public :: RL_BLEND_DST_RGB         = int(z'80C8')      !! GL_BLEND_DST_RGB
    integer(c_int), parameter, public :: RL_BLEND_SRC_RGB         = int(z'80C9')      !! GL_BLEND_SRC_RGB
    integer(c_int), parameter, public :: RL_BLEND_DST_ALPHA       = int(z'80CA')      !! GL_BLEND_DST_ALPHA
    integer(c_int), parameter, public :: RL_BLEND_SRC_ALPHA       = int(z'80CB')      !! GL_BLEND_SRC_ALPHA
    integer(c_int), parameter, public :: RL_BLEND_COLOR           = int(z'8005')      !! GL_BLEND_COLOR

    integer(c_int), parameter, public :: RL_READ_FRAMEBUFFER      = int(z'8CA8')      !! GL_READ_FRAMEBUFFER
    integer(c_int), parameter, public :: RL_DRAW_FRAMEBUFFER      = int(z'8CA9')      !! GL_DRAW_FRAMEBUFFER

    ! Default shader vertex attribute locations
    integer(c_int), parameter, public :: RL_DEFAULT_SHADER_ATTRIB_LOCATION_POSITION          = 0
    integer(c_int), parameter, public :: RL_DEFAULT_SHADER_ATTRIB_LOCATION_TEXCOORD          = 1
    integer(c_int), parameter, public :: RL_DEFAULT_SHADER_ATTRIB_LOCATION_NORMAL            = 2
    integer(c_int), parameter, public :: RL_DEFAULT_SHADER_ATTRIB_LOCATION_COLOR             = 3
    integer(c_int), parameter, public :: RL_DEFAULT_SHADER_ATTRIB_LOCATION_TEXCOORD2         = 5
    integer(c_int), parameter, public :: RL_DEFAULT_SHADER_ATTRIB_LOCATION_INDICES           = 6
    integer(c_int), parameter, public :: RL_DEFAULT_SHADER_ATTRIB_LOCATION_BONEINDICES       = 7
    integer(c_int), parameter, public :: RL_DEFAULT_SHADER_ATTRIB_LOCATION_BONEWEIGHTS       = 8
    integer(c_int), parameter, public :: RL_DEFAULT_SHADER_ATTRIB_LOCATION_INSTANCETRANSFORM = 9

    ! enum rlGlVersion
    integer(c_int), parameter, public :: RL_OPENGL_SOFTWARE = 0 !! Software rendering
    integer(c_int), parameter, public :: RL_OPENGL_11       = 1 !! OpenGL 1.1
    integer(c_int), parameter, public :: RL_OPENGL_21       = 2 !! OpenGL 2.1 (GLSL 120)
    integer(c_int), parameter, public :: RL_OPENGL_33       = 3 !! OpenGL 3.3 (GLSL 330)
    integer(c_int), parameter, public :: RL_OPENGL_43       = 4 !! OpenGL 4.3 (using GLSL 330)
    integer(c_int), parameter, public :: RL_OPENGL_ES_20    = 5 !! OpenGL ES 2.0 (GLSL 100)
    integer(c_int), parameter, public :: RL_OPENGL_ES_30    = 6 !! OpenGL ES 3.0 (GLSL 300 es)

    ! enum rlTraceLogLevel
    integer(c_int), parameter, public :: RL_LOG_ALL     = 0 !! Display all logs.
    integer(c_int), parameter, public :: RL_LOG_TRACE   = 1 !! Trace logging intended for internal use only.
    integer(c_int), parameter, public :: RL_LOG_DEBUG   = 2 !! Debug logging used for internal debugging  it should be disabled on release builds.
    integer(c_int), parameter, public :: RL_LOG_INFO    = 3 !! Info logging used for program execution info.
    integer(c_int), parameter, public :: RL_LOG_WARNING = 4 !! Warning logging used on recoverable failures.
    integer(c_int), parameter, public :: RL_LOG_ERROR   = 5 !! Error logging used on unrecoverable failures.
    integer(c_int), parameter, public :: RL_LOG_FATAL   = 6 !! Fatal logging used to abort program: exit(EXIT_FAILURE).
    integer(c_int), parameter, public :: RL_LOG_NONE    = 7 !! Disable logging.

    ! enum rlPixelFormat
    integer(c_int), parameter, public :: RL_PIXELFORMAT_UNCOMPRESSED_GRAYSCALE    =  1 !! 8 bit per pixel (no alpha)
    integer(c_int), parameter, public :: RL_PIXELFORMAT_UNCOMPRESSED_GRAY_ALPHA   =  2 !! 8*2 bpp (2 channels)
    integer(c_int), parameter, public :: RL_PIXELFORMAT_UNCOMPRESSED_R5G6B5       =  3 !! 16 bpp
    integer(c_int), parameter, public :: RL_PIXELFORMAT_UNCOMPRESSED_R8G8B8       =  4 !! 24 bpp
    integer(c_int), parameter, public :: RL_PIXELFORMAT_UNCOMPRESSED_R5G5B5A1     =  5 !! 16 bpp (1 bit alpha)
    integer(c_int), parameter, public :: RL_PIXELFORMAT_UNCOMPRESSED_R4G4B4A4     =  6 !! 16 bpp (4 bit alpha)
    integer(c_int), parameter, public :: RL_PIXELFORMAT_UNCOMPRESSED_R8G8B8A8     =  7 !! 32 bpp
    integer(c_int), parameter, public :: RL_PIXELFORMAT_UNCOMPRESSED_R32          =  8 !! 32 bpp (1 channel - float)
    integer(c_int), parameter, public :: RL_PIXELFORMAT_UNCOMPRESSED_R32G32B32    =  9 !! 32*3 bpp (3 channels - float)
    integer(c_int), parameter, public :: RL_PIXELFORMAT_UNCOMPRESSED_R32G32B32A32 = 10 !! 32*4 bpp (4 channels - float)
    integer(c_int), parameter, public :: RL_PIXELFORMAT_UNCOMPRESSED_R16          = 11 !! 16 bpp (1 channel - half float)
    integer(c_int), parameter, public :: RL_PIXELFORMAT_UNCOMPRESSED_R16G16B16    = 12 !! 16*3 bpp (3 channels - half float)
    integer(c_int), parameter, public :: RL_PIXELFORMAT_UNCOMPRESSED_R16G16B16A16 = 13 !! 16*4 bpp (4 channels - half float)
    integer(c_int), parameter, public :: RL_PIXELFORMAT_COMPRESSED_DXT1_RGB       = 14 !! 4 bpp (no alpha)
    integer(c_int), parameter, public :: RL_PIXELFORMAT_COMPRESSED_DXT1_RGBA      = 15 !! 4 bpp (1 bit alpha)
    integer(c_int), parameter, public :: RL_PIXELFORMAT_COMPRESSED_DXT3_RGBA      = 16 !! 8 bpp
    integer(c_int), parameter, public :: RL_PIXELFORMAT_COMPRESSED_DXT5_RGBA      = 17 !! 8 bpp
    integer(c_int), parameter, public :: RL_PIXELFORMAT_COMPRESSED_ETC1_RGB       = 18 !! 4 bpp
    integer(c_int), parameter, public :: RL_PIXELFORMAT_COMPRESSED_ETC2_RGB       = 19 !! 4 bpp
    integer(c_int), parameter, public :: RL_PIXELFORMAT_COMPRESSED_ETC2_EAC_RGBA  = 20 !! 8 bpp
    integer(c_int), parameter, public :: RL_PIXELFORMAT_COMPRESSED_PVRT_RGB       = 21 !! 4 bpp
    integer(c_int), parameter, public :: RL_PIXELFORMAT_COMPRESSED_PVRT_RGBA      = 22 !! 4 bpp
    integer(c_int), parameter, public :: RL_PIXELFORMAT_COMPRESSED_ASTC_4x4_RGBA  = 23 !! 8 bpp
    integer(c_int), parameter, public :: RL_PIXELFORMAT_COMPRESSED_ASTC_8x8_RGBA  = 24 !! 2 bpp

    ! enum rlTextureFilter
    integer(c_int), parameter, public :: RL_TEXTURE_FILTER_POINT           = 0 !! No filter  pixel approximation.
    integer(c_int), parameter, public :: RL_TEXTURE_FILTER_BILINEAR        = 1 !! Linear filtering.
    integer(c_int), parameter, public :: RL_TEXTURE_FILTER_TRILINEAR       = 2 !! Trilinear filtering (linear with mipmaps).
    integer(c_int), parameter, public :: RL_TEXTURE_FILTER_ANISOTROPIC_4X  = 3 !! Anisotropic filtering 4x.
    integer(c_int), parameter, public :: RL_TEXTURE_FILTER_ANISOTROPIC_8X  = 4 !! Anisotropic filtering 8x.
    integer(c_int), parameter, public :: RL_TEXTURE_FILTER_ANISOTROPIC_16X = 5 !! Anisotropic filtering 16x.

    ! typedef enum rlBlendMode
    integer(c_int), parameter, public :: RL_BLEND_ALPHA             = 0 !! Blend textures considering alpha (default).
    integer(c_int), parameter, public :: RL_BLEND_ADDITIVE          = 1 !! Blend textures adding colors.
    integer(c_int), parameter, public :: RL_BLEND_MULTIPLIED        = 2 !! Blend textures multiplying colors.
    integer(c_int), parameter, public :: RL_BLEND_ADD_COLORS        = 3 !! Blend textures adding colors (alternative).
    integer(c_int), parameter, public :: RL_BLEND_SUBTRACT_COLORS   = 4 !! Blend textures subtracting colors (alternative).
    integer(c_int), parameter, public :: RL_BLEND_ALPHA_PREMULTIPLY = 5 !! Blend premultiplied textures considering alpha.
    integer(c_int), parameter, public :: RL_BLEND_CUSTOM            = 6 !! Blend textures using custom src/dst factors (use rlSetBlendFactors()).
    integer(c_int), parameter, public :: RL_BLEND_CUSTOM_SEPARATE   = 7 !! Blend textures using custom src/dst factors (use rlSetBlendFactorsSeparate()).

    ! enum rlShaderLocationIndex
    integer(c_int), parameter, public :: RL_SHADER_LOC_VERTEX_POSITION   =  0 !! Shader location: vertex attribute: position
    integer(c_int), parameter, public :: RL_SHADER_LOC_VERTEX_TEXCOORD01 =  1 !! Shader location: vertex attribute: texcoord01
    integer(c_int), parameter, public :: RL_SHADER_LOC_VERTEX_TEXCOORD02 =  2 !! Shader location: vertex attribute: texcoord02
    integer(c_int), parameter, public :: RL_SHADER_LOC_VERTEX_NORMAL     =  3 !! Shader location: vertex attribute: normal
    integer(c_int), parameter, public :: RL_SHADER_LOC_VERTEX_TANGENT    =  4 !! Shader location: vertex attribute: tangent
    integer(c_int), parameter, public :: RL_SHADER_LOC_VERTEX_COLOR      =  5 !! Shader location: vertex attribute: color
    integer(c_int), parameter, public :: RL_SHADER_LOC_MATRIX_MVP        =  6 !! Shader location: matrix uniform: model-view-projection
    integer(c_int), parameter, public :: RL_SHADER_LOC_MATRIX_VIEW       =  7 !! Shader location: matrix uniform: view (camera transform)
    integer(c_int), parameter, public :: RL_SHADER_LOC_MATRIX_PROJECTION =  8 !! Shader location: matrix uniform: projection
    integer(c_int), parameter, public :: RL_SHADER_LOC_MATRIX_MODEL      =  9 !! Shader location: matrix uniform: model (transform)
    integer(c_int), parameter, public :: RL_SHADER_LOC_MATRIX_NORMAL     = 10 !! Shader location: matrix uniform: normal
    integer(c_int), parameter, public :: RL_SHADER_LOC_VECTOR_VIEW       = 11 !! Shader location: vector uniform: view
    integer(c_int), parameter, public :: RL_SHADER_LOC_COLOR_DIFFUSE     = 12 !! Shader location: vector uniform: diffuse color
    integer(c_int), parameter, public :: RL_SHADER_LOC_COLOR_SPECULAR    = 13 !! Shader location: vector uniform: specular color
    integer(c_int), parameter, public :: RL_SHADER_LOC_COLOR_AMBIENT     = 14 !! Shader location: vector uniform: ambient color
    integer(c_int), parameter, public :: RL_SHADER_LOC_MAP_ALBEDO        = 15 !! Shader location: sampler2d texture: albedo (same as: RL_SHADER_LOC_MAP_DIFFUSE)
    integer(c_int), parameter, public :: RL_SHADER_LOC_MAP_METALNESS     = 16 !! Shader location: sampler2d texture: metalness (same as: RL_SHADER_LOC_MAP_SPECULAR)
    integer(c_int), parameter, public :: RL_SHADER_LOC_MAP_NORMAL        = 17 !! Shader location: sampler2d texture: normal
    integer(c_int), parameter, public :: RL_SHADER_LOC_MAP_ROUGHNESS     = 18 !! Shader location: sampler2d texture: roughness
    integer(c_int), parameter, public :: RL_SHADER_LOC_MAP_OCCLUSION     = 19 !! Shader location: sampler2d texture: occlusion
    integer(c_int), parameter, public :: RL_SHADER_LOC_MAP_EMISSION      = 20 !! Shader location: sampler2d texture: emission
    integer(c_int), parameter, public :: RL_SHADER_LOC_MAP_HEIGHT        = 21 !! Shader location: sampler2d texture: height
    integer(c_int), parameter, public :: RL_SHADER_LOC_MAP_CUBEMAP       = 22 !! Shader location: samplerCube texture: cubemap
    integer(c_int), parameter, public :: RL_SHADER_LOC_MAP_IRRADIANCE    = 23 !! Shader location: samplerCube texture: irradiance
    integer(c_int), parameter, public :: RL_SHADER_LOC_MAP_PREFILTER     = 24 !! Shader location: samplerCube texture: prefilter
    integer(c_int), parameter, public :: RL_SHADER_LOC_MAP_BRDF          = 25 !! Shader location: sampler2d texture: brdf

    integer(c_int), parameter, public :: RL_SHADER_LOC_MAP_DIFFUSE  = RL_SHADER_LOC_MAP_ALBEDO
    integer(c_int), parameter, public :: RL_SHADER_LOC_MAP_SPECULAR = RL_SHADER_LOC_MAP_METALNESS

    ! enum rlShaderUniformDataType
    integer(c_int), parameter, public :: RL_SHADER_UNIFORM_FLOAT     = 0  !! Shader uniform type: float
    integer(c_int), parameter, public :: RL_SHADER_UNIFORM_VEC2      = 1  !! Shader uniform type: vec2 (2 float)
    integer(c_int), parameter, public :: RL_SHADER_UNIFORM_VEC3      = 2  !! Shader uniform type: vec3 (3 float)
    integer(c_int), parameter, public :: RL_SHADER_UNIFORM_VEC4      = 3  !! Shader uniform type: vec4 (4 float)
    integer(c_int), parameter, public :: RL_SHADER_UNIFORM_INT       = 4  !! Shader uniform type: int
    integer(c_int), parameter, public :: RL_SHADER_UNIFORM_IVEC2     = 5  !! Shader uniform type: ivec2 (2 int)
    integer(c_int), parameter, public :: RL_SHADER_UNIFORM_IVEC3     = 6  !! Shader uniform type: ivec3 (3 int)
    integer(c_int), parameter, public :: RL_SHADER_UNIFORM_IVEC4     = 7  !! Shader uniform type: ivec4 (4 int)
    integer(c_int), parameter, public :: RL_SHADER_UNIFORM_UINT      = 8  !! Shader uniform type: unsigned int
    integer(c_int), parameter, public :: RL_SHADER_UNIFORM_UIVEC2    = 9  !! Shader uniform type: uivec2 (2 unsigned int)
    integer(c_int), parameter, public :: RL_SHADER_UNIFORM_UIVEC3    = 10 !! Shader uniform type: uivec3 (3 unsigned int)
    integer(c_int), parameter, public :: RL_SHADER_UNIFORM_UIVEC4    = 11 !! Shader uniform type: uivec4 (4 unsigned int)
    integer(c_int), parameter, public :: RL_SHADER_UNIFORM_SAMPLER2D = 12 !! Shader uniform type: sampler2d

    ! enum rlShaderAttributeDataType
    integer(c_int), parameter, public :: RL_SHADER_ATTRIB_FLOAT = 0 !! Shader attribute type: float
    integer(c_int), parameter, public :: RL_SHADER_ATTRIB_VEC2  = 1 !! Shader attribute type: vec2 (2 float)
    integer(c_int), parameter, public :: RL_SHADER_ATTRIB_VEC3  = 2 !! Shader attribute type: vec3 (3 float)
    integer(c_int), parameter, public :: RL_SHADER_ATTRIB_VEC4  = 3 !! Shader attribute type: vec4 (4 float)

    ! enum rlFramebufferAttachType
    integer(c_int), parameter, public :: RL_ATTACHMENT_COLOR_CHANNEL0 =   0 !! Framebuffer attachment type: color 0
    integer(c_int), parameter, public :: RL_ATTACHMENT_COLOR_CHANNEL1 =   1 !! Framebuffer attachment type: color 1
    integer(c_int), parameter, public :: RL_ATTACHMENT_COLOR_CHANNEL2 =   2 !! Framebuffer attachment type: color 2
    integer(c_int), parameter, public :: RL_ATTACHMENT_COLOR_CHANNEL3 =   3 !! Framebuffer attachment type: color 3
    integer(c_int), parameter, public :: RL_ATTACHMENT_COLOR_CHANNEL4 =   4 !! Framebuffer attachment type: color 4
    integer(c_int), parameter, public :: RL_ATTACHMENT_COLOR_CHANNEL5 =   5 !! Framebuffer attachment type: color 5
    integer(c_int), parameter, public :: RL_ATTACHMENT_COLOR_CHANNEL6 =   6 !! Framebuffer attachment type: color 6
    integer(c_int), parameter, public :: RL_ATTACHMENT_COLOR_CHANNEL7 =   7 !! Framebuffer attachment type: color 7
    integer(c_int), parameter, public :: RL_ATTACHMENT_DEPTH          = 100 !! Framebuffer attachment type: depth
    integer(c_int), parameter, public :: RL_ATTACHMENT_STENCIL        = 200 !! Framebuffer attachment type: stencil

    ! enum rlFramebufferAttachTextureType
    integer(c_int), parameter, public :: RL_ATTACHMENT_CUBEMAP_POSITIVE_X =   0 !! Framebuffer texture attachment type: cubemap  +X side
    integer(c_int), parameter, public :: RL_ATTACHMENT_CUBEMAP_NEGATIVE_X =   1 !! Framebuffer texture attachment type: cubemap  -X side
    integer(c_int), parameter, public :: RL_ATTACHMENT_CUBEMAP_POSITIVE_Y =   2 !! Framebuffer texture attachment type: cubemap  +Y side
    integer(c_int), parameter, public :: RL_ATTACHMENT_CUBEMAP_NEGATIVE_Y =   3 !! Framebuffer texture attachment type: cubemap  -Y side
    integer(c_int), parameter, public :: RL_ATTACHMENT_CUBEMAP_POSITIVE_Z =   4 !! Framebuffer texture attachment type: cubemap  +Z side
    integer(c_int), parameter, public :: RL_ATTACHMENT_CUBEMAP_NEGATIVE_Z =   5 !! Framebuffer texture attachment type: cubemap  -Z side
    integer(c_int), parameter, public :: RL_ATTACHMENT_TEXTURE2D          = 100 !! Framebuffer texture attachment type: texture2d
    integer(c_int), parameter, public :: RL_ATTACHMENT_RENDERBUFFER       = 200 !! Framebuffer texture attachment type: renderbuffer

    ! enum rlCullMode
    integer(c_int), parameter, public :: RL_CULL_FACE_FRONT = 0
    integer(c_int), parameter, public :: RL_CULL_FACE_BACK  = 1

    ! struct rlRenderBatch
    type, bind(c), public :: rl_render_batch_type
        integer(c_int) :: buffer_count   = 0           !! Number of vertex buffers (multi-buffering support).
        integer(c_int) :: current_buffer = 0           !! Current buffer tracking in case of multi-buffering.
        type(c_ptr)    :: vertex_buffer  = c_null_ptr  !! Dynamic buffer(s) for vertex data.
        type(c_ptr)    :: rl_draw_call   = c_null_ptr  !! Draw calls array, depends on textureId.
        integer(c_int) :: draw_counter   = 0           !! Draw calls counter
        real(c_float)  :: current_depth  = 0.0_c_float !! Current depth value for next draw
    end type rl_render_batch_type

    public :: rl_active_draw_buffers
    public :: rl_active_texture_slot
    public :: rl_begin
    public :: rl_bind_framebuffer
    public :: rl_bind_image_texture
    public :: rl_bind_shader_buffer
    public :: rl_blit_framebuffer
    public :: rl_check_errors
    public :: rl_check_render_batch_limit
    public :: rl_clear_color
    public :: rl_clear_screen_buffers
    public :: rl_color3f
    public :: rl_color4f
    public :: rl_color4ub
    public :: rl_color_mask
    public :: rl_compute_shader_dispatch
    public :: rl_copy_framebuffer
    public :: rl_copy_shader_buffer
    public :: rl_cubemap_parameters
    public :: rl_disable_backface_culling
    public :: rl_disable_color_blend
    public :: rl_disable_depth_mask
    public :: rl_disable_depth_test
    public :: rl_disable_framebuffer
    public :: rl_disable_point_mode
    public :: rl_disable_scissor_test
    public :: rl_disable_shader
    public :: rl_disable_smooth_lines
    public :: rl_disable_state_pointer
    public :: rl_disable_stereo_render
    public :: rl_disable_texture
    public :: rl_disable_texture_cubemap
    public :: rl_disable_vertex_array
    public :: rl_disable_vertex_attribute
    public :: rl_disable_vertex_buffer
    public :: rl_disable_vertex_buffer_element
    public :: rl_disable_wire_mode
    public :: rl_draw_render_batch
    public :: rl_draw_render_batch_active
    public :: rl_draw_vertex_array
    public :: rl_draw_vertex_array_elements
    public :: rl_draw_vertex_array_elements_instanced
    public :: rl_draw_vertex_array_instanced
    public :: rl_enable_backface_culling
    public :: rl_enable_color_blend
    public :: rl_enable_depth_mask
    public :: rl_enable_depth_test
    public :: rl_enable_framebuffer
    public :: rl_enable_point_mode
    public :: rl_enable_scissor_test
    public :: rl_enable_shader
    public :: rl_enable_smooth_lines
    public :: rl_enable_state_pointer
    public :: rl_enable_stereo_render
    public :: rl_enable_texture
    public :: rl_enable_texture_cubemap
    public :: rl_enable_vertex_array
    public :: rl_enable_vertex_attribute
    public :: rl_enable_vertex_buffer
    public :: rl_enable_vertex_buffer_element
    public :: rl_enable_wire_mode
    public :: rl_end
    public :: rl_framebuffer_attach
    public :: rl_framebuffer_complete
    public :: rl_frustum
    public :: rl_gen_texture_mipmaps
    public :: rl_get_active_framebuffer
    public :: rl_get_cull_distance_far
    public :: rl_get_cull_distance_near
    public :: rl_get_framebuffer_height
    public :: rl_get_framebuffer_width
    public :: rl_get_gl_texture_formats
    public :: rl_get_line_width
    public :: rl_get_location_attrib
    public :: rl_get_location_uniform
    public :: rl_get_matrix_modelview
    public :: rl_get_matrix_projection
    public :: rl_get_matrix_projection_stereo
    public :: rl_get_matrix_transform
    public :: rl_get_matrix_view_offset_stereo
    public :: rl_get_pixel_format_name
    public :: rl_get_point_size
    public :: rl_get_proc_address
    public :: rl_get_shader_buffer_size
    public :: rl_get_shader_id_default
    public :: rl_get_shader_locs_default
    public :: rl_get_texture_id_default
    public :: rl_get_version
    public :: rl_is_stereo_render_enabled
    public :: rl_load_draw_cube
    public :: rl_load_draw_quad
    public :: rl_load_extensions
    public :: rl_load_framebuffer
    public :: rl_load_identity
    public :: rl_load_render_batch
    public :: rl_load_shader
    public :: rl_load_shader_buffer
    public :: rl_load_shader_program
    public :: rl_load_shader_program_compute
    public :: rl_load_shader_program_ex
    public :: rl_load_texture
    public :: rl_load_texture_cubemap
    public :: rl_load_texture_depth
    public :: rl_load_vertex_array
    public :: rl_load_vertex_buffer
    public :: rl_load_vertex_buffer_element
    public :: rl_matrix_mode
    public :: rl_mult_matrixf
    public :: rl_normal3f
    public :: rl_ortho
    public :: rl_pop_matrix
    public :: rl_push_matrix
    public :: rl_read_screen_pixels
    public :: rl_read_shader_buffer
    public :: rl_read_texture_pixels
    public :: rl_resize_framebuffer
    public :: rl_rotatef
    public :: rl_scalef
    public :: rl_scissor
    public :: rl_set_blend_factors
    public :: rl_set_blend_factors_separate
    public :: rl_set_blend_mode
    public :: rl_set_clip_planes
    public :: rl_set_cull_face
    public :: rl_set_framebuffer_height
    public :: rl_set_framebuffer_width
    public :: rl_set_line_width
    public :: rl_set_matrix_modelview
    public :: rl_set_matrix_projection
    public :: rl_set_matrix_projection_stereo
    public :: rl_set_matrix_view_offset_stereo
    public :: rl_set_point_size
    public :: rl_set_render_batch_active
    public :: rl_set_shader
    public :: rl_set_texture
    public :: rl_set_uniform
    public :: rl_set_uniform_matrices
    public :: rl_set_uniform_matrix
    public :: rl_set_uniform_sampler
    public :: rl_set_vertex_attribute
    public :: rl_set_vertex_attribute_default
    public :: rl_set_vertex_attribute_divisor
    public :: rl_tex_coord2f
    public :: rl_texture_parameters
    public :: rl_translatef
    public :: rl_unload_framebuffer
    public :: rl_unload_render_batch
    public :: rl_unload_shader
    public :: rl_unload_shader_buffer
    public :: rl_unload_shader_program
    public :: rl_unload_texture
    public :: rl_unload_vertex_array
    public :: rl_unload_vertex_buffer
    public :: rl_update_shader_buffer
    public :: rl_update_texture
    public :: rl_update_vertex_buffer
    public :: rl_update_vertex_buffer_elements
    public :: rl_vertex2f
    public :: rl_vertex2i
    public :: rl_vertex3f
    public :: rl_viewport
    public :: rlgl_close
    public :: rlgl_init

    interface
        ! void rlActiveDrawBuffers(int count)
        subroutine rl_active_draw_buffers(count) bind(c, name='rlActiveDrawBuffers')
            import :: c_int
            implicit none
            integer(c_int), intent(in), value :: count
        end subroutine rl_active_draw_buffers

        ! void rlActiveTextureSlot(int slot)
        subroutine rl_active_texture_slot(slot) bind(c, name='rlActiveTextureSlot')
            import :: c_int
            implicit none
            integer(c_int), intent(in), value :: slot
        end subroutine rl_active_texture_slot

        ! void rlBegin(int mode)
        subroutine rl_begin(mode) bind(c, name='rlBegin')
            import :: c_int
            implicit none
            integer(c_int), intent(in), value :: mode
        end subroutine rl_begin

        ! void rlBindFramebuffer(unsigned int target, unsigned int framebuffer)
        subroutine rl_bind_framebuffer(target, framebuffer) bind(c, name='rlBindFramebuffer')
            import :: c_unsigned
            implicit none
            integer(c_unsigned), intent(in), value :: target
            integer(c_unsigned), intent(in), value :: framebuffer
        end subroutine rl_bind_framebuffer

        ! void rlBindImageTexture(unsigned int id, unsigned int index, int format, bool readonly)
        subroutine rl_bind_image_texture(id, index, format, readonly) bind(c, name='rlBindImageTexture')
            import :: c_bool, c_int, c_unsigned
            implicit none
            integer(c_unsigned), intent(in), value :: id
            integer(c_unsigned), intent(in), value :: index
            integer(c_int),      intent(in), value :: format
            logical(c_bool),     intent(in), value :: readonly
        end subroutine rl_bind_image_texture

        ! void rlBindShaderBuffer(unsigned int id, unsigned int index)
        subroutine rl_bind_shader_buffer(id, index) bind(c, name='rlBindShaderBuffer')
            import :: c_unsigned
            implicit none
            integer(c_unsigned), intent(in), value :: id
            integer(c_unsigned), intent(in), value :: index
        end subroutine rl_bind_shader_buffer

        ! void rlBlitFramebuffer(int srcX, int srcY, int srcWidth, int srcHeight, int dstX, int dstY, int dstWidth, int dstHeight, int bufferMask)
        subroutine rl_blit_framebuffer(src_x, src_y, src_width, src_height, dst_x, dst_y, dst_width, dst_height, buffer_mask) &
                bind(c, name='rlBlitFramebuffer')
            import :: c_int
            implicit none
            integer(c_int), intent(in), value :: src_x
            integer(c_int), intent(in), value :: src_y
            integer(c_int), intent(in), value :: src_width
            integer(c_int), intent(in), value :: src_height
            integer(c_int), intent(in), value :: dst_x
            integer(c_int), intent(in), value :: dst_y
            integer(c_int), intent(in), value :: dst_width
            integer(c_int), intent(in), value :: dst_height
            integer(c_int), intent(in), value :: buffer_mask
        end subroutine rl_blit_framebuffer

        ! void rlCheckErrors(void)
        subroutine rl_check_errors() bind(c, name='rlCheckErrors')
        end subroutine rl_check_errors

        ! bool rlCheckRenderBatchLimit(int vCount)
        function rl_check_render_batch_limit(v_count) bind(c, name='rlCheckRenderBatchLimit')
            import :: c_bool, c_int
            implicit none
            integer(c_int), intent(in), value :: v_count
            logical(c_bool)                   :: rl_check_render_batch_limit
        end function rl_check_render_batch_limit

        ! void rlClearColor(unsigned char r, unsigned char g, unsigned char b, unsigned char a)
        subroutine rl_clear_color(r, g, b, a) bind(c, name='rlClearColor')
            import :: c_unsigned_char
            implicit none
            integer(c_unsigned_char), intent(in), value :: r
            integer(c_unsigned_char), intent(in), value :: g
            integer(c_unsigned_char), intent(in), value :: b
            integer(c_unsigned_char), intent(in), value :: a
        end subroutine rl_clear_color

        ! void rlClearScreenBuffers(void)
        subroutine rl_clear_screen_buffers() bind(c, name='rlClearScreenBuffers')
        end subroutine rl_clear_screen_buffers

        ! void rlColor3f(float x, float y, float z)
        subroutine rl_color3f(x, y, z) bind(c, name='rlColor3f')
            import :: c_float
            implicit none
            real(c_float), intent(in), value :: x
            real(c_float), intent(in), value :: y
            real(c_float), intent(in), value :: z
        end subroutine rl_color3f

        ! void rlColor4f(float x, float y, float z, float w)
        subroutine rl_color4f(x, y, z, w) bind(c, name='rlColor4f')
            import :: c_float
            implicit none
            real(c_float), intent(in), value :: x
            real(c_float), intent(in), value :: y
            real(c_float), intent(in), value :: z
            real(c_float), intent(in), value :: w
        end subroutine rl_color4f

        ! void rlColor4ub(unsigned char r, unsigned char g, unsigned char b, unsigned char a)
        subroutine rl_color4ub(r, g, b, a) bind(c, name='rlColor4ub')
            import :: c_unsigned_char
            implicit none
            integer(c_unsigned_char), intent(in), value :: r
            integer(c_unsigned_char), intent(in), value :: g
            integer(c_unsigned_char), intent(in), value :: b
            integer(c_unsigned_char), intent(in), value :: a
        end subroutine rl_color4ub

        ! void rlColorMask(bool r, bool g, bool b, bool a)
        subroutine rl_color_mask(r, g, b, a) bind(c, name='rlColorMask')
            import :: c_bool
            implicit none
            logical(c_bool), intent(in), value :: r
            logical(c_bool), intent(in), value :: g
            logical(c_bool), intent(in), value :: b
            logical(c_bool), intent(in), value :: a
        end subroutine rl_color_mask

        ! void rlComputeShaderDispatch(unsigned int groupX, unsigned int groupY, unsigned int groupZ)
        subroutine rl_compute_shader_dispatch(group_x, group_y, group_z) bind(c, name='rlComputeShaderDispatch')
            import :: c_unsigned
            implicit none
            integer(c_unsigned), intent(in), value :: group_x
            integer(c_unsigned), intent(in), value :: group_y
            integer(c_unsigned), intent(in), value :: group_z
        end subroutine rl_compute_shader_dispatch

        ! void rlCopyFramebuffer(int x, int y, int width, int height, int format, void *pixels)
        subroutine rl_copy_framebuffer(x, y, width, height, format, pixels) bind(c, name='rlCopyFramebuffer')
            import :: c_int, c_ptr
            implicit none
            integer(c_int), intent(in), value :: x
            integer(c_int), intent(in), value :: y
            integer(c_int), intent(in), value :: width
            integer(c_int), intent(in), value :: height
            integer(c_int), intent(in), value :: format
            type(c_ptr),    intent(in), value :: pixels
        end subroutine rl_copy_framebuffer

        ! void rlCopyShaderBuffer(unsigned int destId, unsigned int srcId, unsigned int destOffset, unsigned int srcOffset, unsigned int count)
        subroutine rl_copy_shader_buffer(dest_id, src_id, dest_offset, src_offset, count) bind(c, name='rlCopyShaderBuffer')
            import :: c_unsigned
            implicit none
            integer(c_unsigned), intent(in), value :: dest_id
            integer(c_unsigned), intent(in), value :: src_id
            integer(c_unsigned), intent(in), value :: dest_offset
            integer(c_unsigned), intent(in), value :: src_offset
            integer(c_unsigned), intent(in), value :: count
        end subroutine rl_copy_shader_buffer

        ! void rlCubemapParameters(unsigned int id, int param, int value)
        subroutine rl_cubemap_parameters(id, param, value) bind(c, name='rlCubemapParameters')
            import :: c_int, c_unsigned
            implicit none
            integer(c_unsigned), intent(in), value :: id
            integer(c_int),      intent(in), value :: param
            integer(c_int),      intent(in), value :: value
        end subroutine rl_cubemap_parameters

        ! void rlDisableBackfaceCulling(void)
        subroutine rl_disable_backface_culling() bind(c, name='rlDisableBackfaceCulling')
        end subroutine rl_disable_backface_culling

        ! void rlDisableColorBlend(void)
        subroutine rl_disable_color_blend() bind(c, name='rlDisableColorBlend')
        end subroutine rl_disable_color_blend

        ! void rlDisableDepthMask(void)
        subroutine rl_disable_depth_mask() bind(c, name='rlDisableDepthMask')
        end subroutine rl_disable_depth_mask

        ! void rlDisableDepthTest(void)
        subroutine rl_disable_depth_test() bind(c, name='rlDisableDepthTest')
        end subroutine rl_disable_depth_test

        ! void rlDisableFramebuffer(void)
        subroutine rl_disable_framebuffer() bind(c, name='rlDisableFramebuffer')
        end subroutine rl_disable_framebuffer

        ! void rlDisablePointMode(void)
        subroutine rl_disable_point_mode() bind(c, name='rlDisablePointMode')
        end subroutine rl_disable_point_mode

        ! void rlDisableScissorTest(void)
        subroutine rl_disable_scissor_test() bind(c, name='rlDisableScissorTest')
        end subroutine rl_disable_scissor_test

        ! void rlDisableShader(void)
        subroutine rl_disable_shader() bind(c, name='rlDisableShader')
        end subroutine rl_disable_shader

        ! void rlDisableSmoothLines(void)
        subroutine rl_disable_smooth_lines() bind(c, name='rlDisableSmoothLines')
        end subroutine rl_disable_smooth_lines

        ! void rlDisableStatePointer(int vertexAttribType)
        subroutine rl_disable_state_pointer(vertex_attrib_type) bind(c, name='rlDisableStatePointer')
            import :: c_int
            implicit none
            integer(c_int), intent(in), value :: vertex_attrib_type
        end subroutine rl_disable_state_pointer

        ! void rlDisableStereoRender(void)
        subroutine rl_disable_stereo_render() bind(c, name='rlDisableStereoRender')
        end subroutine rl_disable_stereo_render

        ! void rlDisableTexture(void)
        subroutine rl_disable_texture() bind(c, name='rlDisableTexture')
        end subroutine rl_disable_texture

        ! void rlDisableTextureCubemap(void)
        subroutine rl_disable_texture_cubemap() bind(c, name='rlDisableTextureCubemap')
        end subroutine rl_disable_texture_cubemap

        ! void rlDisableVertexArray(void)
        subroutine rl_disable_vertex_array() bind(c, name='rlDisableVertexArray')
        end subroutine rl_disable_vertex_array

        ! void rlDisableVertexAttribute(unsigned int index)
        subroutine rl_disable_vertex_attribute(index) bind(c, name='rlDisableVertexAttribute')
            import :: c_unsigned
            implicit none
            integer(c_unsigned), intent(in), value :: index
        end subroutine rl_disable_vertex_attribute

        ! void rlDisableVertexBuffer(void)
        subroutine rl_disable_vertex_buffer() bind(c, name='rlDisableVertexBuffer')
        end subroutine rl_disable_vertex_buffer

        ! void rlDisableVertexBufferElement(void)
        subroutine rl_disable_vertex_buffer_element() bind(c, name='rlDisableVertexBufferElement')
        end subroutine rl_disable_vertex_buffer_element

        ! void rlDisableWireMode(void)
        subroutine rl_disable_wire_mode() bind(c, name='rlDisableWireMode')
        end subroutine rl_disable_wire_mode

        ! void rlDrawRenderBatch(rlRenderBatch *batch)
        subroutine rl_draw_render_batch(batch) bind(c, name='rlDrawRenderBatch')
            import :: rl_render_batch_type
            implicit none
            type(rl_render_batch_type), intent(inout) :: batch
        end subroutine rl_draw_render_batch

        ! void rlDrawRenderBatchActive(void)
        subroutine rl_draw_render_batch_active() bind(c, name='rlDrawRenderBatchActive')
        end subroutine rl_draw_render_batch_active

        ! void rlDrawVertexArray(int offset, int count)
        subroutine rl_draw_vertex_array(offset, count) bind(c, name='rlDrawVertexArray')
            import :: c_int
            implicit none
            integer(c_int), intent(in), value :: offset
            integer(c_int), intent(in), value :: count
        end subroutine rl_draw_vertex_array

        ! void rlDrawVertexArrayElements(int offset, int count, const void *buffer)
        subroutine rl_draw_vertex_array_elements(offset, count, buffer) bind(c, name='rlDrawVertexArrayElements')
            import :: c_int, c_ptr
            implicit none
            integer(c_int), intent(in), value :: offset
            integer(c_int), intent(in), value :: count
            type(c_ptr),    intent(in), value :: buffer
        end subroutine rl_draw_vertex_array_elements

        ! void rlDrawVertexArrayElementsInstanced(int offset, int count, const void *buffer, int instances)
        subroutine rl_draw_vertex_array_elements_instanced(offset, count, buffer, instances) &
                bind(c, name='rlDrawVertexArrayElementsInstanced')
            import :: c_int, c_ptr
            implicit none
            integer(c_int), intent(in), value :: offset
            integer(c_int), intent(in), value :: count
            type(c_ptr),    intent(in), value :: buffer
            integer(c_int), intent(in), value :: instances
        end subroutine rl_draw_vertex_array_elements_instanced

        ! void rlDrawVertexArrayInstanced(int offset, int count, int instances)
        subroutine rl_draw_vertex_array_instanced(offset, count, instances) bind(c, name='rlDrawVertexArrayInstanced')
            import :: c_int
            implicit none
            integer(c_int), intent(in), value :: offset
            integer(c_int), intent(in), value :: count
            integer(c_int), intent(in), value :: instances
        end subroutine rl_draw_vertex_array_instanced

        ! void rlEnableBackfaceCulling(void)
        subroutine rl_enable_backface_culling() bind(c, name='rlEnableBackfaceCulling')
        end subroutine rl_enable_backface_culling

        ! void rlEnableColorBlend(void)
        subroutine rl_enable_color_blend() bind(c, name='rlEnableColorBlend')
        end subroutine rl_enable_color_blend

        ! void rlEnableDepthMask(void)
        subroutine rl_enable_depth_mask() bind(c, name='rlEnableDepthMask')
        end subroutine rl_enable_depth_mask

        ! void rlEnableDepthTest(void)
        subroutine rl_enable_depth_test() bind(c, name='rlEnableDepthTest')
        end subroutine rl_enable_depth_test

        ! void rlEnableFramebuffer(unsigned int id)
        subroutine rl_enable_framebuffer(id) bind(c, name='rlEnableFramebuffer')
            import :: c_unsigned
            implicit none
            integer(c_unsigned), intent(in), value :: id
        end subroutine rl_enable_framebuffer

        ! void rlEnablePointMode(void)
        subroutine rl_enable_point_mode() bind(c, name='rlEnablePointMode')
        end subroutine rl_enable_point_mode

        ! void rlEnableScissorTest(void)
        subroutine rl_enable_scissor_test() bind(c, name='rlEnableScissorTest')
        end subroutine rl_enable_scissor_test

        ! void rlEnableShader(unsigned int id)
        subroutine rl_enable_shader(id) bind(c, name='rlEnableShader')
            import :: c_unsigned
            implicit none
            integer(c_unsigned), intent(in), value :: id
        end subroutine rl_enable_shader

        ! void rlEnableSmoothLines(void)
        subroutine rl_enable_smooth_lines() bind(c, name='rlEnableSmoothLines')
        end subroutine rl_enable_smooth_lines

        ! void rlEnableStatePointer(int vertexAttribType, void *buffer)
        subroutine rl_enable_state_pointer(vertex_attrib_type, buffer) bind(c, name='rlEnableStatePointer')
            import :: c_int, c_ptr
            implicit none
            integer(c_int), intent(in), value :: vertex_attrib_type
            type(c_ptr),    intent(in), value :: buffer
        end subroutine rl_enable_state_pointer

        ! void rlEnableStereoRender(void)
        subroutine rl_enable_stereo_render() bind(c, name='rlEnableStereoRender')
        end subroutine rl_enable_stereo_render

        ! void rlEnableTexture(unsigned int id)
        subroutine rl_enable_texture(id) bind(c, name='rlEnableTexture')
            import :: c_unsigned
            implicit none
            integer(c_unsigned), intent(in), value :: id
        end subroutine rl_enable_texture

        ! void rlEnableTextureCubemap(unsigned int id)
        subroutine rl_enable_texture_cubemap(id) bind(c, name='rlEnableTextureCubemap')
            import :: c_unsigned
            implicit none
            integer(c_unsigned), intent(in), value :: id
        end subroutine rl_enable_texture_cubemap

        ! bool rlEnableVertexArray(unsigned int vaoId)
        function rl_enable_vertex_array(vao_id) bind(c, name='rlEnableVertexArray')
            import :: c_bool, c_unsigned
            implicit none
            integer(c_unsigned), intent(in), value :: vao_id
            logical(c_bool)                        :: rl_enable_vertex_array
        end function rl_enable_vertex_array

        ! void rlEnableVertexAttribute(unsigned int index)
        subroutine rl_enable_vertex_attribute(index) bind(c, name='rlEnableVertexAttribute')
            import :: c_unsigned
            implicit none
            integer(c_unsigned), intent(in), value :: index
        end subroutine rl_enable_vertex_attribute

        ! void rlEnableVertexBuffer(unsigned int id)
        subroutine rl_enable_vertex_buffer(id) bind(c, name='rlEnableVertexBuffer')
            import :: c_unsigned
            implicit none
            integer(c_unsigned), intent(in), value :: id
        end subroutine rl_enable_vertex_buffer

        ! void rlEnableVertexBufferElement(unsigned int id)
        subroutine rl_enable_vertex_buffer_element(id) bind(c, name='rlEnableVertexBufferElement')
            import :: c_unsigned
            implicit none
            integer(c_unsigned), intent(in), value :: id
        end subroutine rl_enable_vertex_buffer_element

        ! void rlEnableWireMode(void)
        subroutine rl_enable_wire_mode() bind(c, name='rlEnableWireMode')
        end subroutine rl_enable_wire_mode

        ! void rlEnd(void)
        subroutine rl_end() bind(c, name='rlEnd')
        end subroutine rl_end

        ! void rlFramebufferAttach(unsigned int id, unsigned int texId, int attachType, int texType, int mipLevel)
        subroutine rl_framebuffer_attach(id, tex_id, attach_type, tex_type, mip_level) bind(c, name='rlFramebufferAttach')
            import :: c_int, c_unsigned
            implicit none
            integer(c_unsigned), intent(in), value :: id
            integer(c_unsigned), intent(in), value :: tex_id
            integer(c_int),      intent(in), value :: attach_type
            integer(c_int),      intent(in), value :: tex_type
            integer(c_int),      intent(in), value :: mip_level
        end subroutine rl_framebuffer_attach

        ! bool rlFramebufferComplete(unsigned int id)
        function rl_framebuffer_complete(id) bind(c, name='rlFramebufferComplete')
            import :: c_bool, c_unsigned
            implicit none
            integer(c_unsigned), intent(in), value :: id
            logical(c_bool)                        :: rl_framebuffer_complete
        end function rl_framebuffer_complete

        ! void rlFrustum(double left, double right, double bottom, double top, double znear, double zfar)
        subroutine rl_frustum(left, right, bottom, top, znear, zfar) bind(c, name='rlFrustum')
            import :: c_double
            implicit none
            real(c_double), intent(in), value :: left
            real(c_double), intent(in), value :: right
            real(c_double), intent(in), value :: bottom
            real(c_double), intent(in), value :: top
            real(c_double), intent(in), value :: znear
            real(c_double), intent(in), value :: zfar
        end subroutine rl_frustum

        ! void rlGenTextureMipmaps(unsigned int id, int width, int height, int format, int *mipmaps)
        subroutine rl_gen_texture_mipmaps(id, width, height, format, mipmaps) bind(c, name='rlGenTextureMipmaps')
            import :: c_int, c_unsigned
            implicit none
            integer(c_unsigned), intent(in), value :: id
            integer(c_int),      intent(in), value :: width
            integer(c_int),      intent(in), value :: height
            integer(c_int),      intent(in), value :: format
            integer(c_int),      intent(out)       :: mipmaps
        end subroutine rl_gen_texture_mipmaps

        ! unsigned int rlGetActiveFramebuffer(void)
        function rl_get_active_framebuffer() bind(c, name='rlGetActiveFramebuffer')
            import :: c_unsigned
            implicit none
            integer(c_unsigned) :: rl_get_active_framebuffer
        end function rl_get_active_framebuffer

        ! double rlGetCullDistanceFar(void)
        function rl_get_cull_distance_far() bind(c, name='rlGetCullDistanceFar')
            import :: c_double
            implicit none
            real(c_double) :: rl_get_cull_distance_far
        end function rl_get_cull_distance_far

        ! double rlGetCullDistanceNear(void)
        function rl_get_cull_distance_near() bind(c, name='rlGetCullDistanceNear')
            import :: c_double
            implicit none
            real(c_double) :: rl_get_cull_distance_near
        end function rl_get_cull_distance_near

        ! int rlGetFramebufferHeight(void)
        function rl_get_framebuffer_height() bind(c, name='rlGetFramebufferHeight')
            import :: c_int
            implicit none
            integer(c_int) :: rl_get_framebuffer_height
        end function rl_get_framebuffer_height

        ! int rlGetFramebufferWidth(void)
        function rl_get_framebuffer_width() bind(c, name='rlGetFramebufferWidth')
            import :: c_int
            implicit none
            integer(c_int) :: rl_get_framebuffer_width
        end function rl_get_framebuffer_width

        ! void rlGetGlTextureFormats(int format, unsigned int *glInternalFormat, unsigned int *glFormat, unsigned int *glType)
        subroutine rl_get_gl_texture_formats(format, gl_internal_format, gl_format, gl_type) bind(c, name='rlGetGlTextureFormats')
            import :: c_int, c_unsigned
            implicit none
            integer(c_int),      intent(in), value :: format
            integer(c_unsigned), intent(out)       :: gl_internal_format
            integer(c_unsigned), intent(out)       :: gl_format
            integer(c_unsigned), intent(out)       :: gl_type
        end subroutine rl_get_gl_texture_formats

        ! float rlGetLineWidth(void)
        function rl_get_line_width() bind(c, name='rlGetLineWidth')
            import :: c_float
            implicit none
            real(c_float) :: rl_get_line_width
        end function rl_get_line_width

        ! int rlGetLocationAttrib(unsigned int id, const char *attribName)
        function rl_get_location_attrib(id, attrib_name) bind(c, name='rlGetLocationAttrib')
            import :: c_char, c_int, c_unsigned
            implicit none
            integer(c_unsigned), intent(in), value :: id
            character(c_char),   intent(in)        :: attrib_name
            integer(c_int)                         :: rl_get_location_attrib
        end function rl_get_location_attrib

        ! int rlGetLocationUniform(unsigned int id, const char *uniformName)
        function rl_get_location_uniform(id, uniform_name) bind(c, name='rlGetLocationUniform')
            import :: c_char, c_int, c_unsigned
            implicit none
            integer(c_unsigned), intent(in), value :: id
            character(c_char),   intent(in)        :: uniform_name
            integer(c_int)                         :: rl_get_location_uniform
        end function rl_get_location_uniform

        ! Matrix rlGetMatrixModelview(void)
        function rl_get_matrix_modelview() bind(c, name='rlGetMatrixModelview')
            import :: matrix_type
            implicit none
            type(matrix_type) :: rl_get_matrix_modelview
        end function rl_get_matrix_modelview

        ! Matrix rlGetMatrixProjection(void)
        function rl_get_matrix_projection() bind(c, name='rlGetMatrixProjection')
            import :: matrix_type
            implicit none
            type(matrix_type) :: rl_get_matrix_projection
        end function rl_get_matrix_projection

        ! Matrix rlGetMatrixProjectionStereo(int eye)
        function rl_get_matrix_projection_stereo(eye) bind(c, name='rlGetMatrixProjectionStereo')
            import :: c_int, matrix_type
            implicit none
            integer(c_int), intent(in), value :: eye
            type(matrix_type)                 :: rl_get_matrix_projection_stereo
        end function rl_get_matrix_projection_stereo

        ! Matrix rlGetMatrixTransform(void)
        function rl_get_matrix_transform() bind(c, name='rlGetMatrixTransform')
            import :: matrix_type
            implicit none
            type(matrix_type) :: rl_get_matrix_transform
        end function rl_get_matrix_transform

        ! Matrix rlGetMatrixViewOffsetStereo(int eye)
        function rl_get_matrix_view_offset_stereo(eye) bind(c, name='rlGetMatrixViewOffsetStereo')
            import :: c_int, matrix_type
            implicit none
            integer(c_int), intent(in), value :: eye
            type(matrix_type)                 :: rl_get_matrix_view_offset_stereo
        end function rl_get_matrix_view_offset_stereo

        ! const char *rlGetPixelFormatName(unsigned int format)
        function rl_get_pixel_format_name(format) bind(c, name='rlGetPixelFormatName')
            import :: c_ptr, c_unsigned
            implicit none
            integer(c_unsigned), intent(in), value :: format
            type(c_ptr)                            :: rl_get_pixel_format_name
        end function rl_get_pixel_format_name

        ! float rlGetPointSize(void)
        function rl_get_point_size() bind(c, name='rlGetPointSize')
            import :: c_float
            implicit none
            real(c_float) :: rl_get_point_size
        end function rl_get_point_size

        ! void *rlGetProcAddress(const char *procName)
        function rl_get_proc_address(proc_name) bind(c, name='rlGetProcAddress')
            import :: c_char, c_ptr
            implicit none
            character(c_char), intent(in) :: proc_name
            type(c_ptr)                   :: rl_get_proc_address
        end function rl_get_proc_address

        ! unsigned int rlGetShaderBufferSize(unsigned int id)
        function rl_get_shader_buffer_size(id) bind(c, name='rlGetShaderBufferSize')
            import :: c_unsigned
            implicit none
            integer(c_unsigned), intent(in), value :: id
            integer(c_unsigned)                    :: rl_get_shader_buffer_size
        end function rl_get_shader_buffer_size

        ! unsigned int rlGetShaderIdDefault(void)
        function rl_get_shader_id_default() bind(c, name='rlGetShaderIdDefault')
            import :: c_unsigned
            implicit none
            integer(c_unsigned) :: rl_get_shader_id_default
        end function rl_get_shader_id_default

        ! int *rlGetShaderLocsDefault(void)
        function rl_get_shader_locs_default() bind(c, name='rlGetShaderLocsDefault')
            import :: c_ptr
            implicit none
            type(c_ptr) :: rl_get_shader_locs_default
        end function rl_get_shader_locs_default

        ! unsigned int rlGetTextureIdDefault(void)
        function rl_get_texture_id_default() bind(c, name='rlGetTextureIdDefault')
            import :: c_unsigned
            implicit none
            integer(c_unsigned) :: rl_get_texture_id_default
        end function rl_get_texture_id_default

        ! int rlGetVersion(void)
        function rl_get_version() bind(c, name='rlGetVersion')
            import :: c_int
            implicit none
            integer(c_int) :: rl_get_version
        end function rl_get_version

        ! bool rlIsStereoRenderEnabled(void)
        function rl_is_stereo_render_enabled() bind(c, name='rlIsStereoRenderEnabled')
            import :: c_bool
            implicit none
            logical(c_bool) :: rl_is_stereo_render_enabled
        end function rl_is_stereo_render_enabled

        ! void rlLoadDrawCube(void)
        subroutine rl_load_draw_cube() bind(c, name='rlLoadDrawCube')
        end subroutine rl_load_draw_cube

        ! void rlLoadDrawQuad(void)
        subroutine rl_load_draw_quad() bind(c, name='rlLoadDrawQuad')
        end subroutine rl_load_draw_quad

        ! void rlLoadExtensions(void *loader)
        subroutine rl_load_extensions(loader) bind(c, name='rlLoadExtensions')
            import :: c_ptr
            implicit none
            type(c_ptr), intent(in), value :: loader
        end subroutine rl_load_extensions

        ! unsigned int rlLoadFramebuffer(void)
        function rl_load_framebuffer() bind(c, name='rlLoadFramebuffer')
            import :: c_unsigned
            implicit none
            integer(c_unsigned) :: rl_load_framebuffer
        end function rl_load_framebuffer

        ! void rlLoadIdentity(void)
        subroutine rl_load_identity() bind(c, name='rlLoadIdentity')
        end subroutine rl_load_identity

        ! rlRenderBatch rlLoadRenderBatch(int numBuffers, int bufferElements)
        function rl_load_render_batch(num_buffers, buffer_elements) bind(c, name='rlLoadRenderBatch')
            import :: c_int, rl_render_batch_type
            implicit none
            integer(c_int), intent(in), value :: num_buffers
            integer(c_int), intent(in), value :: buffer_elements
            type(rl_render_batch_type)        :: rl_load_render_batch
        end function rl_load_render_batch

        ! unsigned int rlLoadShader(const char *code, int type)
        function rl_load_shader(code, type) bind(c, name='rlLoadShader')
            import :: c_char, c_int, c_unsigned
            implicit none
            character(c_char), intent(in)        :: code
            integer(c_int),    intent(in), value :: type
            integer(c_unsigned)                  :: rl_load_shader
        end function rl_load_shader

        ! unsigned int rlLoadShaderBuffer(unsigned int size, const void *data, int usageHint)
        function rl_load_shader_buffer(size, data, usage_hint) bind(c, name='rlLoadShaderBuffer')
            import :: c_int, c_ptr, c_unsigned
            implicit none
            integer(c_unsigned), intent(in), value :: size
            type(c_ptr),         intent(in), value :: data
            integer(c_int),      intent(in), value :: usage_hint
            integer(c_unsigned)                    :: rl_load_shader_buffer
        end function rl_load_shader_buffer

        ! unsigned int rlLoadShaderProgram(const char *vsCode, const char *fsCode)
        function rl_load_shader_program(vs_code, fs_code) bind(c, name='rlLoadShaderProgram')
            import :: c_char, c_unsigned
            implicit none
            character(c_char), intent(in) :: vs_code
            character(c_char), intent(in) :: fs_code
            integer(c_unsigned)           :: rl_load_shader_program
        end function rl_load_shader_program

        ! unsigned int rlLoadShaderProgramCompute(unsigned int csId)
        function rl_load_shader_program_compute(cs_id) bind(c, name='rlLoadShaderProgramCompute')
            import :: c_unsigned
            implicit none
            integer(c_unsigned), intent(in), value :: cs_id
            integer(c_unsigned)                    :: rl_load_shader_program_compute
        end function rl_load_shader_program_compute

        ! unsigned int rlLoadShaderProgramEx(unsigned int vsId, unsigned int fsId)
        function rl_load_shader_program_ex(vs_id, fs_id) bind(c, name='rlLoadShaderProgramEx')
            import :: c_unsigned
            implicit none
            integer(c_unsigned), intent(in), value :: vs_id
            integer(c_unsigned), intent(in), value :: fs_id
            integer(c_unsigned)                    :: rl_load_shader_program_ex
        end function rl_load_shader_program_ex

        ! unsigned int rlLoadTexture(const void *data, int width, int height, int format, int mipmapCount)
        function rl_load_texture(data, width, height, format, mipmap_count) bind(c, name='rlLoadTexture')
            import :: c_int, c_ptr, c_unsigned
            implicit none
            type(c_ptr),    intent(in), value :: data
            integer(c_int), intent(in), value :: width
            integer(c_int), intent(in), value :: height
            integer(c_int), intent(in), value :: format
            integer(c_int), intent(in), value :: mipmap_count
            integer(c_unsigned)               :: rl_load_texture
        end function rl_load_texture

        ! unsigned int rlLoadTextureCubemap(const void *data, int size, int format, int mipmapCount)
        function rl_load_texture_cubemap(data, size, format, mipmap_count) bind(c, name='rlLoadTextureCubemap')
            import :: c_int, c_ptr, c_unsigned
            implicit none
            type(c_ptr),    intent(in), value :: data
            integer(c_int), intent(in), value :: size
            integer(c_int), intent(in), value :: format
            integer(c_int), intent(in), value :: mipmap_count
            integer(c_unsigned)               :: rl_load_texture_cubemap
        end function rl_load_texture_cubemap

        ! unsigned int rlLoadTextureDepth(int width, int height, bool useRenderBuffer)
        function rl_load_texture_depth(width, height, use_render_buffer) bind(c, name='rlLoadTextureDepth')
            import :: c_bool, c_int, c_unsigned
            implicit none
            integer(c_int),  intent(in), value :: width
            integer(c_int),  intent(in), value :: height
            logical(c_bool), intent(in), value :: use_render_buffer
            integer(c_unsigned)                :: rl_load_texture_depth
        end function rl_load_texture_depth

        ! unsigned int rlLoadVertexArray(void)
        function rl_load_vertex_array() bind(c, name='rlLoadVertexArray')
            import :: c_unsigned
            implicit none
            integer(c_unsigned) :: rl_load_vertex_array
        end function rl_load_vertex_array

        ! unsigned int rlLoadVertexBuffer(const void *buffer, int size, bool dynamic)
        function rl_load_vertex_buffer(buffer, size, dynamic) bind(c, name='rlLoadVertexBuffer')
            import :: c_bool, c_int, c_ptr, c_unsigned
            implicit none
            type(c_ptr),     intent(in), value :: buffer
            integer(c_int),  intent(in), value :: size
            logical(c_bool), intent(in), value :: dynamic
            integer(c_unsigned)                :: rl_load_vertex_buffer
        end function rl_load_vertex_buffer

        ! unsigned int rlLoadVertexBufferElement(const void *buffer, int size, bool dynamic)
        function rl_load_vertex_buffer_element(buffer, size, dynamic) bind(c, name='rlLoadVertexBufferElement')
            import :: c_bool, c_int, c_ptr, c_unsigned
            implicit none
            type(c_ptr),     intent(in), value :: buffer
            integer(c_int),  intent(in), value :: size
            logical(c_bool), intent(in), value :: dynamic
            integer(c_unsigned)                :: rl_load_vertex_buffer_element
        end function rl_load_vertex_buffer_element

        ! void rlMatrixMode(int mode)
        subroutine rl_matrix_mode(mode) bind(c, name='rlMatrixMode')
            import :: c_int
            implicit none
            integer(c_int), intent(in), value :: mode
        end subroutine rl_matrix_mode

        ! void rlMultMatrixf(const float *matf)
        subroutine rl_mult_matrixf(matf) bind(c, name='rlMultMatrixf')
            import :: c_float
            implicit none
            real(c_float), intent(inout) :: matf(*)
        end subroutine rl_mult_matrixf

        ! void rlNormal3f(float x, float y, float z)
        subroutine rl_normal3f(x, y, z) bind(c, name='rlNormal3f')
            import :: c_float
            implicit none
            real(c_float), intent(in), value :: x
            real(c_float), intent(in), value :: y
            real(c_float), intent(in), value :: z
        end subroutine rl_normal3f

        ! void rlOrtho(double left, double right, double bottom, double top, double znear, double zfar)
        subroutine rl_ortho(left, right, bottom, top, znear, zfar) bind(c, name='rlOrtho')
            import :: c_double
            implicit none
            real(c_double), intent(in), value :: left
            real(c_double), intent(in), value :: right
            real(c_double), intent(in), value :: bottom
            real(c_double), intent(in), value :: top
            real(c_double), intent(in), value :: znear
            real(c_double), intent(in), value :: zfar
        end subroutine rl_ortho

        ! void rlPopMatrix(void)
        subroutine rl_pop_matrix() bind(c, name='rlPopMatrix')
        end subroutine rl_pop_matrix

        ! void rlPushMatrix(void)
        subroutine rl_push_matrix() bind(c, name='rlPushMatrix')
        end subroutine rl_push_matrix

        ! unsigned char *rlReadScreenPixels(int width, int height)
        function rl_read_screen_pixels(width, height) bind(c, name='rlReadScreenPixels')
            import :: c_int, c_ptr
            implicit none
            integer(c_int), intent(in), value :: width
            integer(c_int), intent(in), value :: height
            type(c_ptr)                       :: rl_read_screen_pixels
        end function rl_read_screen_pixels

        ! void rlReadShaderBuffer(unsigned int id, void *dest, unsigned int count, unsigned int offset)
        subroutine rl_read_shader_buffer(id, dest, count, offset) bind(c, name='rlReadShaderBuffer')
            import :: c_ptr, c_unsigned
            implicit none
            integer(c_unsigned), intent(in), value :: id
            type(c_ptr),         intent(in), value :: dest
            integer(c_unsigned), intent(in), value :: count
            integer(c_unsigned), intent(in), value :: offset
        end subroutine rl_read_shader_buffer

        ! void *rlReadTexturePixels(unsigned int id, int width, int height, int format)
        function rl_read_texture_pixels(id, width, height, format) bind(c, name='rlReadTexturePixels')
            import :: c_int, c_ptr, c_unsigned
            implicit none
            integer(c_unsigned), intent(in), value :: id
            integer(c_int),      intent(in), value :: width
            integer(c_int),      intent(in), value :: height
            integer(c_int),      intent(in), value :: format
            type(c_ptr)                            :: rl_read_texture_pixels
        end function rl_read_texture_pixels

        ! void rlResizeFramebuffer(int width, int height)
        subroutine rl_resize_framebuffer(width, height) bind(c, name='rlResizeFramebuffer')
            import :: c_int
            implicit none
            integer(c_int), intent(in), value :: width
            integer(c_int), intent(in), value :: height
        end subroutine rl_resize_framebuffer

        ! void rlRotatef(float angle, float x, float y, float z)
        subroutine rl_rotatef(angle, x, y, z) bind(c, name='rlRotatef')
            import :: c_float
            implicit none
            real(c_float), intent(in), value :: angle
            real(c_float), intent(in), value :: x
            real(c_float), intent(in), value :: y
            real(c_float), intent(in), value :: z
        end subroutine rl_rotatef

        ! void rlScalef(float x, float y, float z)
        subroutine rl_scalef(x, y, z) bind(c, name='rlScalef')
            import :: c_float
            implicit none
            real(c_float), intent(in), value :: x
            real(c_float), intent(in), value :: y
            real(c_float), intent(in), value :: z
        end subroutine rl_scalef

        ! void rlScissor(int x, int y, int width, int height)
        subroutine rl_scissor(x, y, width, height) bind(c, name='rlScissor')
            import :: c_int
            implicit none
            integer(c_int), intent(in), value :: x
            integer(c_int), intent(in), value :: y
            integer(c_int), intent(in), value :: width
            integer(c_int), intent(in), value :: height
        end subroutine rl_scissor

        ! void rlSetBlendFactors(int glSrcFactor, int glDstFactor, int glEquation)
        subroutine rl_set_blend_factors(gl_src_factor, gl_dst_factor, gl_equation) bind(c, name='rlSetBlendFactors')
            import :: c_int
            implicit none
            integer(c_int), intent(in), value :: gl_src_factor
            integer(c_int), intent(in), value :: gl_dst_factor
            integer(c_int), intent(in), value :: gl_equation
        end subroutine rl_set_blend_factors

        ! void rlSetBlendFactorsSeparate(int glSrcRGB, int glDstRGB, int glSrcAlpha, int glDstAlpha, int glEqRGB, int glEqAlpha)
        subroutine rl_set_blend_factors_separate(gl_src_rgb, gl_dst_rgb, gl_src_alpha, gl_dst_alpha, gl_eq_rgb, gl_eq_alpha) &
                bind(c, name='rlSetBlendFactorsSeparate')
            import :: c_int
            implicit none
            integer(c_int), intent(in), value :: gl_src_rgb
            integer(c_int), intent(in), value :: gl_dst_rgb
            integer(c_int), intent(in), value :: gl_src_alpha
            integer(c_int), intent(in), value :: gl_dst_alpha
            integer(c_int), intent(in), value :: gl_eq_rgb
            integer(c_int), intent(in), value :: gl_eq_alpha
        end subroutine rl_set_blend_factors_separate

        ! void rlSetBlendMode(int mode)
        subroutine rl_set_blend_mode(mode) bind(c, name='rlSetBlendMode')
            import :: c_int
            implicit none
            integer(c_int), intent(in), value :: mode
        end subroutine rl_set_blend_mode

        ! void rlSetClipPlanes(double nearPlane, double farPlane)
        subroutine rl_set_clip_planes(near_plane, far_plane) bind(c, name='rlSetClipPlanes')
            import :: c_double
            implicit none
            real(c_double), intent(in), value :: near_plane
            real(c_double), intent(in), value :: far_plane
        end subroutine rl_set_clip_planes

        ! void rlSetCullFace(int mode)
        subroutine rl_set_cull_face(mode) bind(c, name='rlSetCullFace')
            import :: c_int
            implicit none
            integer(c_int), intent(in), value :: mode
        end subroutine rl_set_cull_face

        ! void rlSetFramebufferHeight(int height)
        subroutine rl_set_framebuffer_height(height) bind(c, name='rlSetFramebufferHeight')
            import :: c_int
            implicit none
            integer(c_int), intent(in), value :: height
        end subroutine rl_set_framebuffer_height

        ! void rlSetFramebufferWidth(int width)
        subroutine rl_set_framebuffer_width(width) bind(c, name='rlSetFramebufferWidth')
            import :: c_int
            implicit none
            integer(c_int), intent(in), value :: width
        end subroutine rl_set_framebuffer_width

        ! void rlSetLineWidth(float width)
        subroutine rl_set_line_width(width) bind(c, name='rlSetLineWidth')
            import :: c_float
            implicit none
            real(c_float), intent(in), value :: width
        end subroutine rl_set_line_width

        ! void rlSetMatrixModelview(Matrix view)
        subroutine rl_set_matrix_modelview(view) bind(c, name='rlSetMatrixModelview')
            import :: matrix_type
            implicit none
            type(matrix_type), intent(in), value :: view
        end subroutine rl_set_matrix_modelview

        ! void rlSetMatrixProjection(Matrix proj)
        subroutine rl_set_matrix_projection(proj) bind(c, name='rlSetMatrixProjection')
            import :: matrix_type
            implicit none
            type(matrix_type), intent(in), value :: proj
        end subroutine rl_set_matrix_projection

        ! void rlSetMatrixProjectionStereo(Matrix right, Matrix left)
        subroutine rl_set_matrix_projection_stereo(right, left) bind(c, name='rlSetMatrixProjectionStereo')
            import :: matrix_type
            implicit none
            type(matrix_type), intent(in), value :: right
            type(matrix_type), intent(in), value :: left
        end subroutine rl_set_matrix_projection_stereo

        ! void rlSetMatrixViewOffsetStereo(Matrix right, Matrix left)
        subroutine rl_set_matrix_view_offset_stereo(right, left) bind(c, name='rlSetMatrixViewOffsetStereo')
            import :: matrix_type
            implicit none
            type(matrix_type), intent(in), value :: right
            type(matrix_type), intent(in), value :: left
        end subroutine rl_set_matrix_view_offset_stereo

        ! void rlSetPointSize(float size)
        subroutine rl_set_point_size(size) bind(c, name='rlSetPointSize')
            import :: c_float
            implicit none
            real(c_float), intent(in), value :: size
        end subroutine rl_set_point_size

        ! void rlSetRenderBatchActive(rlRenderBatch *batch)
        subroutine rl_set_render_batch_active(batch) bind(c, name='rlSetRenderBatchActive')
            import :: rl_render_batch_type
            implicit none
            type(rl_render_batch_type), intent(inout) :: batch
        end subroutine rl_set_render_batch_active

        ! void rlSetShader(unsigned int id, int *locs)
        subroutine rl_set_shader(id, locs) bind(c, name='rlSetShader')
            import :: c_int, c_unsigned
            implicit none
            integer(c_unsigned), intent(in), value :: id
            integer(c_int),      intent(out)       :: locs
        end subroutine rl_set_shader

        ! void rlSetTexture(unsigned int id)
        subroutine rl_set_texture(id) bind(c, name='rlSetTexture')
            import :: c_unsigned
            implicit none
            integer(c_unsigned), intent(in), value :: id
        end subroutine rl_set_texture

        ! void rlSetUniform(int locIndex, const void *value, int uniformType, int count)
        subroutine rl_set_uniform(loc_index, value, uniform_type, count) bind(c, name='rlSetUniform')
            import :: c_int, c_ptr
            implicit none
            integer(c_int), intent(in), value :: loc_index
            type(c_ptr),    intent(in), value :: value
            integer(c_int), intent(in), value :: uniform_type
            integer(c_int), intent(in), value :: count
        end subroutine rl_set_uniform

        ! void rlSetUniformMatrices(int locIndex, const Matrix *mat, int count)
        subroutine rl_set_uniform_matrices(loc_index, mat, count) bind(c, name='rlSetUniformMatrices')
            import :: c_int, matrix_type
            implicit none
            integer(c_int),    intent(in), value :: loc_index
            type(matrix_type), intent(in)        :: mat
            integer(c_int),    intent(in), value :: count
        end subroutine rl_set_uniform_matrices

        ! void rlSetUniformMatrix(int locIndex, Matrix mat)
        subroutine rl_set_uniform_matrix(loc_index, mat) bind(c, name='rlSetUniformMatrix')
            import :: c_int, matrix_type
            implicit none
            integer(c_int),    intent(in), value :: loc_index
            type(matrix_type), intent(in), value :: mat
        end subroutine rl_set_uniform_matrix

        ! void rlSetUniformSampler(int locIndex, unsigned int textureId)
        subroutine rl_set_uniform_sampler(loc_index, texture_id) bind(c, name='rlSetUniformSampler')
            import :: c_int, c_unsigned
            implicit none
            integer(c_int),      intent(in), value :: loc_index
            integer(c_unsigned), intent(in), value :: texture_id
        end subroutine rl_set_uniform_sampler

        ! void rlSetVertexAttribute(unsigned int index, int compSize, int type, bool normalized, int stride, int offset)
        subroutine rl_set_vertex_attribute(index, comp_size, type, normalized, stride, offset) bind(c, name='rlSetVertexAttribute')
            import :: c_bool, c_int, c_unsigned
            implicit none
            integer(c_unsigned), intent(in), value :: index
            integer(c_int),      intent(in), value :: comp_size
            integer(c_int),      intent(in), value :: type
            logical(c_bool),     intent(in), value :: normalized
            integer(c_int),      intent(in), value :: stride
            integer(c_int),      intent(in), value :: offset
        end subroutine rl_set_vertex_attribute

        ! void rlSetVertexAttributeDefault(int locIndex, const void *value, int attribType, int count)
        subroutine rl_set_vertex_attribute_default(loc_index, value, attrib_type, count) bind(c, name='rlSetVertexAttributeDefault')
            import :: c_int, c_ptr
            implicit none
            integer(c_int), intent(in), value :: loc_index
            type(c_ptr),    intent(in), value :: value
            integer(c_int), intent(in), value :: attrib_type
            integer(c_int), intent(in), value :: count
        end subroutine rl_set_vertex_attribute_default

        ! void rlSetVertexAttributeDivisor(unsigned int index, int divisor)
        subroutine rl_set_vertex_attribute_divisor(index, divisor) bind(c, name='rlSetVertexAttributeDivisor')
            import :: c_int, c_unsigned
            implicit none
            integer(c_unsigned), intent(in), value :: index
            integer(c_int),      intent(in), value :: divisor
        end subroutine rl_set_vertex_attribute_divisor

        ! void rlTexCoord2f(float x, float y)
        subroutine rl_tex_coord2f(x, y) bind(c, name='rlTexCoord2f')
            import :: c_float
            implicit none
            real(c_float), intent(in), value :: x
            real(c_float), intent(in), value :: y
        end subroutine rl_tex_coord2f

        ! void rlTextureParameters(unsigned int id, int param, int value)
        subroutine rl_texture_parameters(id, param, value) bind(c, name='rlTextureParameters')
            import :: c_int, c_unsigned
            implicit none
            integer(c_unsigned), intent(in), value :: id
            integer(c_int),      intent(in), value :: param
            integer(c_int),      intent(in), value :: value
        end subroutine rl_texture_parameters

        ! void rlTranslatef(float x, float y, float z)
        subroutine rl_translatef(x, y, z) bind(c, name='rlTranslatef')
            import :: c_float
            implicit none
            real(c_float), intent(in), value :: x
            real(c_float), intent(in), value :: y
            real(c_float), intent(in), value :: z
        end subroutine rl_translatef

        ! void rlUnloadFramebuffer(unsigned int id)
        subroutine rl_unload_framebuffer(id) bind(c, name='rlUnloadFramebuffer')
            import :: c_unsigned
            implicit none
            integer(c_unsigned), intent(in), value :: id
        end subroutine rl_unload_framebuffer

        ! void rlUnloadRenderBatch(rlRenderBatch batch)
        subroutine rl_unload_render_batch(batch) bind(c, name='rlUnloadRenderBatch')
            import :: rl_render_batch_type
            implicit none
            type(rl_render_batch_type), intent(in), value :: batch
        end subroutine rl_unload_render_batch

        ! void rlUnloadShader(unsigned int id)
        subroutine rl_unload_shader(id) bind(c, name='rlUnloadShader')
            import :: c_unsigned
            implicit none
            integer(c_unsigned), intent(in), value :: id
        end subroutine rl_unload_shader

        ! void rlUnloadShaderBuffer(unsigned int ssboId)
        subroutine rl_unload_shader_buffer(ssbo_id) bind(c, name='rlUnloadShaderBuffer')
            import :: c_unsigned
            implicit none
            integer(c_unsigned), intent(in), value :: ssbo_id
        end subroutine rl_unload_shader_buffer

        ! void rlUnloadShaderProgram(unsigned int id)
        subroutine rl_unload_shader_program(id) bind(c, name='rlUnloadShaderProgram')
            import :: c_unsigned
            implicit none
            integer(c_unsigned), intent(in), value :: id
        end subroutine rl_unload_shader_program

        ! void rlUnloadTexture(unsigned int id)
        subroutine rl_unload_texture(id) bind(c, name='rlUnloadTexture')
            import :: c_unsigned
            implicit none
            integer(c_unsigned), intent(in), value :: id
        end subroutine rl_unload_texture

        ! void rlUnloadVertexArray(unsigned int vaoId)
        subroutine rl_unload_vertex_array(vao_id) bind(c, name='rlUnloadVertexArray')
            import :: c_unsigned
            implicit none
            integer(c_unsigned), intent(in), value :: vao_id
        end subroutine rl_unload_vertex_array

        ! void rlUnloadVertexBuffer(unsigned int vboId)
        subroutine rl_unload_vertex_buffer(vbo_id) bind(c, name='rlUnloadVertexBuffer')
            import :: c_unsigned
            implicit none
            integer(c_unsigned), intent(in), value :: vbo_id
        end subroutine rl_unload_vertex_buffer

        ! void rlUpdateShaderBuffer(unsigned int id, const void *data, unsigned int dataSize, unsigned int offset)
        subroutine rl_update_shader_buffer(id, data, data_size, offset) bind(c, name='rlUpdateShaderBuffer')
            import :: c_ptr, c_unsigned
            implicit none
            integer(c_unsigned), intent(in), value :: id
            type(c_ptr),         intent(in), value :: data
            integer(c_unsigned), intent(in), value :: data_size
            integer(c_unsigned), intent(in), value :: offset
        end subroutine rl_update_shader_buffer

        ! void rlUpdateTexture(unsigned int id, int offsetX, int offsetY, int width, int height, int format, const void *data)
        subroutine rl_update_texture(id, offset_x, offset_y, width, height, format, data) bind(c, name='rlUpdateTexture')
            import :: c_int, c_ptr, c_unsigned
            implicit none
            integer(c_unsigned), intent(in), value :: id
            integer(c_int),      intent(in), value :: offset_x
            integer(c_int),      intent(in), value :: offset_y
            integer(c_int),      intent(in), value :: width
            integer(c_int),      intent(in), value :: height
            integer(c_int),      intent(in), value :: format
            type(c_ptr),         intent(in), value :: data
        end subroutine rl_update_texture

        ! void rlUpdateVertexBuffer(unsigned int bufferId, const void *data, int dataSize, int offset)
        subroutine rl_update_vertex_buffer(buffer_id, data, data_size, offset) bind(c, name='rlUpdateVertexBuffer')
            import :: c_int, c_ptr, c_unsigned
            implicit none
            integer(c_unsigned), intent(in), value :: buffer_id
            type(c_ptr),         intent(in), value :: data
            integer(c_int),      intent(in), value :: data_size
            integer(c_int),      intent(in), value :: offset
        end subroutine rl_update_vertex_buffer

        ! void rlUpdateVertexBufferElements(unsigned int id, const void *data, int dataSize, int offset)
        subroutine rl_update_vertex_buffer_elements(id, data, data_size, offset) bind(c, name='rlUpdateVertexBufferElements')
            import :: c_int, c_ptr, c_unsigned
            implicit none
            integer(c_unsigned), intent(in), value :: id
            type(c_ptr),         intent(in), value :: data
            integer(c_int),      intent(in), value :: data_size
            integer(c_int),      intent(in), value :: offset
        end subroutine rl_update_vertex_buffer_elements

        ! void rlVertex2f(float x, float y)
        subroutine rl_vertex2f(x, y) bind(c, name='rlVertex2f')
            import :: c_float
            implicit none
            real(c_float), intent(in), value :: x
            real(c_float), intent(in), value :: y
        end subroutine rl_vertex2f

        ! void rlVertex2i(int x, int y)
        subroutine rl_vertex2i(x, y) bind(c, name='rlVertex2i')
            import :: c_int
            implicit none
            integer(c_int), intent(in), value :: x
            integer(c_int), intent(in), value :: y
        end subroutine rl_vertex2i

        ! void rlVertex3f(float x, float y, float z)
        subroutine rl_vertex3f(x, y, z) bind(c, name='rlVertex3f')
            import :: c_float
            implicit none
            real(c_float), intent(in), value :: x
            real(c_float), intent(in), value :: y
            real(c_float), intent(in), value :: z
        end subroutine rl_vertex3f

        ! void rlViewport(int x, int y, int width, int height)
        subroutine rl_viewport(x, y, width, height) bind(c, name='rlViewport')
            import :: c_int
            implicit none
            integer(c_int), intent(in), value :: x
            integer(c_int), intent(in), value :: y
            integer(c_int), intent(in), value :: width
            integer(c_int), intent(in), value :: height
        end subroutine rl_viewport

        ! void rlglClose(void)
        subroutine rlgl_close() bind(c, name='rlglClose')
        end subroutine rlgl_close

        ! void rlglInit(int width, int height)
        subroutine rlgl_init(width, height) bind(c, name='rlglInit')
            import :: c_int
            implicit none
            integer(c_int), intent(in), value :: width
            integer(c_int), intent(in), value :: height
        end subroutine rlgl_init
    end interface
end module raylib_gl
