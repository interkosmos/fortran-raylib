! raylib.f90
!
! A collection of auto-generated Fortran 2018 interface bindings to
! raylib 5.5.
!
! Author:  Philipp Engel
! Licence: ISC
module raylib
    use, intrinsic :: iso_c_binding
    implicit none (type, external)
    private

    integer, parameter, public :: c_unsigned_int  = c_int
    integer, parameter, public :: c_unsigned_char = c_signed_char

    real, parameter, public :: PI = acos(-1.0)

    ! Vector2
    type, bind(c), public :: vector2_type
        real(kind=c_float) :: x = 0.0
        real(kind=c_float) :: y = 0.0
    end type vector2_type

    ! Vector3
    type, bind(c), public :: vector3_type
        real(kind=c_float) :: x = 0.0
        real(kind=c_float) :: y = 0.0
        real(kind=c_float) :: z = 0.0
    end type vector3_type

    ! Vector4
    type, bind(c), public :: vector4_type
        real(kind=c_float) :: x = 0.0
        real(kind=c_float) :: y = 0.0
        real(kind=c_float) :: z = 0.0
        real(kind=c_float) :: w = 0.0
    end type vector4_type

    ! Quaternion
    type, bind(c), public :: quaternion_type
        real(kind=c_float) :: x = 0.0
        real(kind=c_float) :: y = 0.0
        real(kind=c_float) :: z = 0.0
        real(kind=c_float) :: w = 0.0
    end type quaternion_type

    ! Matrix
    type, bind(c), public :: matrix_type
        real(kind=c_float) :: m0 = 0.0, m4 = 0.0,  m8 = 0.0, m12 = 0.0
        real(kind=c_float) :: m1 = 0.0, m5 = 0.0,  m9 = 0.0, m13 = 0.0
        real(kind=c_float) :: m2 = 0.0, m6 = 0.0, m10 = 0.0, m14 = 0.0
        real(kind=c_float) :: m3 = 0.0, m7 = 0.0, m11 = 0.0, m15 = 0.0
    end type matrix_type

    ! Color
    type, bind(c), public :: color_type
        integer(kind=c_unsigned_char) :: r = Int(z'00',c_unsigned_char)
        integer(kind=c_unsigned_char) :: g = Int(z'00',c_unsigned_char)
        integer(kind=c_unsigned_char) :: b = Int(z'00',c_unsigned_char)
        integer(kind=c_unsigned_char) :: a = Int(z'FF',c_unsigned_char)
    end type color_type

    ! Rectangle
    type, bind(c), public :: rectangle_type
        real(kind=c_float) :: x      = 0.0
        real(kind=c_float) :: y      = 0.0
        real(kind=c_float) :: width  = 0.0
        real(kind=c_float) :: height = 0.0
    end type rectangle_type

    ! Image
    type, bind(c), public :: image_type
        type(c_ptr)         :: data    = c_null_ptr !! void *
        integer(kind=c_int) :: width   = 0
        integer(kind=c_int) :: height  = 0
        integer(kind=c_int) :: mipmaps = 0
        integer(kind=c_int) :: format  = 0
    end type image_type

    ! Texture2D
    type, bind(c), public :: texture2d_type
        integer(kind=c_unsigned_int) :: id      = 0
        integer(kind=c_int)          :: width   = 0
        integer(kind=c_int)          :: height  = 0
        integer(kind=c_int)          :: mipmaps = 0
        integer(kind=c_int)          :: format  = 0
    end type texture2d_type

    ! TextureCubemap
    type, bind(c), public :: texture_cubemap_type
        integer(kind=c_unsigned_int) :: id      = 0_c_unsigned_int
        integer(kind=c_int)          :: width   = 0
        integer(kind=c_int)          :: height  = 0
        integer(kind=c_int)          :: mipmaps = 0
        integer(kind=c_int)          :: format  = 0
    end type texture_cubemap_type

    ! RenderTexture
    type, bind(c), public :: render_texture_type
        integer(kind=c_unsigned_int) :: id = 0_c_unsigned_int
        type(texture2d_type)         :: texture
        type(texture2d_type)         :: depth
    end type render_texture_type

    ! RenderTexture2D
    type, bind(c), public :: render_texture2d_type
        integer(kind=c_unsigned_int) :: id = 0_c_unsigned_int
        type(texture2d_type)         :: texture
        type(texture2d_type)         :: depth
    end type render_texture2d_type

    ! NPatchInfo
    type, bind(c), public :: npatch_info_type
        type(rectangle_type) :: source
        integer(kind=c_int)  :: left   = 0
        integer(kind=c_int)  :: top    = 0
        integer(kind=c_int)  :: right  = 0
        integer(kind=c_int)  :: bottom = 0
        integer(kind=c_int)  :: layout = 0
    end type npatch_info_type

    ! GlyphInfo
    type, bind(c), public :: glyph_info_type
        integer(kind=c_int) :: value     = 0
        integer(kind=c_int) :: offset_x  = 0
        integer(kind=c_int) :: offset_y  = 0
        integer(kind=c_int) :: advance_x = 0
        type(image_type)    :: image
    end type glyph_info_type

    ! Font
    type, bind(c), public :: font_type
        integer(kind=c_int)  :: base_size     = 0
        integer(kind=c_int)  :: glyph_count   = 0
        integer(kind=c_int)  :: glyph_padding = 0
        type(texture2d_type) :: texture
        type(c_ptr)          :: recs          = c_null_ptr !! Rectangle *
        type(c_ptr)          :: glyphs        = c_null_ptr !! GlyphInfo *
    end type font_type

    ! Camera, Camera3D
    type, bind(c), public :: camera3d_type
        type(vector3_type)  :: position
        type(vector3_type)  :: target
        type(vector3_type)  :: up
        real(kind=c_float)  :: fov_y      = 0.0
        integer(kind=c_int) :: projection = 0
    end type camera3d_type

    ! Camera2D
    type, bind(c), public :: camera2d_type
        type(vector2_type) :: offset
        type(vector2_type) :: target
        real(kind=c_float) :: rotation = 0.0
        real(kind=c_float) :: zoom     = 0.0
    end type camera2d_type

    ! Mesh
    type, bind(c), public :: mesh_type
        integer(kind=c_int)          :: vertex_count    = 0
        integer(kind=c_int)          :: triangle_count  = 0
        type(c_ptr)                  :: vertices        = c_null_ptr !! float *
        type(c_ptr)                  :: texcoords       = c_null_ptr !! float *
        type(c_ptr)                  :: texcoords2      = c_null_ptr !! float *
        type(c_ptr)                  :: normals         = c_null_ptr !! float *
        type(c_ptr)                  :: tangents        = c_null_ptr !! float *
        type(c_ptr)                  :: colors          = c_null_ptr !! unsigned char *
        type(c_ptr)                  :: indices         = c_null_ptr !! unsigned short *
        type(c_ptr)                  :: anim_vertices   = c_null_ptr !! float *
        type(c_ptr)                  :: anim_normals    = c_null_ptr !! float *
        type(c_ptr)                  :: bone_ids        = c_null_ptr !! unsigned char *
        type(c_ptr)                  :: bone_weights    = c_null_ptr !! float *
        integer(kind=c_unsigned_int) :: vao_id          = 0_c_unsigned_int
        type(c_ptr)                  :: vbo_id          = c_null_ptr !! unsigned int *
    end type mesh_type

    ! Shader
    type, bind(c), public :: shader_type
        integer(kind=c_unsigned_int) :: id   = 0_c_unsigned_int
        type(c_ptr)                  :: locs = c_null_ptr !! int *
    end type shader_type

    ! MaterialMap
    type, bind(c), public :: material_map_type
        type(texture2d_type) :: texture
        type(color_type)     :: color
        real(kind=c_float)   :: value = 0.0
    end type material_map_type

    ! Material
    type, bind(c), public :: material_type
        type(shader_type)  :: shader
        type(c_ptr)        :: maps        = c_null_ptr !! MaterialMap *
        real(kind=c_float) :: params(0:3) = 0.0
    end type material_type

    ! Transform
    type, bind(c), public :: transform_type
        type(vector3_type)    :: translation
        type(quaternion_type) :: rotation
        type(vector3_type)    :: scale
    end type transform_type

    ! BoneInfo
    type, bind(c), public :: bone_info_type
        character(kind=c_char) :: name(0:31) = c_null_char
        integer(kind=c_int)    :: parent     = 0
    end type bone_info_type

    ! Model
    type, bind(c), public :: model_type
        type(matrix_type)   :: transform
        integer(kind=c_int) :: mesh_count     = 0
        integer(kind=c_int) :: material_count = 0
        type(c_ptr)         :: meshes         = c_null_ptr !! Mesh *
        type(c_ptr)         :: materials      = c_null_ptr !! Material *
        type(c_ptr)         :: mesh_material  = c_null_ptr !! int *
        integer(kind=c_int) :: bone_count     = 0
        type(c_ptr)         :: bones          = c_null_ptr !! BoneInfo *
        type(c_ptr)         :: bind_pose      = c_null_ptr !! Transform *
    end type model_type

    ! ModelAnimation
    type, bind(c), public :: model_animation_type
        integer(kind=c_int)    :: bone_count  = 0
        integer(kind=c_int)    :: frame_count = 0
        type(c_ptr)            :: bones       = c_null_ptr !! BoneInfo *
        type(c_ptr)            :: frame_poses = c_null_ptr !! Transform **
        character(kind=c_char) :: name(0:31)  = c_null_char
    end type model_animation_type

    ! Ray
    type, bind(c), public :: ray_type
        type(vector3_type) :: position
        type(vector3_type) :: direction
    end type ray_type

    ! RayCollision
    type, bind(c), public :: ray_collision_type
        logical(kind=c_bool) :: hit      = .false._c_bool
        real(kind=c_float)   :: distance = 0.0
        type(vector3_type)   :: point
        type(vector3_type)   :: normal
    end type ray_collision_type

    ! BoundingBox
    type, bind(c), public :: bounding_box_type
        type(vector3_type) :: min
        type(vector3_type) :: max
    end type bounding_box_type

    ! Wave
    type, bind(c), public :: wave_type
        integer(kind=c_unsigned_int) :: frame_count = 0_c_unsigned_int
        integer(kind=c_unsigned_int) :: sample_rate = 0_c_unsigned_int
        integer(kind=c_unsigned_int) :: sample_size = 0_c_unsigned_int
        integer(kind=c_unsigned_int) :: channels    = 0_c_unsigned_int
        type(c_ptr)                  :: data        = c_null_ptr !! void *
    end type wave_type

    ! AudioStream
    type, bind(c), public :: audio_stream_type
        type(c_ptr)                  :: buffer      = c_null_ptr !! rAudioBuffer *
        type(c_ptr)                  :: processor   = c_null_ptr !! rAudioProcessor *
        integer(kind=c_unsigned_int) :: sample_rate = 0_c_unsigned_int
        integer(kind=c_unsigned_int) :: sample_size = 0_c_unsigned_int
        integer(kind=c_unsigned_int) :: channels    = 0_c_unsigned_int
    end type audio_stream_type

    ! Sound
    type, bind(c), public :: sound_type
        type(audio_stream_type)      :: stream
        integer(kind=c_unsigned_int) :: frame_count = 0
    end type sound_type

    ! Music
    type, bind(c), public :: music_type
        type(audio_stream_type)      :: stream
        integer(kind=c_unsigned_int) :: frame_count = 0_c_unsigned_int
        logical(kind=c_bool)         :: looping     = .false._c_bool
        integer(kind=c_int)          :: ctx_type    = 0
        type(c_ptr)                  :: ctx_data    = c_null_ptr !! void *
    end type music_type

    ! VrDeviceInfo
    type, bind(c), public :: vr_device_info_type
        integer(kind=c_int) :: h_resolution                = 0
        integer(kind=c_int) :: v_resolution                = 0
        real(kind=c_float)  :: h_screen_size               = 0.0
        real(kind=c_float)  :: v_screen_size               = 0.0
        real(kind=c_float)  :: v_screen_center             = 0.0
        real(kind=c_float)  :: eye_to_screen_distance      = 0.0
        real(kind=c_float)  :: lens_separation_distance    = 0.0
        real(kind=c_float)  :: interpupillary_distance     = 0.0
        real(kind=c_float)  :: lens_distortion_values(0:3) = 0.0
        real(kind=c_float)  :: chroma_ab_correction(0:3)   = 0.0
    end type vr_device_info_type

    ! VrStereoConfig
    type, bind(c), public :: vr_stereo_config_type
        type(matrix_type)  :: projection(0:1)
        type(matrix_type)  :: view_offset(0:1)
        real(kind=c_float) :: left_lens_center(0:1)    = 0.0
        real(kind=c_float) :: right_lens_center(0:1)   = 0.0
        real(kind=c_float) :: left_screen_center(0:1)  = 0.0
        real(kind=c_float) :: right_screen_center(0:1) = 0.0
        real(kind=c_float) :: scale(0:1)               = 0.0
        real(kind=c_float) :: scale_in(0:1)            = 0.0
    end type vr_stereo_config_type

    ! FilePathList
    type, bind(c), public :: file_path_list_type
        integer(kind=c_unsigned_int) :: capacity = 0_c_unsigned_int
        integer(kind=c_unsigned_int) :: count    = 0_c_unsigned_int
        type(c_ptr)                  :: paths    = c_null_ptr !! char **
    end type file_path_list_type

    integer(c_unsigned_char), parameter, private :: z130 = Int(Z'82',c_unsigned_char)
    integer(c_unsigned_char), parameter, private :: z131 = Int(Z'83',c_unsigned_char)
    integer(c_unsigned_char), parameter, private :: z135 = Int(Z'87',c_unsigned_char)
    integer(c_unsigned_char), parameter, private :: z158 = Int(Z'9E',c_unsigned_char)
    integer(c_unsigned_char), parameter, private :: z161 = Int(Z'A1',c_unsigned_char)
    integer(c_unsigned_char), parameter, private :: z172 = Int(Z'AC',c_unsigned_char)
    integer(c_unsigned_char), parameter, private :: z176 = Int(Z'B0',c_unsigned_char)
    integer(c_unsigned_char), parameter, private :: z190 = Int(Z'BE',c_unsigned_char)
    integer(c_unsigned_char), parameter, private :: z191 = Int(Z'BF',c_unsigned_char)
    integer(c_unsigned_char), parameter, private :: z194 = Int(Z'C2',c_unsigned_char)
    integer(c_unsigned_char), parameter, private :: z200 = Int(Z'C8',c_unsigned_char)
    integer(c_unsigned_char), parameter, private :: z203 = Int(Z'CB',c_unsigned_char)
    integer(c_unsigned_char), parameter, private :: z211 = Int(Z'D3',c_unsigned_char)
    integer(c_unsigned_char), parameter, private :: z228 = Int(Z'E4',c_unsigned_char)
    integer(c_unsigned_char), parameter, private :: z230 = Int(Z'E6',c_unsigned_char)
    integer(c_unsigned_char), parameter, private :: z241 = Int(Z'F1',c_unsigned_char)
    integer(c_unsigned_char), parameter, private :: z245 = Int(Z'F5',c_unsigned_char)
    integer(c_unsigned_char), parameter, private :: z249 = Int(Z'F9',c_unsigned_char)
    integer(c_unsigned_char), parameter, private :: z253 = Int(Z'FD',c_unsigned_char)
    integer(c_unsigned_char), parameter, private :: z255 = Int(Z'FF',c_unsigned_char)
    type(color_type), parameter, public :: LIGHTGRAY  = color_type(z200, z200, z200, z255)
    type(color_type), parameter, public :: GRAY       = color_type(z130, z130, z130, z255)
    type(color_type), parameter, public :: DARKGRAY   = color_type( 80,  80,  80, z255)
    type(color_type), parameter, public :: YELLOW     = color_type(z253, z249,   0, z255)
    type(color_type), parameter, public :: GOLD       = color_type(z255, z203,   0, z255)
    type(color_type), parameter, public :: ORANGE     = color_type(z255, z161,   0, z255)
    type(color_type), parameter, public :: PINK       = color_type(z255, 109, z194, z255)
    type(color_type), parameter, public :: RED        = color_type(z230,  41,  55, z255)
    type(color_type), parameter, public :: MAROON     = color_type(z190,  33,  55, z255)
    type(color_type), parameter, public :: GREEN      = color_type(  0, z228,  48, z255)
    type(color_type), parameter, public :: LIME       = color_type(  0, z158,  47, z255)
    type(color_type), parameter, public :: DARKGREEN  = color_type(  0, 117,  44, z255)
    type(color_type), parameter, public :: SKYBLUE    = color_type(102, z191, z255, z255)
    type(color_type), parameter, public :: BLUE       = color_type(  0, 121, z241, z255)
    type(color_type), parameter, public :: DARKBLUE   = color_type(  0,  82, z172, z255)
    type(color_type), parameter, public :: PURPLE     = color_type(z200, 122, z255, z255)
    type(color_type), parameter, public :: VIOLET     = color_type(z135,  60, z190, z255)
    type(color_type), parameter, public :: DARKPURPLE = color_type(112,  31, 126, z255)
    type(color_type), parameter, public :: BEIGE      = color_type(z211, z176, z131, z255)
    type(color_type), parameter, public :: BROWN      = color_type(127, 106,  79, z255)
    type(color_type), parameter, public :: DARKBROWN  = color_type( 76,  63,  47, z255)
    type(color_type), parameter, public :: WHITE      = color_type(z255, z255, z255, z255)
    type(color_type), parameter, public :: BLACK      = color_type(  0,   0,   0, z255)
    type(color_type), parameter, public :: BLANK      = color_type(  0,   0,   0,   0)
    type(color_type), parameter, public :: MAGENTA    = color_type(z255,   0, z255, z255)
    type(color_type), parameter, public :: RAYWHITE   = color_type(z245, z245, z245, z255)

    ! ConfigFlags
    integer(kind=c_int), parameter, public :: FLAG_VSYNC_HINT               = int(z'00000040')
    integer(kind=c_int), parameter, public :: FLAG_FULLSCREEN_MODE          = int(z'00000002')
    integer(kind=c_int), parameter, public :: FLAG_WINDOW_RESIZABLE         = int(z'00000004')
    integer(kind=c_int), parameter, public :: FLAG_WINDOW_UNDECORATED       = int(z'00000008')
    integer(kind=c_int), parameter, public :: FLAG_WINDOW_HIDDEN            = int(z'00000080')
    integer(kind=c_int), parameter, public :: FLAG_WINDOW_MINIMIZED         = int(z'00000200')
    integer(kind=c_int), parameter, public :: FLAG_WINDOW_MAXIMIZED         = int(z'00000400')
    integer(kind=c_int), parameter, public :: FLAG_WINDOW_UNFOCUSED         = int(z'00000800')
    integer(kind=c_int), parameter, public :: FLAG_WINDOW_TOPMOST           = int(z'00001000')
    integer(kind=c_int), parameter, public :: FLAG_WINDOW_ALWAYS_RUN        = int(z'00000100')
    integer(kind=c_int), parameter, public :: FLAG_WINDOW_TRANSPARENT       = int(z'00000010')
    integer(kind=c_int), parameter, public :: FLAG_WINDOW_HIGHDPI           = int(z'00002000')
    integer(kind=c_int), parameter, public :: FLAG_WINDOW_MOUSE_PASSTHROUGH = int(z'00004000')
    integer(kind=c_int), parameter, public :: FLAG_BORDERLESS_WINDOWED_MODE = int(z'00008000')
    integer(kind=c_int), parameter, public :: FLAG_MSAA_4X_HINT             = int(z'00000020')
    integer(kind=c_int), parameter, public :: FLAG_INTERLACED_HINT          = int(z'00010000')

    ! TraceLogLevel
    integer(kind=c_int), parameter, public :: LOG_ALL     = 0
    integer(kind=c_int), parameter, public :: LOG_TRACE   = 1
    integer(kind=c_int), parameter, public :: LOG_DEBUG   = 2
    integer(kind=c_int), parameter, public :: LOG_INFO    = 3
    integer(kind=c_int), parameter, public :: LOG_WARNING = 4
    integer(kind=c_int), parameter, public :: LOG_ERROR   = 5
    integer(kind=c_int), parameter, public :: LOG_FATAL   = 6
    integer(kind=c_int), parameter, public :: LOG_NONE    = 7

    ! KeyboardKey
    integer(kind=c_int), parameter, public :: KEY_NULL            = 0
    integer(kind=c_int), parameter, public :: KEY_APOSTROPHE      = 39
    integer(kind=c_int), parameter, public :: KEY_COMMA           = 44
    integer(kind=c_int), parameter, public :: KEY_MINUS           = 45
    integer(kind=c_int), parameter, public :: KEY_PERIOD          = 46
    integer(kind=c_int), parameter, public :: KEY_SLASH           = 47
    integer(kind=c_int), parameter, public :: KEY_ZERO            = 48
    integer(kind=c_int), parameter, public :: KEY_ONE             = 49
    integer(kind=c_int), parameter, public :: KEY_TWO             = 50
    integer(kind=c_int), parameter, public :: KEY_THREE           = 51
    integer(kind=c_int), parameter, public :: KEY_FOUR            = 52
    integer(kind=c_int), parameter, public :: KEY_FIVE            = 53
    integer(kind=c_int), parameter, public :: KEY_SIX             = 54
    integer(kind=c_int), parameter, public :: KEY_SEVEN           = 55
    integer(kind=c_int), parameter, public :: KEY_EIGHT           = 56
    integer(kind=c_int), parameter, public :: KEY_NINE            = 57
    integer(kind=c_int), parameter, public :: KEY_SEMICOLON       = 59
    integer(kind=c_int), parameter, public :: KEY_EQUAL           = 61
    integer(kind=c_int), parameter, public :: KEY_A               = 65
    integer(kind=c_int), parameter, public :: KEY_B               = 66
    integer(kind=c_int), parameter, public :: KEY_C               = 67
    integer(kind=c_int), parameter, public :: KEY_D               = 68
    integer(kind=c_int), parameter, public :: KEY_E               = 69
    integer(kind=c_int), parameter, public :: KEY_F               = 70
    integer(kind=c_int), parameter, public :: KEY_G               = 71
    integer(kind=c_int), parameter, public :: KEY_H               = 72
    integer(kind=c_int), parameter, public :: KEY_I               = 73
    integer(kind=c_int), parameter, public :: KEY_J               = 74
    integer(kind=c_int), parameter, public :: KEY_K               = 75
    integer(kind=c_int), parameter, public :: KEY_L               = 76
    integer(kind=c_int), parameter, public :: KEY_M               = 77
    integer(kind=c_int), parameter, public :: KEY_N               = 78
    integer(kind=c_int), parameter, public :: KEY_O               = 79
    integer(kind=c_int), parameter, public :: KEY_P               = 80
    integer(kind=c_int), parameter, public :: KEY_Q               = 81
    integer(kind=c_int), parameter, public :: KEY_R               = 82
    integer(kind=c_int), parameter, public :: KEY_S               = 83
    integer(kind=c_int), parameter, public :: KEY_T               = 84
    integer(kind=c_int), parameter, public :: KEY_U               = 85
    integer(kind=c_int), parameter, public :: KEY_V               = 86
    integer(kind=c_int), parameter, public :: KEY_W               = 87
    integer(kind=c_int), parameter, public :: KEY_X               = 88
    integer(kind=c_int), parameter, public :: KEY_Y               = 89
    integer(kind=c_int), parameter, public :: KEY_Z               = 90
    integer(kind=c_int), parameter, public :: KEY_LEFT_BRACKET    = 91
    integer(kind=c_int), parameter, public :: KEY_BACKSLASH       = 92
    integer(kind=c_int), parameter, public :: KEY_RIGHT_BRACKET   = 93
    integer(kind=c_int), parameter, public :: KEY_GRAVE           = 96
    integer(kind=c_int), parameter, public :: KEY_SPACE           = 32
    integer(kind=c_int), parameter, public :: KEY_ESCAPE          = 256
    integer(kind=c_int), parameter, public :: KEY_ENTER           = 257
    integer(kind=c_int), parameter, public :: KEY_TAB             = 258
    integer(kind=c_int), parameter, public :: KEY_BACKSPACE       = 259
    integer(kind=c_int), parameter, public :: KEY_INSERT          = 260
    integer(kind=c_int), parameter, public :: KEY_DELETE          = 261
    integer(kind=c_int), parameter, public :: KEY_RIGHT           = 262
    integer(kind=c_int), parameter, public :: KEY_LEFT            = 263
    integer(kind=c_int), parameter, public :: KEY_DOWN            = 264
    integer(kind=c_int), parameter, public :: KEY_UP              = 265
    integer(kind=c_int), parameter, public :: KEY_PAGE_UP         = 266
    integer(kind=c_int), parameter, public :: KEY_PAGE_DOWN       = 267
    integer(kind=c_int), parameter, public :: KEY_HOME            = 268
    integer(kind=c_int), parameter, public :: KEY_END             = 269
    integer(kind=c_int), parameter, public :: KEY_CAPS_LOCK       = 280
    integer(kind=c_int), parameter, public :: KEY_SCROLL_LOCK     = 281
    integer(kind=c_int), parameter, public :: KEY_NUM_LOCK        = 282
    integer(kind=c_int), parameter, public :: KEY_PRINT_SCREEN    = 283
    integer(kind=c_int), parameter, public :: KEY_PAUSE           = 284
    integer(kind=c_int), parameter, public :: KEY_F1              = 290
    integer(kind=c_int), parameter, public :: KEY_F2              = 291
    integer(kind=c_int), parameter, public :: KEY_F3              = 292
    integer(kind=c_int), parameter, public :: KEY_F4              = 293
    integer(kind=c_int), parameter, public :: KEY_F5              = 294
    integer(kind=c_int), parameter, public :: KEY_F6              = 295
    integer(kind=c_int), parameter, public :: KEY_F7              = 296
    integer(kind=c_int), parameter, public :: KEY_F8              = 297
    integer(kind=c_int), parameter, public :: KEY_F9              = 298
    integer(kind=c_int), parameter, public :: KEY_F10             = 299
    integer(kind=c_int), parameter, public :: KEY_F11             = 300
    integer(kind=c_int), parameter, public :: KEY_F12             = 301
    integer(kind=c_int), parameter, public :: KEY_LEFT_SHIFT      = 340
    integer(kind=c_int), parameter, public :: KEY_LEFT_CONTROL    = 341
    integer(kind=c_int), parameter, public :: KEY_LEFT_ALT        = 342
    integer(kind=c_int), parameter, public :: KEY_LEFT_SUPER      = 343
    integer(kind=c_int), parameter, public :: KEY_RIGHT_SHIFT     = 344
    integer(kind=c_int), parameter, public :: KEY_RIGHT_CONTROL   = 345
    integer(kind=c_int), parameter, public :: KEY_RIGHT_ALT       = 346
    integer(kind=c_int), parameter, public :: KEY_RIGHT_SUPER     = 347
    integer(kind=c_int), parameter, public :: KEY_KB_MENU         = 348
    integer(kind=c_int), parameter, public :: KEY_KP_0            = 320
    integer(kind=c_int), parameter, public :: KEY_KP_1            = 321
    integer(kind=c_int), parameter, public :: KEY_KP_2            = 322
    integer(kind=c_int), parameter, public :: KEY_KP_3            = 323
    integer(kind=c_int), parameter, public :: KEY_KP_4            = 324
    integer(kind=c_int), parameter, public :: KEY_KP_5            = 325
    integer(kind=c_int), parameter, public :: KEY_KP_6            = 326
    integer(kind=c_int), parameter, public :: KEY_KP_7            = 327
    integer(kind=c_int), parameter, public :: KEY_KP_8            = 328
    integer(kind=c_int), parameter, public :: KEY_KP_9            = 329
    integer(kind=c_int), parameter, public :: KEY_KP_DECIMAL      = 330
    integer(kind=c_int), parameter, public :: KEY_KP_DIVIDE       = 331
    integer(kind=c_int), parameter, public :: KEY_KP_MULTIPLY     = 332
    integer(kind=c_int), parameter, public :: KEY_KP_SUBTRACT     = 333
    integer(kind=c_int), parameter, public :: KEY_KP_ADD          = 334
    integer(kind=c_int), parameter, public :: KEY_KP_ENTER        = 335
    integer(kind=c_int), parameter, public :: KEY_KP_EQUAL        = 336
    integer(kind=c_int), parameter, public :: KEY_BACK            = 4
    integer(kind=c_int), parameter, public :: KEY_MENU            = 82
    integer(kind=c_int), parameter, public :: KEY_VOLUME_UP       = 24
    integer(kind=c_int), parameter, public :: KEY_VOLUME_DOWN     = 25

    ! MouseButton
    integer(kind=c_int), parameter, public :: MOUSE_BUTTON_LEFT    = 0
    integer(kind=c_int), parameter, public :: MOUSE_BUTTON_RIGHT   = 1
    integer(kind=c_int), parameter, public :: MOUSE_BUTTON_MIDDLE  = 2
    integer(kind=c_int), parameter, public :: MOUSE_BUTTON_SIDE    = 3
    integer(kind=c_int), parameter, public :: MOUSE_BUTTON_EXTRA   = 4
    integer(kind=c_int), parameter, public :: MOUSE_BUTTON_FORWARD = 5
    integer(kind=c_int), parameter, public :: MOUSE_BUTTON_BACK    = 6

    ! MouseCursor
    integer(kind=c_int), parameter, public :: MOUSE_CURSOR_DEFAULT       = 0
    integer(kind=c_int), parameter, public :: MOUSE_CURSOR_ARROW         = 1
    integer(kind=c_int), parameter, public :: MOUSE_CURSOR_IBEAM         = 2
    integer(kind=c_int), parameter, public :: MOUSE_CURSOR_CROSSHAIR     = 3
    integer(kind=c_int), parameter, public :: MOUSE_CURSOR_POINTING_HAND = 4
    integer(kind=c_int), parameter, public :: MOUSE_CURSOR_RESIZE_EW     = 5
    integer(kind=c_int), parameter, public :: MOUSE_CURSOR_RESIZE_NS     = 6
    integer(kind=c_int), parameter, public :: MOUSE_CURSOR_RESIZE_NWSE   = 7
    integer(kind=c_int), parameter, public :: MOUSE_CURSOR_RESIZE_NESW   = 8
    integer(kind=c_int), parameter, public :: MOUSE_CURSOR_RESIZE_ALL    = 9
    integer(kind=c_int), parameter, public :: MOUSE_CURSOR_NOT_ALLOWED   = 10

    ! GamepadButton
    integer(kind=c_int), parameter, public :: GAMEPAD_BUTTON_UNKNOWN          = 0
    integer(kind=c_int), parameter, public :: GAMEPAD_BUTTON_LEFT_FACE_UP     = 1
    integer(kind=c_int), parameter, public :: GAMEPAD_BUTTON_LEFT_FACE_RIGHT  = 2
    integer(kind=c_int), parameter, public :: GAMEPAD_BUTTON_LEFT_FACE_DOWN   = 3
    integer(kind=c_int), parameter, public :: GAMEPAD_BUTTON_LEFT_FACE_LEFT   = 4
    integer(kind=c_int), parameter, public :: GAMEPAD_BUTTON_RIGHT_FACE_UP    = 5
    integer(kind=c_int), parameter, public :: GAMEPAD_BUTTON_RIGHT_FACE_RIGHT = 6
    integer(kind=c_int), parameter, public :: GAMEPAD_BUTTON_RIGHT_FACE_DOWN  = 7
    integer(kind=c_int), parameter, public :: GAMEPAD_BUTTON_RIGHT_FACE_LEFT  = 8
    integer(kind=c_int), parameter, public :: GAMEPAD_BUTTON_LEFT_TRIGGER_1   = 9
    integer(kind=c_int), parameter, public :: GAMEPAD_BUTTON_LEFT_TRIGGER_2   = 10
    integer(kind=c_int), parameter, public :: GAMEPAD_BUTTON_RIGHT_TRIGGER_1  = 11
    integer(kind=c_int), parameter, public :: GAMEPAD_BUTTON_RIGHT_TRIGGER_2  = 12
    integer(kind=c_int), parameter, public :: GAMEPAD_BUTTON_MIDDLE_LEFT      = 13
    integer(kind=c_int), parameter, public :: GAMEPAD_BUTTON_MIDDLE           = 14
    integer(kind=c_int), parameter, public :: GAMEPAD_BUTTON_MIDDLE_RIGHT     = 15
    integer(kind=c_int), parameter, public :: GAMEPAD_BUTTON_LEFT_THUMB       = 16
    integer(kind=c_int), parameter, public :: GAMEPAD_BUTTON_RIGHT_THUMB      = 17

    ! GamepadAxis
    integer(kind=c_int), parameter, public :: GAMEPAD_AXIS_LEFT_X        = 0
    integer(kind=c_int), parameter, public :: GAMEPAD_AXIS_LEFT_Y        = 1
    integer(kind=c_int), parameter, public :: GAMEPAD_AXIS_RIGHT_X       = 2
    integer(kind=c_int), parameter, public :: GAMEPAD_AXIS_RIGHT_Y       = 3
    integer(kind=c_int), parameter, public :: GAMEPAD_AXIS_LEFT_TRIGGER  = 4
    integer(kind=c_int), parameter, public :: GAMEPAD_AXIS_RIGHT_TRIGGER = 5

    ! MaterialMapIndex
    integer(kind=c_int), parameter, public :: MATERIAL_MAP_ALBEDO     = 0
    integer(kind=c_int), parameter, public :: MATERIAL_MAP_METALNESS  = 1
    integer(kind=c_int), parameter, public :: MATERIAL_MAP_NORMAL     = 2
    integer(kind=c_int), parameter, public :: MATERIAL_MAP_ROUGHNESS  = 3
    integer(kind=c_int), parameter, public :: MATERIAL_MAP_OCCLUSION  = 4
    integer(kind=c_int), parameter, public :: MATERIAL_MAP_EMISSION   = 5
    integer(kind=c_int), parameter, public :: MATERIAL_MAP_HEIGHT     = 6
    integer(kind=c_int), parameter, public :: MATERIAL_MAP_CUBEMAP    = 7
    integer(kind=c_int), parameter, public :: MATERIAL_MAP_IRRADIANCE = 8
    integer(kind=c_int), parameter, public :: MATERIAL_MAP_PREFILTER  = 9
    integer(kind=c_int), parameter, public :: MATERIAL_MAP_BRDF       = 10

    integer(kind=c_int), parameter, public :: MATERIAL_MAP_DIFFUSE    = 0
    integer(kind=c_int), parameter, public :: MATERIAL_MAP_SPECULAR   = 1

    ! ShaderLocationIndex
    integer(kind=c_int), parameter, public :: SHADER_LOC_VERTEX_POSITION    = 0
    integer(kind=c_int), parameter, public :: SHADER_LOC_VERTEX_TEXCOORD01  = 1
    integer(kind=c_int), parameter, public :: SHADER_LOC_VERTEX_TEXCOORD02  = 2
    integer(kind=c_int), parameter, public :: SHADER_LOC_VERTEX_NORMAL      = 3
    integer(kind=c_int), parameter, public :: SHADER_LOC_VERTEX_TANGENT     = 4
    integer(kind=c_int), parameter, public :: SHADER_LOC_VERTEX_COLOR       = 5
    integer(kind=c_int), parameter, public :: SHADER_LOC_MATRIX_MVP         = 6
    integer(kind=c_int), parameter, public :: SHADER_LOC_MATRIX_VIEW        = 7
    integer(kind=c_int), parameter, public :: SHADER_LOC_MATRIX_PROJECTION  = 8
    integer(kind=c_int), parameter, public :: SHADER_LOC_MATRIX_MODEL       = 9
    integer(kind=c_int), parameter, public :: SHADER_LOC_MATRIX_NORMAL      = 10
    integer(kind=c_int), parameter, public :: SHADER_LOC_VECTOR_VIEW        = 11
    integer(kind=c_int), parameter, public :: SHADER_LOC_COLOR_DIFFUSE      = 12
    integer(kind=c_int), parameter, public :: SHADER_LOC_COLOR_SPECULAR     = 13
    integer(kind=c_int), parameter, public :: SHADER_LOC_COLOR_AMBIENT      = 14
    integer(kind=c_int), parameter, public :: SHADER_LOC_MAP_ALBEDO         = 15
    integer(kind=c_int), parameter, public :: SHADER_LOC_MAP_METALNESS      = 16
    integer(kind=c_int), parameter, public :: SHADER_LOC_MAP_NORMAL         = 17
    integer(kind=c_int), parameter, public :: SHADER_LOC_MAP_ROUGHNESS      = 18
    integer(kind=c_int), parameter, public :: SHADER_LOC_MAP_OCCLUSION      = 19
    integer(kind=c_int), parameter, public :: SHADER_LOC_MAP_EMISSION       = 20
    integer(kind=c_int), parameter, public :: SHADER_LOC_MAP_HEIGHT         = 21
    integer(kind=c_int), parameter, public :: SHADER_LOC_MAP_CUBEMAP        = 22
    integer(kind=c_int), parameter, public :: SHADER_LOC_MAP_IRRADIANCE     = 23
    integer(kind=c_int), parameter, public :: SHADER_LOC_MAP_PREFILTER      = 24
    integer(kind=c_int), parameter, public :: SHADER_LOC_MAP_BRDF           = 25

    ! ShaderUniformDataType
    integer(kind=c_int), parameter, public :: SHADER_UNIFORM_FLOAT     = 0
    integer(kind=c_int), parameter, public :: SHADER_UNIFORM_VEC2      = 1
    integer(kind=c_int), parameter, public :: SHADER_UNIFORM_VEC3      = 2
    integer(kind=c_int), parameter, public :: SHADER_UNIFORM_VEC4      = 3
    integer(kind=c_int), parameter, public :: SHADER_UNIFORM_INT       = 4
    integer(kind=c_int), parameter, public :: SHADER_UNIFORM_IVEC2     = 5
    integer(kind=c_int), parameter, public :: SHADER_UNIFORM_IVEC3     = 6
    integer(kind=c_int), parameter, public :: SHADER_UNIFORM_IVEC4     = 7
    integer(kind=c_int), parameter, public :: SHADER_UNIFORM_SAMPLER2D = 8

    ! ShaderAttributeDataType
    integer(kind=c_int), parameter, public :: SHADER_ATTRIB_FLOAT = 0
    integer(kind=c_int), parameter, public :: SHADER_ATTRIB_VEC2  = 1
    integer(kind=c_int), parameter, public :: SHADER_ATTRIB_VEC3  = 2
    integer(kind=c_int), parameter, public :: SHADER_ATTRIB_VEC4  = 3

    ! PixelFormat
    integer(kind=c_int), parameter, public :: PIXELFORMAT_UNCOMPRESSED_GRAYSCALE    = 1
    integer(kind=c_int), parameter, public :: PIXELFORMAT_UNCOMPRESSED_GRAY_ALPHA   = 2
    integer(kind=c_int), parameter, public :: PIXELFORMAT_UNCOMPRESSED_R5G6B5       = 3
    integer(kind=c_int), parameter, public :: PIXELFORMAT_UNCOMPRESSED_R8G8B8       = 4
    integer(kind=c_int), parameter, public :: PIXELFORMAT_UNCOMPRESSED_R5G5B5A1     = 5
    integer(kind=c_int), parameter, public :: PIXELFORMAT_UNCOMPRESSED_R4G4B4A4     = 6
    integer(kind=c_int), parameter, public :: PIXELFORMAT_UNCOMPRESSED_R8G8B8A8     = 7
    integer(kind=c_int), parameter, public :: PIXELFORMAT_UNCOMPRESSED_R32          = 8
    integer(kind=c_int), parameter, public :: PIXELFORMAT_UNCOMPRESSED_R32G32B32    = 9
    integer(kind=c_int), parameter, public :: PIXELFORMAT_UNCOMPRESSED_R32G32B32A32 = 10
    integer(kind=c_int), parameter, public :: PIXELFORMAT_UNCOMPRESSED_R16          = 11
    integer(kind=c_int), parameter, public :: PIXELFORMAT_UNCOMPRESSED_R16G16B16    = 12
    integer(kind=c_int), parameter, public :: PIXELFORMAT_UNCOMPRESSED_R16G16B16A16 = 13
    integer(kind=c_int), parameter, public :: PIXELFORMAT_COMPRESSED_DXT1_RGB       = 14
    integer(kind=c_int), parameter, public :: PIXELFORMAT_COMPRESSED_DXT1_RGBA      = 15
    integer(kind=c_int), parameter, public :: PIXELFORMAT_COMPRESSED_DXT3_RGBA      = 16
    integer(kind=c_int), parameter, public :: PIXELFORMAT_COMPRESSED_DXT5_RGBA      = 17
    integer(kind=c_int), parameter, public :: PIXELFORMAT_COMPRESSED_ETC1_RGB       = 18
    integer(kind=c_int), parameter, public :: PIXELFORMAT_COMPRESSED_ETC2_RGB       = 19
    integer(kind=c_int), parameter, public :: PIXELFORMAT_COMPRESSED_ETC2_EAC_RGBA  = 20
    integer(kind=c_int), parameter, public :: PIXELFORMAT_COMPRESSED_PVRT_RGB       = 21
    integer(kind=c_int), parameter, public :: PIXELFORMAT_COMPRESSED_PVRT_RGBA      = 22
    integer(kind=c_int), parameter, public :: PIXELFORMAT_COMPRESSED_ASTC_4x4_RGBA  = 23
    integer(kind=c_int), parameter, public :: PIXELFORMAT_COMPRESSED_ASTC_8x8_RGBA  = 24

    ! TextureFilter
    integer(kind=c_int), parameter, public :: TEXTURE_FILTER_POINT           = 0
    integer(kind=c_int), parameter, public :: TEXTURE_FILTER_BILINEAR        = 1
    integer(kind=c_int), parameter, public :: TEXTURE_FILTER_TRILINEAR       = 2
    integer(kind=c_int), parameter, public :: TEXTURE_FILTER_ANISOTROPIC_4X  = 3
    integer(kind=c_int), parameter, public :: TEXTURE_FILTER_ANISOTROPIC_8X  = 4
    integer(kind=c_int), parameter, public :: TEXTURE_FILTER_ANISOTROPIC_16X = 5

    ! TextureWrap
    integer(kind=c_int), parameter, public :: TEXTURE_WRAP_REPEAT        = 0
    integer(kind=c_int), parameter, public :: TEXTURE_WRAP_CLAMP         = 1
    integer(kind=c_int), parameter, public :: TEXTURE_WRAP_MIRROR_REPEAT = 2
    integer(kind=c_int), parameter, public :: TEXTURE_WRAP_MIRROR_CLAMP  = 3

    ! CubemapLayout
    integer(kind=c_int), parameter, public :: CUBEMAP_LAYOUT_AUTO_DETECT         = 0
    integer(kind=c_int), parameter, public :: CUBEMAP_LAYOUT_LINE_VERTICAL       = 1
    integer(kind=c_int), parameter, public :: CUBEMAP_LAYOUT_LINE_HORIZONTAL     = 2
    integer(kind=c_int), parameter, public :: CUBEMAP_LAYOUT_CROSS_THREE_BY_FOUR = 3
    integer(kind=c_int), parameter, public :: CUBEMAP_LAYOUT_CROSS_FOUR_BY_THREE = 4
    integer(kind=c_int), parameter, public :: CUBEMAP_LAYOUT_PANORAMA            = 5

    ! FontType
    integer(kind=c_int), parameter, public :: FONT_DEFAULT = 0
    integer(kind=c_int), parameter, public :: FONT_BITMAP  = 1
    integer(kind=c_int), parameter, public :: FONT_SDF     = 2

    ! BlendMode
    integer(kind=c_int), parameter, public :: BLEND_ALPHA             = 0
    integer(kind=c_int), parameter, public :: BLEND_ADDITIVE          = 1
    integer(kind=c_int), parameter, public :: BLEND_MULTIPLIED        = 2
    integer(kind=c_int), parameter, public :: BLEND_ADD_COLORS        = 3
    integer(kind=c_int), parameter, public :: BLEND_SUBTRACT_COLORS   = 4
    integer(kind=c_int), parameter, public :: BLEND_ALPHA_PREMULTIPLY = 5
    integer(kind=c_int), parameter, public :: BLEND_CUSTOM            = 6
    integer(kind=c_int), parameter, public :: BLEND_CUSTOM_SEPARATE   = 7

    ! Gesture
    integer(kind=c_int), parameter, public :: GESTURE_NONE        = 0
    integer(kind=c_int), parameter, public :: GESTURE_TAP         = 1
    integer(kind=c_int), parameter, public :: GESTURE_DOUBLETAP   = 2
    integer(kind=c_int), parameter, public :: GESTURE_HOLD        = 4
    integer(kind=c_int), parameter, public :: GESTURE_DRAG        = 8
    integer(kind=c_int), parameter, public :: GESTURE_SWIPE_RIGHT = 16
    integer(kind=c_int), parameter, public :: GESTURE_SWIPE_LEFT  = 32
    integer(kind=c_int), parameter, public :: GESTURE_SWIPE_UP    = 64
    integer(kind=c_int), parameter, public :: GESTURE_SWIPE_DOWN  = 128
    integer(kind=c_int), parameter, public :: GESTURE_PINCH_IN    = 256
    integer(kind=c_int), parameter, public :: GESTURE_PINCH_OUT   = 512

    ! CameraMode
    integer(kind=c_int), parameter, public :: CAMERA_CUSTOM       = 0
    integer(kind=c_int), parameter, public :: CAMERA_FREE         = 1
    integer(kind=c_int), parameter, public :: CAMERA_ORBITAL      = 2
    integer(kind=c_int), parameter, public :: CAMERA_FIRST_PERSON = 3
    integer(kind=c_int), parameter, public :: CAMERA_THIRD_PERSON = 4

    ! CameraProjection
    integer(kind=c_int), parameter, public :: CAMERA_PERSPECTIVE  = 0
    integer(kind=c_int), parameter, public :: CAMERA_ORTHOGRAPHIC = 1

    ! NPatchLayout
    integer(kind=c_int), parameter, public :: NPATCH_NINE_PATCH             = 0
    integer(kind=c_int), parameter, public :: NPATCH_THREE_PATCH_VERTICAL   = 1
    integer(kind=c_int), parameter, public :: NPATCH_THREE_PATCH_HORIZONTAL = 2

    public :: attach_audio_mixed_processor
    public :: attach_audio_stream_processor
    public :: begin_blend_mode
    public :: begin_drawing
    public :: begin_mode2d
    public :: begin_mode3d
    public :: begin_scissor_mode
    public :: begin_shader_mode
    public :: begin_texture_mode
    public :: begin_vr_stereo_mode
    public :: change_directory
    public :: check_collision_box_sphere
    public :: check_collision_boxes
    public :: check_collision_circle_line
    public :: check_collision_circle_rec
    public :: check_collision_circles
    public :: check_collision_lines
    public :: check_collision_point_circle
    public :: check_collision_point_line
    public :: check_collision_point_poly
    public :: check_collision_point_rec
    public :: check_collision_point_triangle
    public :: check_collision_recs
    public :: check_collision_spheres
    public :: clear_background
    public :: clear_window_state
    public :: close_audio_device
    public :: close_window
    public :: codepoint_to_utf8
    public :: color_alpha
    public :: color_alpha_blend
    public :: color_brightness
    public :: color_contrast
    public :: color_from_hsv
    public :: color_from_normalized
    public :: color_is_equal
    public :: color_lerp
    public :: color_tint
    public :: color_to_int
    public :: compress_data
    public :: compute_crc32
    public :: compute_md5
    public :: compute_sha1
    public :: decode_data_base64
    public :: decompress_data
    public :: detach_audio_mixed_processor
    public :: detach_audio_stream_processor
    public :: directory_exists
    public :: disable_cursor
    public :: disable_event_waiting
    public :: draw_billboard
    public :: draw_billboard_pro
    public :: draw_billboard_rec
    public :: draw_bounding_box
    public :: draw_capsule
    public :: draw_capsule_wires
    public :: draw_circle
    public :: draw_circle3d
    public :: draw_circle_gradient
    public :: draw_circle_lines
    public :: draw_circle_lines_v
    public :: draw_circle_sector
    public :: draw_circle_sector_lines
    public :: draw_circle_v
    public :: draw_cube
    public :: draw_cube_v
    public :: draw_cube_wires
    public :: draw_cube_wires_v
    public :: draw_cylinder
    public :: draw_cylinder_ex
    public :: draw_cylinder_wires
    public :: draw_cylinder_wires_ex
    public :: draw_ellipse
    public :: draw_ellipse_lines
    public :: draw_fps
    public :: draw_grid
    public :: draw_line
    public :: draw_line3d
    public :: draw_line_bezier
    public :: draw_line_ex
    public :: draw_line_strip
    public :: draw_line_v
    public :: draw_mesh
    public :: draw_mesh_instanced
    public :: draw_model
    public :: draw_model_ex
    public :: draw_model_points
    public :: draw_model_points_ex
    public :: draw_model_wires
    public :: draw_model_wires_ex
    public :: draw_pixel
    public :: draw_pixel_v
    public :: draw_plane
    public :: draw_point3d
    public :: draw_poly
    public :: draw_poly_lines
    public :: draw_poly_lines_ex
    public :: draw_ray
    public :: draw_rectangle
    public :: draw_rectangle_gradient_ex
    public :: draw_rectangle_gradient_h
    public :: draw_rectangle_gradient_v
    public :: draw_rectangle_lines
    public :: draw_rectangle_lines_ex
    public :: draw_rectangle_pro
    public :: draw_rectangle_rec
    public :: draw_rectangle_rounded
    public :: draw_rectangle_rounded_lines
    public :: draw_rectangle_v
    public :: draw_ring
    public :: draw_ring_lines
    public :: draw_sphere
    public :: draw_sphere_ex
    public :: draw_sphere_wires
    public :: draw_spline_basis
    public :: draw_spline_bezier_cubic
    public :: draw_spline_bezier_quadratic
    public :: draw_spline_catmull_rom
    public :: draw_spline_linear
    public :: draw_spline_segment_basis
    public :: draw_spline_segment_bezier_cubic
    public :: draw_spline_segment_bezier_quadratic
    public :: draw_spline_segment_catmull_rom
    public :: draw_spline_segment_linear
    public :: draw_text
    public :: draw_text_codepoint
    public :: draw_text_codepoints
    public :: draw_text_ex
    public :: draw_text_pro
    public :: draw_texture
    public :: draw_texture_ex
    public :: draw_texture_npatch
    public :: draw_texture_pro
    public :: draw_texture_rec
    public :: draw_texture_v
    public :: draw_triangle
    public :: draw_triangle3d
    public :: draw_triangle_fan
    public :: draw_triangle_lines
    public :: draw_triangle_strip
    public :: draw_triangle_strip3d
    public :: enable_cursor
    public :: enable_event_waiting
    public :: encode_data_base64
    public :: end_blend_mode
    public :: end_drawing
    public :: end_mode2d
    public :: end_mode3d
    public :: end_scissor_mode
    public :: end_shader_mode
    public :: end_texture_mode
    public :: end_vr_stereo_mode
    public :: export_data_as_code
    public :: export_font_as_code
    public :: export_image
    public :: export_image_as_code
    public :: export_image_to_memory
    public :: export_mesh
    public :: export_mesh_as_code
    public :: export_wave
    public :: export_wave_as_code
    public :: fade
    public :: file_exists
    public :: gen_image_cellular
    public :: gen_image_checked
    public :: gen_image_color
    public :: gen_image_font_atlas
    public :: gen_image_gradient_linear
    public :: gen_image_gradient_radial
    public :: gen_image_gradient_square
    public :: gen_image_perlin_noise
    public :: gen_image_text
    public :: gen_image_white_noise
    public :: gen_mesh_cone
    public :: gen_mesh_cube
    public :: gen_mesh_cubicmap
    public :: gen_mesh_cylinder
    public :: gen_mesh_heightmap
    public :: gen_mesh_hemi_sphere
    public :: gen_mesh_knot
    public :: gen_mesh_plane
    public :: gen_mesh_poly
    public :: gen_mesh_sphere
    public :: gen_mesh_tangents
    public :: gen_mesh_torus
    public :: gen_texture_mipmaps
    public :: get_application_directory
    public :: get_camera_matrix
    public :: get_camera_matrix2d
    public :: get_char_pressed
    public :: get_clipboard_image
    public :: get_clipboard_text
    public :: get_codepoint
    public :: get_codepoint_count
    public :: get_codepoint_next
    public :: get_codepoint_previous
    public :: get_collision_rec
    public :: get_color
    public :: get_current_monitor
    public :: get_directory_path
    public :: get_file_extension
    public :: get_file_length
    public :: get_file_mod_time
    public :: get_file_name
    public :: get_file_name_without_ext
    public :: get_font_default
    public :: get_fps
    public :: get_frame_time
    public :: get_gamepad_axis_count
    public :: get_gamepad_axis_movement
    public :: get_gamepad_button_pressed
    public :: get_gamepad_name
    public :: get_gesture_detected
    public :: get_gesture_drag_angle
    public :: get_gesture_hold_duration
    public :: get_gesture_pinch_angle
    public :: get_glyph_atlas_rec
    public :: get_glyph_index
    public :: get_glyph_info
    public :: get_image_alpha_border
    public :: get_image_color
    public :: get_key_pressed
    public :: get_master_volume
    public :: get_mesh_bounding_box
    public :: get_model_bounding_box
    public :: get_monitor_count
    public :: get_monitor_height
    public :: get_monitor_name
    public :: get_monitor_physical_height
    public :: get_monitor_physical_width
    public :: get_monitor_refresh_rate
    public :: get_monitor_width
    public :: get_mouse_delta
    public :: get_mouse_position
    public :: get_mouse_wheel_move
    public :: get_mouse_x
    public :: get_mouse_y
    public :: get_music_time_length
    public :: get_music_time_played
    public :: get_pixel_color
    public :: get_pixel_data_size
    public :: get_prev_directory_path
    public :: get_random_value
    public :: get_ray_collision_box
    public :: get_ray_collision_mesh
    public :: get_ray_collision_quad
    public :: get_ray_collision_sphere
    public :: get_ray_collision_triangle
    public :: get_render_height
    public :: get_render_width
    public :: get_screen_height
    public :: get_screen_to_world2d
    public :: get_screen_to_world_ray
    public :: get_screen_to_world_ray_ex
    public :: get_screen_width
    public :: get_shader_location
    public :: get_shader_location_attrib
    public :: get_spline_point_basis
    public :: get_spline_point_bezier_cubic
    public :: get_spline_point_bezier_quad
    public :: get_spline_point_catmull_rom
    public :: get_spline_point_linear
    public :: get_time
    public :: get_touch_point_count
    public :: get_touch_point_id
    public :: get_touch_x
    public :: get_touch_y
    public :: get_window_handle
    public :: get_working_directory
    public :: get_world_to_screen2d
    public :: hide_cursor
    public :: image_alpha_clear
    public :: image_alpha_crop
    public :: image_alpha_mask
    public :: image_alpha_premultiply
    public :: image_blur_gaussian
    public :: image_clear_background
    public :: image_color_brightness
    public :: image_color_contrast
    public :: image_color_grayscale
    public :: image_color_invert
    public :: image_color_replace
    public :: image_color_tint
    public :: image_copy
    public :: image_crop
    public :: image_dither
    public :: image_draw
    public :: image_draw_circle
    public :: image_draw_circle_lines
    public :: image_draw_circle_lines_v
    public :: image_draw_circle_v
    public :: image_draw_line
    public :: image_draw_line_ex
    public :: image_draw_line_v
    public :: image_draw_pixel
    public :: image_draw_pixel_v
    public :: image_draw_rectangle
    public :: image_draw_rectangle_lines
    public :: image_draw_rectangle_rec
    public :: image_draw_rectangle_v
    public :: image_draw_text
    public :: image_draw_text_ex
    public :: image_draw_triangle
    public :: image_draw_triangle_ex
    public :: image_draw_triangle_fan
    public :: image_draw_triangle_lines
    public :: image_draw_triangle_strip
    public :: image_flip_horizontal
    public :: image_flip_vertical
    public :: image_format
    public :: image_from_channel
    public :: image_from_image
    public :: image_kernel_convolution
    public :: image_mipmaps
    public :: image_resize
    public :: image_resize_canvas
    public :: image_resize_nn
    public :: image_rotate
    public :: image_rotate_ccw
    public :: image_rotate_cw
    public :: image_text
    public :: image_text_ex
    public :: image_to_pot
    public :: init_audio_device
    public :: init_window
    public :: is_audio_device_ready
    public :: is_audio_stream_playing
    public :: is_audio_stream_processed
    public :: is_audio_stream_ready
    public :: is_cursor_hidden
    public :: is_cursor_on_screen
    public :: is_file_dropped
    public :: is_file_extension
    public :: is_file_name_valid
    public :: is_font_ready
    public :: is_gamepad_available
    public :: is_gamepad_button_down
    public :: is_gamepad_button_pressed
    public :: is_gamepad_button_released
    public :: is_gamepad_button_up
    public :: is_gesture_detected
    public :: is_image_ready
    public :: is_key_down
    public :: is_key_pressed
    public :: is_key_pressed_repeat
    public :: is_key_released
    public :: is_key_up
    public :: is_material_ready
    public :: is_model_animation_valid
    public :: is_model_ready
    public :: is_mouse_button_down
    public :: is_mouse_button_pressed
    public :: is_mouse_button_released
    public :: is_mouse_button_up
    public :: is_music_ready
    public :: is_music_stream_playing
    public :: is_path_file
    public :: is_render_texture_ready
    public :: is_shader_ready
    public :: is_sound_playing
    public :: is_sound_ready
    public :: is_texture_ready
    public :: is_wave_ready
    public :: is_window_focused
    public :: is_window_fullscreen
    public :: is_window_hidden
    public :: is_window_maximized
    public :: is_window_minimized
    public :: is_window_ready
    public :: is_window_resized
    public :: is_window_state
    public :: load_audio_stream
    public :: load_codepoints
    public :: load_directory_files
    public :: load_directory_files_ex
    public :: load_dropped_files
    public :: load_file_data
    public :: load_file_text
    public :: load_font
    public :: load_font_data
    public :: load_font_ex
    public :: load_font_from_image
    public :: load_font_from_memory
    public :: load_image
    public :: load_image_anim
    public :: load_image_anim_from_memory
    public :: load_image_colors
    public :: load_image_from_memory
    public :: load_image_from_screen
    public :: load_image_from_texture
    public :: load_image_palette
    public :: load_image_raw
    public :: load_image_svg
    public :: load_material_default
    public :: load_materials
    public :: load_model
    public :: load_model_animations
    public :: load_model_from_mesh
    public :: load_music_stream
    public :: load_music_stream_from_memory
    public :: load_random_sequence
    public :: load_render_texture
    public :: load_shader
    public :: load_shader_from_memory
    public :: load_sound
    public :: load_sound_alias
    public :: load_sound_from_wave
    public :: load_texture
    public :: load_texture_cubemap
    public :: load_texture_from_image
    public :: load_utf8
    public :: load_vr_stereo_config
    public :: load_wave
    public :: load_wave_from_memory
    public :: load_wave_samples
    public :: make_directory
    public :: maximize_window
    public :: measure_text
    public :: measure_text_ex
    public :: mem_alloc
    public :: mem_free
    public :: mem_realloc
    public :: minimize_window
    public :: open_url
    public :: pause_audio_stream
    public :: pause_music_stream
    public :: pause_sound
    public :: play_audio_stream
    public :: play_music_stream
    public :: play_sound
    public :: poll_input_events
    public :: restore_window
    public :: resume_audio_stream
    public :: resume_music_stream
    public :: resume_sound
    public :: save_file_data
    public :: save_file_text
    public :: seek_music_stream
    public :: set_audio_stream_buffer_size_default
    public :: set_audio_stream_pan
    public :: set_audio_stream_pitch
    public :: set_audio_stream_volume
    public :: set_camera_alt_control
    public :: set_camera_mode
    public :: set_camera_move_controls
    public :: set_camera_pan_control
    public :: set_camera_smooth_zoom_control
    public :: set_clipboard_text
    public :: set_config_flags
    public :: set_exit_key
    public :: set_gamepad_mappings
    public :: set_gestures_enabled
    public :: set_load_file_data_callback
    public :: set_load_file_text_callback
    public :: set_master_volume
    public :: set_material_texture
    public :: set_model_mesh_material
    public :: set_mouse_cursor
    public :: set_mouse_offset
    public :: set_mouse_position
    public :: set_mouse_scale
    public :: set_music_pan
    public :: set_music_pitch
    public :: set_music_volume
    public :: set_pixel_color
    public :: set_random_seed
    public :: set_save_file_data_callback
    public :: set_save_file_text_callback
    public :: set_shader_value
    public :: set_shader_value_matrix
    public :: set_shader_value_texture
    public :: set_shader_value_v
    public :: set_shapes_texture
    public :: set_sound_pan
    public :: set_sound_pitch
    public :: set_sound_volume
    public :: set_target_fps
    public :: set_text_line_spacing
    public :: set_texture_filter
    public :: set_texture_wrap
    public :: set_trace_log_callback
    public :: set_trace_log_level
    public :: set_window_focused
    public :: set_window_icon
    public :: set_window_icons
    public :: set_window_max_size
    public :: set_window_min_size
    public :: set_window_monitor
    public :: set_window_opacity
    public :: set_window_position
    public :: set_window_size
    public :: set_window_state
    public :: set_window_title
    public :: show_cursor
    public :: stop_audio_stream
    public :: stop_music_stream
    public :: stop_sound
    public :: swap_screen_buffer
    public :: take_screenshot
    public :: text_append
    public :: text_copy
    public :: text_find_index
    public :: text_insert
    public :: text_is_equal
    public :: text_join
    public :: text_length
    public :: text_replace
    public :: text_split
    public :: text_subtext
    public :: text_to_camel
    public :: text_to_float
    public :: text_to_integer
    public :: text_to_lower
    public :: text_to_pascal
    public :: text_to_snake
    public :: text_to_upper
    public :: toggle_borderless_windowed
    public :: toggle_fullscreen
    public :: trace_log
    public :: unload_audio_stream
    public :: unload_codepoints
    public :: unload_directory_files
    public :: unload_dropped_files
    public :: unload_file_data
    public :: unload_file_text
    public :: unload_font
    public :: unload_font_data
    public :: unload_image
    public :: unload_image_colors
    public :: unload_image_palette
    public :: unload_material
    public :: unload_mesh
    public :: unload_model
    public :: unload_model_animation
    public :: unload_model_animations
    public :: unload_music_stream
    public :: unload_random_sequence
    public :: unload_render_texture
    public :: unload_shader
    public :: unload_sound
    public :: unload_sound_alias
    public :: unload_texture
    public :: unload_utf8
    public :: unload_vr_stereo_config
    public :: unload_wave
    public :: unload_wave_samples
    public :: update_audio_stream
    public :: update_camera
    public :: update_mesh_buffer
    public :: update_model_animation
    public :: update_music_stream
    public :: update_sound
    public :: update_texture
    public :: update_texture_rec
    public :: upload_mesh
    public :: wait_time
    public :: wave_copy
    public :: wave_crop
    public :: wave_format
    public :: window_should_close

    public :: load_file_data_callback
    public :: save_file_data_callback
    public :: load_file_text_callback
    public :: save_file_text_callback
    public :: trace_log_callback

    public :: deg2rad
    public :: rad2deg

    abstract interface
        ! unsigned char *(*LoadFileDataCallback)(const char *fileName, unsigned int *bytesRead)
        function load_file_data_callback(file_name, bytes_read) bind(c)
            import :: c_ptr, c_unsigned_int
            implicit none
            type(c_ptr),                  intent(in), value :: file_name
            integer(kind=c_unsigned_int), intent(out)       :: bytes_read
            type(c_ptr)                                     :: load_file_data_callback
        end function load_file_data_callback

        ! bool (*SaveFileDataCallback)(const char *fileName, void *data, unsigned int bytesToWrite)
        function save_file_data_callback(file_name, data, bytes_to_write) bind(c)
            import :: c_bool, c_ptr, c_unsigned_int
            implicit none
            type(c_ptr),                  intent(in), value :: file_name
            type(c_ptr),                  intent(in), value :: data
            integer(kind=c_unsigned_int), intent(in), value :: bytes_to_write
            logical(kind=c_bool)                            :: save_file_data_callback
        end function save_file_data_callback

        ! char *(*LoadFileTextCallback)(const char *fileName)
        function load_file_text_callback(file_name) bind(c)
            import :: c_ptr, c_unsigned_int
            implicit none
            type(c_ptr), intent(in), value :: file_name
            type(c_ptr)                    :: load_file_text_callback
        end function load_file_text_callback

        ! bool (*SaveFileTextCallback)(const char *fileName, char *text)
        function save_file_text_callback(file_name, text) bind(c)
            import :: c_bool, c_ptr
            implicit none
            type(c_ptr), intent(in), value :: file_name
            type(c_ptr), intent(in), value :: text
            logical(kind=c_bool)           :: save_file_text_callback
        end function save_file_text_callback

        ! void (*TraceLogCallback)(int logLevel, const char *text, va_list args)
        subroutine trace_log_callback(log_level, text, args) bind(c)
            import :: c_int, c_ptr
            implicit none
            integer(kind=c_int), intent(in), value :: log_level
            type(c_ptr),         intent(in), value :: text
            type(c_ptr),         intent(in)        :: args(*)
        end subroutine trace_log_callback
    end interface

    interface
        ! void AttachAudioMixedProcessor(AudioCallback processor)
        subroutine attach_audio_mixed_processor(processor) bind(c, name='AttachAudioMixedProcessor')
            import :: c_funptr
            implicit none
            type(c_funptr), intent(in), value :: processor
        end subroutine attach_audio_mixed_processor

        ! void AttachAudioStreamProcessor(AudioStream stream, AudioCallback processor)
        subroutine attach_audio_stream_processor(stream, processor) bind(c, name='AttachAudioStreamProcessor')
            import :: audio_stream_type, c_funptr
            implicit none
            type(audio_stream_type), intent(in), value :: stream
            type(c_funptr),          intent(in), value :: processor
        end subroutine attach_audio_stream_processor

        ! void BeginBlendMode(int mode)
        subroutine begin_blend_mode(mode) bind(c, name='BeginBlendMode')
            import :: c_int
            implicit none
            integer(kind=c_int), intent(in), value :: mode
        end subroutine begin_blend_mode

        ! void BeginDrawing(void)
        subroutine begin_drawing() bind(c, name='BeginDrawing')
        end subroutine begin_drawing

        ! void BeginMode2D(Camera2D camera)
        subroutine begin_mode2d(camera) bind(c, name='BeginMode2D')
            import :: camera2d_type
            implicit none
            type(camera2d_type), intent(in), value :: camera
        end subroutine begin_mode2d

        ! void BeginMode3D(Camera3D camera)
        subroutine begin_mode3d(camera) bind(c, name='BeginMode3D')
            import :: camera3d_type
            implicit none
            type(camera3d_type), intent(in), value :: camera
        end subroutine begin_mode3d

        ! void BeginScissorMode(int x, int y, int width, int height)
        subroutine begin_scissor_mode(x, y, width, height) bind(c, name='BeginScissorMode')
            import :: c_int
            implicit none
            integer(kind=c_int), intent(in), value :: x
            integer(kind=c_int), intent(in), value :: y
            integer(kind=c_int), intent(in), value :: width
            integer(kind=c_int), intent(in), value :: height
        end subroutine begin_scissor_mode

        ! void BeginShaderMode(Shader shader)
        subroutine begin_shader_mode(shader) bind(c, name='BeginShaderMode')
            import :: shader_type
            implicit none
            type(shader_type), intent(in), value :: shader
        end subroutine begin_shader_mode

        ! void BeginTextureMode(RenderTexture2D target)
        subroutine begin_texture_mode(target) bind(c, name='BeginTextureMode')
            import :: render_texture2d_type
            implicit none
            type(render_texture2d_type), intent(in), value :: target
        end subroutine begin_texture_mode

        ! void BeginVrStereoMode(VrStereoConfig config)
        subroutine begin_vr_stereo_mode(config) bind(c, name='BeginVrStereoMode')
            import :: vr_stereo_config_type
            implicit none
            type(vr_stereo_config_type), intent(in), value :: config
        end subroutine begin_vr_stereo_mode

        ! bool ChangeDirectory(const char *dir)
        function change_directory(dir) bind(c, name='ChangeDirectory')
            import :: c_bool, c_char
            implicit none
            character(kind=c_char), intent(in) :: dir
            logical(kind=c_bool)               :: change_directory
        end function change_directory

        ! bool CheckCollisionBoxSphere(BoundingBox box, Vector3 center, float radius)
        function check_collision_box_sphere(box, center, radius) bind(c, name='CheckCollisionBoxSphere')
            import :: bounding_box_type, c_bool, c_float, vector3_type
            implicit none
            type(bounding_box_type), intent(in), value :: box
            type(vector3_type),      intent(in), value :: center
            real(kind=c_float),      intent(in), value :: radius
            logical(kind=c_bool)                       :: check_collision_box_sphere
        end function check_collision_box_sphere

        ! bool CheckCollisionBoxes(BoundingBox box1, BoundingBox box2)
        function check_collision_boxes(box1, box2) bind(c, name='CheckCollisionBoxes')
            import :: bounding_box_type, c_bool
            implicit none
            type(bounding_box_type), intent(in), value :: box1
            type(bounding_box_type), intent(in), value :: box2
            logical(kind=c_bool)                       :: check_collision_boxes
        end function check_collision_boxes

        ! bool CheckCollisionCircleLine(Vector2 center, float radius, Vector2 p1, Vector2 p2)
        function check_collision_circle_line(center, radius, p1, p2) bind(c, name='CheckCollisionCircleLine')
            import :: c_bool, c_float, vector2_type
            implicit none
            type(vector2_type), intent(in), value :: center
            real(kind=c_float), intent(in), value :: radius
            type(vector2_type), intent(in), value :: p1
            type(vector2_type), intent(in), value :: p2
            logical(kind=c_bool)                  :: check_collision_circle_line
        end function check_collision_circle_line

        ! bool CheckCollisionCircleRec(Vector2 center, float radius, Rectangle rec)
        function check_collision_circle_rec(center, radius, rec) bind(c, name='CheckCollisionCircleRec')
            import :: c_bool, c_float, rectangle_type, vector2_type
            implicit none
            type(vector2_type),   intent(in), value :: center
            real(kind=c_float),   intent(in), value :: radius
            type(rectangle_type), intent(in), value :: rec
            logical(kind=c_bool)                    :: check_collision_circle_rec
        end function check_collision_circle_rec

        ! bool CheckCollisionCircles(Vector2 center1, float radius1, Vector2 center2, float radius2)
        function check_collision_circles(center1, radius1, center2, radius2) bind(c, name='CheckCollisionCircles')
            import :: c_bool, c_float, vector2_type
            implicit none
            type(vector2_type), intent(in), value :: center1
            real(kind=c_float), intent(in), value :: radius1
            type(vector2_type), intent(in), value :: center2
            real(kind=c_float), intent(in), value :: radius2
            logical(kind=c_bool)                  :: check_collision_circles
        end function check_collision_circles

        ! bool CheckCollisionLines(Vector2 startPos1, Vector2 endPos1, Vector2 startPos2, Vector2 endPos2, Vector2 *collisionPoint)
        function check_collision_lines(start_pos1, end_pos1, start_pos2, end_pos2, collision_point) &
                bind(c, name='CheckCollisionLines')
            import :: c_bool, vector2_type
            implicit none
            type(vector2_type), intent(in), value :: start_pos1
            type(vector2_type), intent(in), value :: end_pos1
            type(vector2_type), intent(in), value :: start_pos2
            type(vector2_type), intent(in), value :: end_pos2
            type(vector2_type), intent(out)       :: collision_point
            logical(kind=c_bool)                  :: check_collision_lines
        end function check_collision_lines

        ! bool CheckCollisionPointCircle(Vector2 point, Vector2 center, float radius)
        function check_collision_point_circle(point, center, radius) bind(c, name='CheckCollisionPointCircle')
            import :: c_bool, c_float, vector2_type
            implicit none
            type(vector2_type), intent(in), value :: point
            type(vector2_type), intent(in), value :: center
            real(kind=c_float), intent(in), value :: radius
            logical(kind=c_bool)                  :: check_collision_point_circle
        end function check_collision_point_circle

        ! bool CheckCollisionPointLine(Vector2 point, Vector2 p1, Vector2 p2, int threshold)
        function check_collision_point_line(point, p1, p2, threshold) bind(c, name='CheckCollisionPointLine')
            import :: c_bool, c_int, vector2_type
            implicit none
            type(vector2_type),  intent(in), value :: point
            type(vector2_type),  intent(in), value :: p1
            type(vector2_type),  intent(in), value :: p2
            integer(kind=c_int), intent(in), value :: threshold
            logical(kind=c_bool)                   :: check_collision_point_line
        end function check_collision_point_line

        ! bool CheckCollisionPointPoly(Vector2 point, Vector2 *points, int pointCount)
        function check_collision_point_poly(point, points, point_count) bind(c, name='CheckCollisionPointPoly')
            import :: c_bool, c_int, vector2_type
            implicit none
            type(vector2_type),  intent(in), value :: point
            type(vector2_type),  intent(in)        :: points(*)
            integer(kind=c_int), intent(in), value :: point_count
            logical(kind=c_bool)                   :: check_collision_point_poly
        end function check_collision_point_poly

        ! bool CheckCollisionPointRec(Vector2 point, Rectangle rec)
        function check_collision_point_rec(point, rec) bind(c, name='CheckCollisionPointRec')
            import :: c_bool, rectangle_type, vector2_type
            implicit none
            type(vector2_type),   intent(in), value :: point
            type(rectangle_type), intent(in), value :: rec
            logical(kind=c_bool)                    :: check_collision_point_rec
        end function check_collision_point_rec

        ! bool CheckCollisionPointTriangle(Vector2 point, Vector2 p1, Vector2 p2, Vector2 p3)
        function check_collision_point_triangle(point, p1, p2, p3) bind(c, name='CheckCollisionPointTriangle')
            import :: c_bool, vector2_type
            implicit none
            type(vector2_type), intent(in), value :: point
            type(vector2_type), intent(in), value :: p1
            type(vector2_type), intent(in), value :: p2
            type(vector2_type), intent(in), value :: p3
            logical(kind=c_bool)                  :: check_collision_point_triangle
        end function check_collision_point_triangle

        ! bool CheckCollisionRecs(Rectangle rec1, Rectangle rec2)
        function check_collision_recs(rec1, rec2) bind(c, name='CheckCollisionRecs')
            import :: c_bool, rectangle_type
            implicit none
            type(rectangle_type), intent(in), value :: rec1
            type(rectangle_type), intent(in), value :: rec2
            logical(kind=c_bool)                    :: check_collision_recs
        end function check_collision_recs

        ! bool CheckCollisionSpheres(Vector3 center1, float radius1, Vector3 center2, float radius2)
        function check_collision_spheres(center1, radius1, center2, radius2) bind(c, name='CheckCollisionSpheres')
            import :: c_bool, c_float, vector3_type
            implicit none
            type(vector3_type), intent(in), value :: center1
            real(kind=c_float), intent(in), value :: radius1
            type(vector3_type), intent(in), value :: center2
            real(kind=c_float), intent(in), value :: radius2
            logical(kind=c_bool)                  :: check_collision_spheres
        end function check_collision_spheres

        ! void ClearBackground(Color color)
        subroutine clear_background(color) bind(c, name='ClearBackground')
            import :: color_type
            implicit none
            type(color_type), intent(in), value :: color
        end subroutine clear_background

        ! void ClearWindowState(unsigned int flags)
        subroutine clear_window_state(flags) bind(c, name='ClearWindowState')
            import :: c_unsigned_int
            implicit none
            integer(kind=c_unsigned_int), intent(in), value :: flags
        end subroutine clear_window_state

        ! void CloseAudioDevice(void)
        subroutine close_audio_device() bind(c, name='CloseAudioDevice')
        end subroutine close_audio_device

        ! void CloseWindow(void)
        subroutine close_window() bind(c, name='CloseWindow')
        end subroutine close_window

        ! const char *CodepointToUTF8(int codepoint, int *utf8Size)
        function codepoint_to_utf8(codepoint, utf8_size) bind(c, name='CodepointToUTF8')
            import :: c_int, c_ptr
            implicit none
            integer(kind=c_int), intent(in), value :: codepoint
            integer(kind=c_int), intent(out)       :: utf8_size
            type(c_ptr)                            :: codepoint_to_utf8
        end function codepoint_to_utf8

        ! Color ColorAlpha(Color color, float alpha)
        function color_alpha(color, alpha) bind(c, name='ColorAlpha')
            import :: c_float, color_type
            implicit none
            type(color_type),   intent(in), value :: color
            real(kind=c_float), intent(in), value :: alpha
            type(color_type)                      :: color_alpha
        end function color_alpha

        ! Color ColorAlphaBlend(Color dst, Color src, Color tint)
        function color_alpha_blend(dst, src, tint) bind(c, name='ColorAlphaBlend')
            import :: color_type
            implicit none
            type(color_type), intent(in), value :: dst
            type(color_type), intent(in), value :: src
            type(color_type), intent(in), value :: tint
            type(color_type)                    :: color_alpha_blend
        end function color_alpha_blend

        ! Color ColorBrightness(Color color, float factor)
        function color_brightness(color, factor) bind(c, name='ColorBrightness')
            import :: c_float, color_type
            implicit none
            type(color_type),   intent(in), value :: color
            real(kind=c_float), intent(in), value :: factor
            type(color_type)                      :: color_brightness
        end function color_brightness

        ! Color ColorContrast(Color color, float contrast)
        function color_contrast(color, contrast) bind(c, name='ColorContrast')
            import :: c_float, color_type
            implicit none
            type(color_type),   intent(in), value :: color
            real(kind=c_float), intent(in), value :: contrast
            type(color_type)                      :: color_contrast
        end function color_contrast

        ! Color ColorFromHSV(float hue, float saturation, float value)
        function color_from_hsv(hue, saturation, value) bind(c, name='ColorFromHSV')
            import :: c_float, color_type
            implicit none
            real(kind=c_float), intent(in), value :: hue
            real(kind=c_float), intent(in), value :: saturation
            real(kind=c_float), intent(in), value :: value
            type(color_type)                      :: color_from_hsv
        end function color_from_hsv

        ! Color ColorFromNormalized(Vector4 normalized)
        function color_from_normalized(normalized) bind(c, name='ColorFromNormalized')
            import :: color_type, vector4_type
            implicit none
            type(vector4_type), intent(in), value :: normalized
            type(color_type)                      :: color_from_normalized
        end function color_from_normalized

        ! bool ColorIsEqual(Color col1, Color col2)
        function color_is_equal(color1, color2) bind(c, name='ColorIsEqual')
            import :: c_bool, color_type
            implicit none
            type(color_type), intent(in), value :: color1
            type(color_type), intent(in), value :: color2
            logical(kind=c_bool)                :: color_is_equal
        end function color_is_equal

        ! Color ColorLerp(Color color1, Color color2, float factor)
        function color_lerp(color1, color2, factor) bind(c, name='ColorLerp')
            import :: c_float, color_type
            implicit none
            type(color_type),   intent(in), value :: color1
            type(color_type),   intent(in), value :: color2
            real(kind=c_float), intent(in), value :: factor
            type(color_type)                      :: color_lerp
        end function color_lerp

        ! Color ColorTint(Color color, Color tint)
        function color_tint(color, tint) bind(c, name='ColorTint')
            import :: color_type
            implicit none
            type(color_type), intent(in), value :: color
            type(color_type), intent(in), value :: tint
            type(color_type)                    :: color_tint
        end function color_tint

        ! int ColorToInt(Color color)
        function color_to_int(color) bind(c, name='ColorToInt')
            import :: c_int, color_type
            implicit none
            type(color_type), intent(in), value :: color
            integer(kind=c_int)                 :: color_to_int
        end function color_to_int

        ! unsigned char *CompressData(const unsigned char *data, int dataSize, int *compDataSize)
        function compress_data(data, data_size, comp_data_size) bind(c, name='CompressData')
            import :: c_int, c_ptr, c_unsigned_char
            implicit none
            integer(kind=c_unsigned_char), intent(in)        :: data
            integer(kind=c_int),           intent(in), value :: data_size
            integer(kind=c_int),           intent(out)       :: comp_data_size
            type(c_ptr)                                      :: compress_data
        end function compress_data

        ! unsigned int ComputeCRC32(unsigned char *data, int dataSize)
        function compute_crc32(data, data_size) bind(c, name='ComputeCRC32')
            import :: c_char, c_int, c_unsigned_int
            implicit none
            character(kind=c_char), intent(in)        :: data
            integer(kind=c_int),    intent(in), value :: data_size
            integer(kind=c_unsigned_int)              :: compute_crc32
        end function compute_crc32

        ! unsigned int *ComputeMD5(unsigned char *data, int dataSize)
        function compute_md5(data, data_size) bind(c, name='ComputeMD5')
            import :: c_char, c_int, c_ptr
            implicit none
            character(kind=c_char), intent(in)        :: data
            integer(kind=c_int),    intent(in), value :: data_size
            type(c_ptr)                               :: compute_md5
        end function compute_md5

        ! unsigned int *ComputeSHA1(unsigned char *data, int dataSize)
        function compute_sha1(data, data_size) bind(c, name='ComputeSHA1')
            import :: c_char, c_int, c_ptr
            implicit none
            character(kind=c_char), intent(in)        :: data
            integer(kind=c_int),    intent(in), value :: data_size
            type(c_ptr)                               :: compute_sha1
        end function compute_sha1

        ! unsigned char *DecodeDataBase64(const unsigned char *data, int *outputSize)
        function decode_data_base64(data, output_size) bind(c, name='DecodeDataBase64')
            import :: c_int, c_unsigned_char, c_ptr
            implicit none
            integer(kind=c_unsigned_char), intent(in)  :: data
            integer(kind=c_int),           intent(out) :: output_size
            type(c_ptr)                                :: decode_data_base64
        end function decode_data_base64

        ! unsigned char *DecompressData(const unsigned char *compData, int compDataSize, int *dataSize)
        function decompress_data(comp_data, comp_data_size, data_size) bind(c, name='DecompressData')
            import :: c_int, c_ptr, c_unsigned_char
            implicit none
            integer(kind=c_unsigned_char), intent(in)        :: comp_data
            integer(kind=c_int),           intent(in), value :: comp_data_size
            integer(kind=c_int),           intent(out)       :: data_size
            type(c_ptr)                                      :: decompress_data
        end function decompress_data

        ! void DetachAudioMixedProcessor(AudioCallback processor)
        subroutine detach_audio_mixed_processor(processor) bind(c, name='DetachAudioMixedProcessor')
            import :: c_funptr
            implicit none
            type(c_funptr), intent(in), value :: processor
        end subroutine detach_audio_mixed_processor

        ! void DetachAudioStreamProcessor(AudioStream stream, AudioCallback processor)
        subroutine detach_audio_stream_processor(stream, processor) bind(c, name='DetachAudioStreamProcessor')
            import :: audio_stream_type, c_funptr
            implicit none
            type(audio_stream_type), intent(in), value :: stream
            type(c_funptr),          intent(in), value :: processor
        end subroutine detach_audio_stream_processor

        ! bool DirectoryExists(const char *dirPath)
        function directory_exists(dir_path) bind(c, name='DirectoryExists')
            import :: c_bool, c_char
            implicit none
            character(kind=c_char), intent(in) :: dir_path
            logical(kind=c_bool)               :: directory_exists
        end function directory_exists

        ! void DisableCursor(void)
        subroutine disable_cursor() bind(c, name='DisableCursor')
        end subroutine disable_cursor

        ! void DisableEventWaiting(void)
        subroutine disable_event_waiting() bind(c, name='DisableEventWaiting')
        end subroutine disable_event_waiting

        ! void DrawBillboard(Camera camera, Texture2D texture, Vector3 position, float size, Color tint)
        subroutine draw_billboard(camera, texture, position, size, tint) bind(c, name='DrawBillboard')
            import :: c_float, camera3d_type, color_type, texture2d_type, vector3_type
            implicit none
            type(camera3d_type),  intent(in), value :: camera
            type(texture2d_type), intent(in), value :: texture
            type(vector3_type),   intent(in), value :: position
            real(kind=c_float),   intent(in), value :: size
            type(color_type),     intent(in), value :: tint
        end subroutine draw_billboard

        ! void DrawBillboardPro(Camera camera, Texture2D texture, Rectangle source, Vector3 position, Vector3 up, Vector2 size, Vector2 origin, float rotation, Color tint)
        subroutine draw_billboard_pro(camera, texture, source, position, up, size, origin, rotation, tint) &
                bind(c, name='DrawBillboardPro')
            import :: c_float, camera3d_type, color_type, rectangle_type, texture2d_type, vector2_type, vector3_type
            implicit none
            type(camera3d_type),  intent(in), value :: camera
            type(texture2d_type), intent(in), value :: texture
            type(rectangle_type), intent(in), value :: source
            type(vector3_type),   intent(in), value :: position
            type(vector3_type),   intent(in), value :: up
            type(vector2_type),   intent(in), value :: size
            type(vector2_type),   intent(in), value :: origin
            real(kind=c_float),   intent(in), value :: rotation
            type(color_type),     intent(in), value :: tint
        end subroutine draw_billboard_pro

        ! void DrawBillboardRec(Camera camera, Texture2D texture, Rectangle source, Vector3 position, Vector2 size, Color tint)
        subroutine draw_billboard_rec(camera, texture, source, position, size, tint) bind(c, name='DrawBillboardRec')
            import :: camera3d_type, color_type, rectangle_type, texture2d_type, vector2_type, vector3_type
            implicit none
            type(camera3d_type),  intent(in), value :: camera
            type(texture2d_type), intent(in), value :: texture
            type(rectangle_type), intent(in), value :: source
            type(vector3_type),   intent(in), value :: position
            type(vector2_type),   intent(in), value :: size
            type(color_type),     intent(in), value :: tint
        end subroutine draw_billboard_rec

        ! void DrawBoundingBox(BoundingBox box, Color color)
        subroutine draw_bounding_box(box, color) bind(c, name='DrawBoundingBox')
            import :: bounding_box_type, color_type
            implicit none
            type(bounding_box_type), intent(in), value :: box
            type(color_type),        intent(in), value :: color
        end subroutine draw_bounding_box

        ! void DrawCapsule(Vector3 startPos, Vector3 endPos, float radius, int slices, int rings, Color color)
        subroutine draw_capsule(start_pos, end_pos, radius, slices, rings, color) bind(c, name='DrawCapsule')
            import :: c_float, c_int, color_type, vector3_type
            implicit none
            type(vector3_type),  intent(in), value :: start_pos
            type(vector3_type),  intent(in), value :: end_pos
            real(kind=c_float),  intent(in), value :: radius
            integer(kind=c_int), intent(in), value :: slices
            integer(kind=c_int), intent(in), value :: rings
            type(color_type),    intent(in), value :: color
        end subroutine draw_capsule

        ! void DrawCapsuleWires(Vector3 startPos, Vector3 endPos, float radius, int slices, int rings, Color color)
        subroutine draw_capsule_wires(start_pos, end_pos, radius, slices, rings, color) bind(c, name='DrawCapsuleWires')
            import :: c_float, c_int, color_type, vector3_type
            implicit none
            type(vector3_type),  intent(in), value :: start_pos
            type(vector3_type),  intent(in), value :: end_pos
            real(kind=c_float),  intent(in), value :: radius
            integer(kind=c_int), intent(in), value :: slices
            integer(kind=c_int), intent(in), value :: rings
            type(color_type),    intent(in), value :: color
        end subroutine draw_capsule_wires

        ! void DrawCircle(int centerX, int centerY, float radius, Color color)
        subroutine draw_circle(center_x, center_y, radius, color) bind(c, name='DrawCircle')
            import :: c_float, c_int, color_type
            implicit none
            integer(kind=c_int), intent(in), value :: center_x
            integer(kind=c_int), intent(in), value :: center_y
            real(kind=c_float),  intent(in), value :: radius
            type(color_type),    intent(in), value :: color
        end subroutine draw_circle

        ! void DrawCircle3D(Vector3 center, float radius, Vector3 rotationAxis, float rotationAngle, Color color)
        subroutine draw_circle3d(center, radius, rotation_axis, rotation_angle, color) bind(c, name='DrawCircle3D')
            import :: c_float, color_type, vector3_type
            implicit none
            type(vector3_type), intent(in), value :: center
            real(kind=c_float), intent(in), value :: radius
            type(vector3_type), intent(in), value :: rotation_axis
            real(kind=c_float), intent(in), value :: rotation_angle
            type(color_type),   intent(in), value :: color
        end subroutine draw_circle3d

        ! void DrawCircleGradient(int centerX, int centerY, float radius, Color color1, Color color2)
        subroutine draw_circle_gradient(center_x, center_y, radius, color1, color2) bind(c, name='DrawCircleGradient')
            import :: c_float, c_int, color_type
            implicit none
            integer(kind=c_int), intent(in), value :: center_x
            integer(kind=c_int), intent(in), value :: center_y
            real(kind=c_float),  intent(in), value :: radius
            type(color_type),    intent(in), value :: color1
            type(color_type),    intent(in), value :: color2
        end subroutine draw_circle_gradient

        ! void DrawCircleLines(int centerX, int centerY, float radius, Color color)
        subroutine draw_circle_lines(center_x, center_y, radius, color) bind(c, name='DrawCircleLines')
            import :: c_float, c_int, color_type
            implicit none
            integer(kind=c_int), intent(in), value :: center_x
            integer(kind=c_int), intent(in), value :: center_y
            real(kind=c_float),  intent(in), value :: radius
            type(color_type),    intent(in), value :: color
        end subroutine draw_circle_lines

        ! void DrawCircleLinesV(Vector2 center, float radius, Color color)
        subroutine draw_circle_lines_v(center, radius, color) bind(c, name='DrawCircleLinesV')
            import :: c_float, color_type, vector2_type
            implicit none
            type(vector2_type), intent(in), value :: center
            real(kind=c_float), intent(in), value :: radius
            type(color_type),   intent(in), value :: color
        end subroutine draw_circle_lines_v

        ! void DrawCircleSector(Vector2 center, float radius, float startAngle, float endAngle, int segments, Color color)
        subroutine draw_circle_sector(center, radius, start_angle, end_angle, segments, color) &
                bind(c, name='DrawCircleSector')
            import :: c_float, c_int, color_type, vector2_type
            implicit none
            type(vector2_type),  intent(in), value :: center
            real(kind=c_float),  intent(in), value :: radius
            real(kind=c_float) , intent(in), value :: start_angle
            real(kind=c_float),  intent(in), value :: end_angle
            integer(kind=c_int), intent(in), value :: segments
            type(color_type),    intent(in), value :: color
        end subroutine draw_circle_sector

        ! void DrawCircleSectorLines(Vector2 center, float radius, float startAngle, float endAngle, int segments, Color color)
        subroutine draw_circle_sector_lines(center, radius, start_angle, end_angle, segments, color) &
                bind(c, name='DrawCircleSectorLines')
            import :: c_float, c_int, color_type, vector2_type
            implicit none
            type(vector2_type),  intent(in), value :: center
            real(kind=c_float),  intent(in), value :: radius
            real(kind=c_float),  intent(in), value :: start_angle
            real(kind=c_float),  intent(in), value :: end_angle
            integer(kind=c_int), intent(in), value :: segments
            type(color_type),    intent(in), value :: color
        end subroutine draw_circle_sector_lines

        ! void DrawCircleV(Vector2 center, float radius, Color color)
        subroutine draw_circle_v(center, radius, color) bind(c, name='DrawCircleV')
            import :: c_float, color_type, vector2_type
            implicit none
            type(vector2_type), intent(in), value :: center
            real(kind=c_float), intent(in), value :: radius
            type(color_type),   intent(in), value :: color
        end subroutine draw_circle_v

        ! void DrawCube(Vector3 position, float width, float height, float length, Color color)
        subroutine draw_cube(position, width, height, length, color) bind(c, name='DrawCube')
            import :: c_float, color_type, vector3_type
            implicit none
            type(vector3_type), intent(in), value :: position
            real(kind=c_float), intent(in), value :: width
            real(kind=c_float), intent(in), value :: height
            real(kind=c_float), intent(in), value :: length
            type(color_type),   intent(in), value :: color
        end subroutine draw_cube

        ! void DrawCubeV(Vector3 position, Vector3 size, Color color)
        subroutine draw_cube_v(position, size, color) bind(c, name='DrawCubeV')
            import :: color_type, vector3_type
            implicit none
            type(vector3_type), intent(in), value :: position
            type(vector3_type), intent(in), value :: size
            type(color_type),   intent(in), value :: color
        end subroutine draw_cube_v

        ! void DrawCubeWires(Vector3 position, float width, float height, float length, Color color)
        subroutine draw_cube_wires(position, width, height, length, color) bind(c, name='DrawCubeWires')
            import :: c_float, color_type, vector3_type
            implicit none
            type(vector3_type), intent(in), value :: position
            real(kind=c_float), intent(in), value :: width
            real(kind=c_float), intent(in), value :: height
            real(kind=c_float), intent(in), value :: length
            type(color_type),   intent(in), value :: color
        end subroutine draw_cube_wires

        ! void DrawCubeWiresV(Vector3 position, Vector3 size, Color color)
        subroutine draw_cube_wires_v(position, size, color) bind(c, name='DrawCubeWiresV')
            import :: color_type, vector3_type
            implicit none
            type(vector3_type), intent(in), value :: position
            type(vector3_type), intent(in), value :: size
            type(color_type),   intent(in), value :: color
        end subroutine draw_cube_wires_v

        ! void DrawCylinder(Vector3 position, float radiusTop, float radiusBottom, float height, int slices, Color color)
        subroutine draw_cylinder(position, radius_top, radius_bottom, height, slices, color) bind(c, name='DrawCylinder')
            import :: c_float, c_int, color_type, vector3_type
            implicit none
            type(vector3_type),  intent(in), value :: position
            real(kind=c_float),  intent(in), value :: radius_top
            real(kind=c_float),  intent(in), value :: radius_bottom
            real(kind=c_float),  intent(in), value :: height
            integer(kind=c_int), intent(in), value :: slices
            type(color_type),    intent(in), value :: color
        end subroutine draw_cylinder

        ! void DrawCylinderEx(Vector3 startPos, Vector3 endPos, float startRadius, float endRadius, int sides, Color color)
        subroutine draw_cylinder_ex(start_pos, end_pos, start_radius, end_radius, sides, color) bind(c, name='DrawCylinderEx')
            import :: c_float, c_int, color_type, vector3_type
            implicit none
            type(vector3_type),  intent(in), value :: start_pos
            type(vector3_type),  intent(in), value :: end_pos
            real(kind=c_float),  intent(in), value :: start_radius
            real(kind=c_float),  intent(in), value :: end_radius
            integer(kind=c_int), intent(in), value :: sides
            type(color_type),    intent(in), value :: color
        end subroutine draw_cylinder_ex

        ! void DrawCylinderWires(Vector3 position, float radiusTop, float radiusBottom, float height, int slices, Color color)
        subroutine draw_cylinder_wires(position, radius_top, radius_bottom, height, slices, color) &
                bind(c, name='DrawCylinderWires')
            import :: c_float, c_int, color_type, vector3_type
            implicit none
            type(vector3_type),  intent(in), value :: position
            real(kind=c_float),  intent(in), value :: radius_top
            real(kind=c_float),  intent(in), value :: radius_bottom
            real(kind=c_float),  intent(in), value :: height
            integer(kind=c_int), intent(in), value :: slices
            type(color_type),    intent(in), value :: color
        end subroutine draw_cylinder_wires

        ! void DrawCylinderWiresEx(Vector3 startPos, Vector3 endPos, float startRadius, float endRadius, int sides, Color color)
        subroutine draw_cylinder_wires_ex(start_pos, end_pos, start_radius, end_radius, sides, color) &
                bind(c, name='DrawCylinderWiresEx')
            import :: c_float, c_int, color_type, vector3_type
            implicit none
            type(vector3_type),  intent(in), value :: start_pos
            type(vector3_type),  intent(in), value :: end_pos
            real(kind=c_float),  intent(in), value :: start_radius
            real(kind=c_float),  intent(in), value :: end_radius
            integer(kind=c_int), intent(in), value :: sides
            type(color_type),    intent(in), value :: color
        end subroutine draw_cylinder_wires_ex

        ! void DrawEllipse(int centerX, int centerY, float radiusH, float radiusV, Color color)
        subroutine draw_ellipse(center_x, center_y, radius_h, radius_v, color) bind(c, name='DrawEllipse')
            import :: c_float, c_int, color_type
            implicit none
            integer(kind=c_int), intent(in), value :: center_x
            integer(kind=c_int), intent(in), value :: center_y
            real(kind=c_float),  intent(in), value :: radius_h
            real(kind=c_float),  intent(in), value :: radius_v
            type(color_type),    intent(in), value :: color
        end subroutine draw_ellipse

        ! void DrawEllipseLines(int centerX, int centerY, float radiusH, float radiusV, Color color)
        subroutine draw_ellipse_lines(center_x, center_y, radius_h, radius_v, color) bind(c, name='DrawEllipseLines')
            import :: c_float, c_int, color_type
            implicit none
            integer(kind=c_int), intent(in), value :: center_x
            integer(kind=c_int), intent(in), value :: center_y
            real(kind=c_float),  intent(in), value :: radius_h
            real(kind=c_float),  intent(in), value :: radius_v
            type(color_type),    intent(in), value :: color
        end subroutine draw_ellipse_lines

        ! void DrawFPS(int posX, int posY)
        subroutine draw_fps(pos_x, pos_y) bind(c, name='DrawFPS')
            import :: c_int
            implicit none
            integer(kind=c_int), intent(in), value :: pos_x
            integer(kind=c_int), intent(in), value :: pos_y
        end subroutine draw_fps

        ! void DrawGrid(int slices, float spacing)
        subroutine draw_grid(slices, spacing) bind(c, name='DrawGrid')
            import :: c_float, c_int
            implicit none
            integer(kind=c_int), intent(in), value :: slices
            real(kind=c_float),  intent(in), value :: spacing
        end subroutine draw_grid

        ! void DrawLine(int startPosX, int startPosY, int endPosX, int endPosY, Color color)
        subroutine draw_line(start_pos_x, start_pos_y, end_pos_x, end_pos_y, color) bind(c, name='DrawLine')
            import :: c_int, color_type
            implicit none
            integer(kind=c_int), intent(in), value :: start_pos_x
            integer(kind=c_int), intent(in), value :: start_pos_y
            integer(kind=c_int), intent(in), value :: end_pos_x
            integer(kind=c_int), intent(in), value :: end_pos_y
            type(color_type),    intent(in), value :: color
        end subroutine draw_line

        ! void DrawLine3D(Vector3 startPos, Vector3 endPos, Color color)
        subroutine draw_line3d(start_pos, end_pos, color) bind(c, name='DrawLine3D')
            import :: color_type, vector3_type
            implicit none
            type(vector3_type), intent(in), value :: start_pos
            type(vector3_type), intent(in), value :: end_pos
            type(color_type),   intent(in), value :: color
        end subroutine draw_line3d

        ! void DrawLineBezier(Vector2 startPos, Vector2 endPos, float thick, Color color)
        subroutine draw_line_bezier(start_pos, end_pos, thick, color) bind(c, name='DrawLineBezier')
            import :: c_float, color_type, vector2_type
            implicit none
            type(vector2_type), intent(in), value :: start_pos
            type(vector2_type), intent(in), value :: end_pos
            real(kind=c_float), intent(in), value :: thick
            type(color_type),   intent(in), value :: color
        end subroutine draw_line_bezier

        ! void DrawLineEx(Vector2 startPos, Vector2 endPos, float thick, Color color)
        subroutine draw_line_ex(start_pos, end_pos, thick, color) bind(c, name='DrawLineEx')
            import :: c_float, color_type, vector2_type
            implicit none
            type(vector2_type), intent(in), value :: start_pos
            type(vector2_type), intent(in), value :: end_pos
            real(kind=c_float), intent(in), value :: thick
            type(color_type),   intent(in), value :: color
        end subroutine draw_line_ex

        ! void DrawLineStrip(Vector2 *points, int pointCount, Color color)
        subroutine draw_line_strip(points, point_count, color) bind(c, name='DrawLineStrip')
            import :: c_int, color_type, vector2_type
            implicit none
            type(vector2_type),  intent(in)        :: points(*)
            integer(kind=c_int), intent(in), value :: point_count
            type(color_type),    intent(in), value :: color
        end subroutine draw_line_strip

        ! void DrawLineV(Vector2 startPos, Vector2 endPos, Color color)
        subroutine draw_line_v(start_pos, end_pos, color) bind(c, name='DrawLineV')
            import :: color_type, vector2_type
            implicit none
            type(vector2_type), intent(in), value :: start_pos
            type(vector2_type), intent(in), value :: end_pos
            type(color_type),   intent(in), value :: color
        end subroutine draw_line_v

        ! void DrawMesh(Mesh mesh, Material material, Matrix transform)
        subroutine draw_mesh(mesh, material, transform) bind(c, name='DrawMesh')
            import :: material_type, matrix_type, mesh_type
            implicit none
            type(mesh_type),     intent(in), value :: mesh
            type(material_type), intent(in), value :: material
            type(matrix_type),   intent(in), value :: transform
        end subroutine draw_mesh

        ! void DrawMeshInstanced(Mesh mesh, Material material, const Matrix *transforms, int instances)
        subroutine draw_mesh_instanced(mesh, material, transforms, instances) bind(c, name='DrawMeshInstanced')
            import :: c_int, material_type, matrix_type, mesh_type
            implicit none
            type(mesh_type),     intent(in), value :: mesh
            type(material_type), intent(in), value :: material
            type(matrix_type),   intent(inout)     :: transforms
            integer(kind=c_int), intent(in), value :: instances
        end subroutine draw_mesh_instanced

        ! void DrawModel(Model model, Vector3 position, float scale, Color tint)
        subroutine draw_model(model, position, scale, tint) bind(c, name='DrawModel')
            import :: c_float, color_type, model_type, vector3_type
            implicit none
            type(model_type),   intent(in), value :: model
            type(vector3_type), intent(in), value :: position
            real(kind=c_float), intent(in), value :: scale
            type(color_type),   intent(in), value :: tint
        end subroutine draw_model

        ! void DrawModelEx(Model model, Vector3 position, Vector3 rotationAxis, float rotationAngle, Vector3 scale, Color tint)
        subroutine draw_model_ex(model, position, rotation_axis, rotation_angle, scale, tint) &
                bind(c, name='DrawModelEx')
            import :: c_float, color_type, model_type, vector3_type
            implicit none
            type(model_type),   intent(in), value :: model
            type(vector3_type), intent(in), value :: position
            type(vector3_type), intent(in), value :: rotation_axis
            real(kind=c_float), intent(in), value :: rotation_angle
            type(vector3_type), intent(in), value :: scale
            type(color_type),   intent(in), value :: tint
        end subroutine draw_model_ex

        ! void DrawModelPoints(Model model, Vector3 position, float scale, Color tint)
        subroutine draw_model_points(model, position, scale, tint) bind(c, name='DrawModelPoints')
            import :: c_float, color_type, model_type, vector3_type
            implicit none
            type(model_type),   intent(in), value :: model
            type(vector3_type), intent(in), value :: position
            real(kind=c_float), intent(in), value :: scale
            type(color_type),   intent(in), value :: tint
        end subroutine draw_model_points

        ! void DrawModelPointsEx(Model model, Vector3 position, Vector3 rotationAxis, float rotationAngle, Vector3 scale, Color tint)
        subroutine draw_model_points_ex(model, position, rotation_axis, rotation_angle, scale, tint) &
                bind(c, name='DrawModelPointsEx')
            import :: c_float, color_type, model_type, vector3_type
            implicit none
            type(model_type),   intent(in), value :: model
            type(vector3_type), intent(in), value :: position
            type(vector3_type), intent(in), value :: rotation_axis
            real(kind=c_float), intent(in), value :: rotation_angle
            type(vector3_type), intent(in), value :: scale
            type(color_type),   intent(in), value :: tint
        end subroutine draw_model_points_ex

        ! void DrawModelWires(Model model, Vector3 position, float scale, Color tint)
        subroutine draw_model_wires(model, position, scale, tint) bind(c, name='DrawModelWires')
            import :: c_float, color_type, model_type, vector3_type
            implicit none
            type(model_type),   intent(in), value :: model
            type(vector3_type), intent(in), value :: position
            real(kind=c_float), intent(in), value :: scale
            type(color_type),   intent(in), value :: tint
        end subroutine draw_model_wires

        ! void DrawModelWiresEx(Model model, Vector3 position, Vector3 rotationAxis, float rotationAngle, Vector3 scale, Color tint)
        subroutine draw_model_wires_ex(model, position, rotation_axis, rotation_angle, scale, tint) &
                bind(c, name='DrawModelWiresEx')
            import :: c_float, color_type, model_type, vector3_type
            implicit none
            type(model_type),   intent(in), value :: model
            type(vector3_type), intent(in), value :: position
            type(vector3_type), intent(in), value :: rotation_axis
            real(kind=c_float), intent(in), value :: rotation_angle
            type(vector3_type), intent(in), value :: scale
            type(color_type),   intent(in), value :: tint
        end subroutine draw_model_wires_ex

        ! void DrawPixel(int posX, int posY, Color color)
        subroutine draw_pixel(pos_x, pos_y, color) bind(c, name='DrawPixel')
            import :: c_int, color_type
            implicit none
            integer(kind=c_int), intent(in), value :: pos_x
            integer(kind=c_int), intent(in), value :: pos_y
            type(color_type),    intent(in), value :: color
        end subroutine draw_pixel

        ! void DrawPixelV(Vector2 position, Color color)
        subroutine draw_pixel_v(position, color) bind(c, name='DrawPixelV')
            import :: color_type, vector2_type
            implicit none
            type(vector2_type), intent(in), value :: position
            type(color_type),   intent(in), value :: color
        end subroutine draw_pixel_v

        ! void DrawPlane(Vector3 centerPos, Vector2 size, Color color)
        subroutine draw_plane(center_pos, size, color) bind(c, name='DrawPlane')
            import :: color_type, vector2_type, vector3_type
            implicit none
            type(vector3_type), intent(in), value :: center_pos
            type(vector2_type), intent(in), value :: size
            type(color_type),   intent(in), value :: color
        end subroutine draw_plane

        ! void DrawPoint3D(Vector3 position, Color color)
        subroutine draw_point3d(position, color) bind(c, name='DrawPoint3D')
            import :: color_type, vector3_type
            implicit none
            type(vector3_type), intent(in), value :: position
            type(color_type),   intent(in), value :: color
        end subroutine draw_point3d

        ! void DrawPoly(Vector2 center, int sides, float radius, float rotation, Color color)
        subroutine draw_poly(center, sides, radius, rotation, color) bind(c, name='DrawPoly')
            import :: c_float, c_int, color_type, vector2_type
            implicit none
            type(vector2_type),  intent(in), value :: center
            integer(kind=c_int), intent(in), value :: sides
            real(kind=c_float),  intent(in), value :: radius
            real(kind=c_float),  intent(in), value :: rotation
            type(color_type),    intent(in), value :: color
        end subroutine draw_poly

        ! void DrawPolyLines(Vector2 center, int sides, float radius, float rotation, Color color)
        subroutine draw_poly_lines(center, sides, radius, rotation, color) bind(c, name='DrawPolyLines')
            import :: c_float, c_int, color_type, vector2_type
            implicit none
            type(vector2_type),  intent(in), value :: center
            integer(kind=c_int), intent(in), value :: sides
            real(kind=c_float),  intent(in), value :: radius
            real(kind=c_float),  intent(in), value :: rotation
            type(color_type),    intent(in), value :: color
        end subroutine draw_poly_lines

        ! void DrawPolyLinesEx(Vector2 center, int sides, float radius, float rotation, float lineThick, Color color)
        subroutine draw_poly_lines_ex(center, sides, radius, rotation, line_thick, color) &
                bind(c, name='DrawPolyLinesEx')
            import :: c_float, c_int, color_type, vector2_type
            implicit none
            type(vector2_type),  intent(in), value :: center
            integer(kind=c_int), intent(in), value :: sides
            real(kind=c_float),  intent(in), value :: radius
            real(kind=c_float),  intent(in), value :: rotation
            real(kind=c_float),  intent(in), value :: line_thick
            type(color_type),    intent(in), value :: color
        end subroutine draw_poly_lines_ex

        ! void DrawRay(Ray ray, Color color)
        subroutine draw_ray(ray, color) bind(c, name='DrawRay')
            import :: color_type, ray_type
            implicit none
            type(ray_type),   intent(in), value :: ray
            type(color_type), intent(in), value :: color
        end subroutine draw_ray

        ! void DrawRectangle(int posX, int posY, int width, int height, Color color)
        subroutine draw_rectangle(pos_x, pos_y, width, height, color) bind(c, name='DrawRectangle')
            import :: c_int, color_type
            implicit none
            integer(kind=c_int), intent(in), value :: pos_x
            integer(kind=c_int), intent(in), value :: pos_y
            integer(kind=c_int), intent(in), value :: width
            integer(kind=c_int), intent(in), value :: height
            type(color_type),    intent(in), value :: color
        end subroutine draw_rectangle

        ! void DrawRectangleGradientEx(Rectangle rec, Color col1, Color col2, Color col3, Color col4)
        subroutine draw_rectangle_gradient_ex(rec, col1, col2, col3, col4) bind(c, name='DrawRectangleGradientEx')
            import :: color_type, rectangle_type
            implicit none
            type(rectangle_type), intent(in), value :: rec
            type(color_type),     intent(in), value :: col1
            type(color_type),     intent(in), value :: col2
            type(color_type),     intent(in), value :: col3
            type(color_type),     intent(in), value :: col4
        end subroutine draw_rectangle_gradient_ex

        ! void DrawRectangleGradientH(int posX, int posY, int width, int height, Color color1, Color color2)
        subroutine draw_rectangle_gradient_h(pos_x, pos_y, width, height, color1, color2) &
                bind(c, name='DrawRectangleGradientH')
            import :: c_int, color_type
            implicit none
            integer(kind=c_int), intent(in), value :: pos_x
            integer(kind=c_int), intent(in), value :: pos_y
            integer(kind=c_int), intent(in), value :: width
            integer(kind=c_int), intent(in), value :: height
            type(color_type),    intent(in), value :: color1
            type(color_type),    intent(in), value :: color2
        end subroutine draw_rectangle_gradient_h

        ! void DrawRectangleGradientV(int posX, int posY, int width, int height, Color color1, Color color2)
        subroutine draw_rectangle_gradient_v(pos_x, pos_y, width, height, color1, color2) &
                bind(c, name='DrawRectangleGradientV')
            import :: c_int, color_type
            implicit none
            integer(kind=c_int), intent(in), value :: pos_x
            integer(kind=c_int), intent(in), value :: pos_y
            integer(kind=c_int), intent(in), value :: width
            integer(kind=c_int), intent(in), value :: height
            type(color_type),    intent(in), value :: color1
            type(color_type),    intent(in), value :: color2
        end subroutine draw_rectangle_gradient_v

        ! void DrawRectangleLines(int posX, int posY, int width, int height, Color color)
        subroutine draw_rectangle_lines(pos_x, pos_y, width, height, color) bind(c, name='DrawRectangleLines')
            import :: c_int, color_type
            implicit none
            integer(kind=c_int), intent(in), value :: pos_x
            integer(kind=c_int), intent(in), value :: pos_y
            integer(kind=c_int), intent(in), value :: width
            integer(kind=c_int), intent(in), value :: height
            type(color_type),    intent(in), value :: color
        end subroutine draw_rectangle_lines

        ! void DrawRectangleLinesEx(Rectangle rec, float lineThick, Color color)
        subroutine draw_rectangle_lines_ex(rec, line_thick, color) bind(c, name='DrawRectangleLinesEx')
            import :: c_float, color_type, rectangle_type
            implicit none
            type(rectangle_type), intent(in), value :: rec
            real(kind=c_float),   intent(in), value :: line_thick
            type(color_type),     intent(in), value :: color
        end subroutine draw_rectangle_lines_ex

        ! void DrawRectanglePro(Rectangle rec, Vector2 origin, float rotation, Color color)
        subroutine draw_rectangle_pro(rec, origin, rotation, color) bind(c, name='DrawRectanglePro')
            import :: c_float, color_type, rectangle_type, vector2_type
            implicit none
            type(rectangle_type), intent(in), value :: rec
            type(vector2_type),   intent(in), value :: origin
            real(kind=c_float),   intent(in), value :: rotation
            type(color_type),     intent(in), value :: color
        end subroutine draw_rectangle_pro

        ! void DrawRectangleRec(Rectangle rec, Color color)
        subroutine draw_rectangle_rec(rec, color) bind(c, name='DrawRectangleRec')
            import :: color_type, rectangle_type
            implicit none
            type(rectangle_type), intent(in), value :: rec
            type(color_type),     intent(in), value :: color
        end subroutine draw_rectangle_rec

        ! void DrawRectangleRounded(Rectangle rec, float roundness, int segments, Color color)
        subroutine draw_rectangle_rounded(rec, roundness, segments, color) bind(c, name='DrawRectangleRounded')
            import :: c_float, c_int, color_type, rectangle_type
            implicit none
            type(rectangle_type), intent(in), value :: rec
            real(kind=c_float),   intent(in), value :: roundness
            integer(kind=c_int),  intent(in), value :: segments
            type(color_type),     intent(in), value :: color
        end subroutine draw_rectangle_rounded

        ! void DrawRectangleRoundedLines(Rectangle rec, float roundness, int segments, float lineThick, Color color)
        subroutine draw_rectangle_rounded_lines(rec, roundness, segments, line_thick, color) &
                bind(c, name='DrawRectangleRoundedLines')
            import :: c_float, c_int, color_type, rectangle_type
            implicit none
            type(rectangle_type), intent(in), value :: rec
            real(kind=c_float),   intent(in), value :: roundness
            integer(kind=c_int),  intent(in), value :: segments
            real(kind=c_float),   intent(in), value :: line_thick
            type(color_type),     intent(in), value :: color
        end subroutine draw_rectangle_rounded_lines

        ! void DrawRectangleV(Vector2 position, Vector2 size, Color color)
        subroutine draw_rectangle_v(position, size, color) bind(c, name='DrawRectangleV')
            import :: color_type, vector2_type
            implicit none
            type(vector2_type), intent(in), value :: position
            type(vector2_type), intent(in), value :: size
            type(color_type),   intent(in), value :: color
        end subroutine draw_rectangle_v

        ! void DrawRing(Vector2 center, float innerRadius, float outerRadius, float startAngle, float endAngle, int segments, Color color)
        subroutine draw_ring(center, inner_radius, outer_radius, start_angle, end_angle, segments, color) &
                bind(c, name='DrawRing')
            import :: c_float, c_int, color_type, vector2_type
            implicit none
            type(vector2_type),  intent(in), value :: center
            real(kind=c_float),  intent(in), value :: inner_radius
            real(kind=c_float),  intent(in), value :: outer_radius
            real(kind=c_float),  intent(in), value :: start_angle
            real(kind=c_float),  intent(in), value :: end_angle
            integer(kind=c_int), intent(in), value :: segments
            type(color_type),    intent(in), value :: color
        end subroutine draw_ring

        ! void DrawRingLines(Vector2 center, float innerRadius, float outerRadius, float startAngle, float endAngle, int segments, Color color)
        subroutine draw_ring_lines(center, inner_radius, outer_radius, start_angle, end_angle, segments, color) &
                bind(c, name='DrawRingLines')
            import :: c_float, c_int, color_type, vector2_type
            implicit none
            type(vector2_type),  intent(in), value :: center
            real(kind=c_float),  intent(in), value :: inner_radius
            real(kind=c_float),  intent(in), value :: outer_radius
            real(kind=c_float),  intent(in), value :: start_angle
            real(kind=c_float),  intent(in), value :: end_angle
            integer(kind=c_int), intent(in), value :: segments
            type(color_type),    intent(in), value :: color
        end subroutine draw_ring_lines

        ! void DrawSphere(Vector3 centerPos, float radius, Color color)
        subroutine draw_sphere(center_pos, radius, color) bind(c, name='DrawSphere')
            import :: c_float, color_type, vector3_type
            implicit none
            type(vector3_type), intent(in), value :: center_pos
            real(kind=c_float), intent(in), value :: radius
            type(color_type),   intent(in), value :: color
        end subroutine draw_sphere

        ! void DrawSphereEx(Vector3 centerPos, float radius, int rings, int slices, Color color)
        subroutine draw_sphere_ex(center_pos, radius, rings, slices, color) bind(c, name='DrawSphereEx')
            import :: c_float, c_int, color_type, vector3_type
            implicit none
            type(vector3_type),  intent(in), value :: center_pos
            real(kind=c_float),  intent(in), value :: radius
            integer(kind=c_int), intent(in), value :: rings
            integer(kind=c_int), intent(in), value :: slices
            type(color_type),    intent(in), value :: color
        end subroutine draw_sphere_ex

        ! void DrawSphereWires(Vector3 centerPos, float radius, int rings, int slices, Color color)
        subroutine draw_sphere_wires(center_pos, radius, rings, slices, color) bind(c, name='DrawSphereWires')
            import :: c_float, c_int, color_type, vector3_type
            implicit none
            type(vector3_type),  intent(in), value :: center_pos
            real(kind=c_float),  intent(in), value :: radius
            integer(kind=c_int), intent(in), value :: rings
            integer(kind=c_int), intent(in), value :: slices
            type(color_type),    intent(in), value :: color
        end subroutine draw_sphere_wires

        ! void DrawSplineBasis(Vector2 *points, int pointCount, float thick, Color color)
        subroutine draw_spline_basis(points, point_count, thick, color) bind(c, name='DrawSplineBasis')
            import :: c_float, c_int, color_type, vector2_type
            implicit none
            type(vector2_type),  intent(in)        :: points(*)
            integer(kind=c_int), intent(in), value :: point_count
            real(kind=c_float),  intent(in), value :: thick
            type(color_type),    intent(in), value :: color
        end subroutine draw_spline_basis

        ! void DrawSplineBezierCubic(Vector2 *points, int pointCount, float thick, Color color)
        subroutine draw_spline_bezier_cubic(points, point_count, thick, color) bind(c, name='DrawSplineBezierCubic')
            import :: c_float, c_int, color_type, vector2_type
            implicit none
            type(vector2_type),  intent(in)        :: points(*)
            integer(kind=c_int), intent(in), value :: point_count
            real(kind=c_float),  intent(in), value :: thick
            type(color_type),    intent(in), value :: color
        end subroutine draw_spline_bezier_cubic

        ! void DrawSplineBezierQuadratic(Vector2 *points, int pointCount, float thick, Color color)
        subroutine draw_spline_bezier_quadratic(points, point_count, thick, color) bind(c, name='DrawSplineBezierQuadratic')
            import :: c_float, c_int, color_type, vector2_type
            implicit none
            type(vector2_type),  intent(in)        :: points(*)
            integer(kind=c_int), intent(in), value :: point_count
            real(kind=c_float),  intent(in), value :: thick
            type(color_type),    intent(in), value :: color
        end subroutine draw_spline_bezier_quadratic

        ! void DrawSplineCatmullRom(Vector2 *points, int pointCount, float thick, Color color)
        subroutine draw_spline_catmull_rom(points, point_count, thick, color) bind(c, name='DrawSplineCatmullRom')
            import :: c_float, c_int, color_type, vector2_type
            implicit none
            type(vector2_type),  intent(in)        :: points(*)
            integer(kind=c_int), intent(in), value :: point_count
            real(kind=c_float),  intent(in), value :: thick
            type(color_type),    intent(in), value :: color
        end subroutine draw_spline_catmull_rom

        ! void DrawSplineLinear(Vector2 *points, int pointCount, float thick, Color color)
        subroutine draw_spline_linear(points, point_count, thick, color) bind(c, name='DrawSplineLinear')
            import :: c_float, c_int, color_type, vector2_type
            implicit none
            type(vector2_type),  intent(in)        :: points(*)
            integer(kind=c_int), intent(in), value :: point_count
            real(kind=c_float),  intent(in), value :: thick
            type(color_type),    intent(in), value :: color
        end subroutine draw_spline_linear

        ! void DrawSplineSegmentBasis(Vector2 p1, Vector2 p2, Vector2 p3, Vector2 p4, float thick, Color color)
        subroutine draw_spline_segment_basis(p1, p2, p3, p4, thick, color) bind(c, name='DrawSplineSegmentBasis')
            import :: c_float, color_type, vector2_type
            implicit none
            type(vector2_type), intent(in), value :: p1
            type(vector2_type), intent(in), value :: p2
            type(vector2_type), intent(in), value :: p3
            type(vector2_type), intent(in), value :: p4
            real(kind=c_float), intent(in), value :: thick
            type(color_type),   intent(in), value :: color
        end subroutine draw_spline_segment_basis

        ! void DrawSplineSegmentBezierCubic(Vector2 p1, Vector2 c2, Vector2 c3, Vector2 p4, float thick, Color color)
        subroutine draw_spline_segment_bezier_cubic(p1, c2, c3, p4, thick, color) bind(c, name='DrawSplineSegmentBezierCubic')
            import :: c_float, color_type, vector2_type
            implicit none
            type(vector2_type), intent(in), value :: p1
            type(vector2_type), intent(in), value :: c2
            type(vector2_type), intent(in), value :: c3
            type(vector2_type), intent(in), value :: p4
            real(kind=c_float), intent(in), value :: thick
            type(color_type),   intent(in), value :: color
        end subroutine draw_spline_segment_bezier_cubic

        ! void DrawSplineSegmentBezierQuadratic(Vector2 p1, Vector2 c2, Vector2 p3, float thick, Color color)
        subroutine draw_spline_segment_bezier_quadratic(p1, c2, p3, thick, color) bind(c, name='DrawSplineSegmentBezierQuadratic')
            import :: c_float, color_type, vector2_type
            implicit none
            type(vector2_type), intent(in), value :: p1
            type(vector2_type), intent(in), value :: c2
            type(vector2_type), intent(in), value :: p3
            real(kind=c_float), intent(in), value :: thick
            type(color_type),   intent(in), value :: color
        end subroutine draw_spline_segment_bezier_quadratic

        ! void DrawSplineSegmentCatmullRom(Vector2 p1, Vector2 p2, Vector2 p3, Vector2 p4, float thick, Color color)
        subroutine draw_spline_segment_catmull_rom(p1, p2, p3, p4, thick, color) bind(c, name='DrawSplineSegmentCatmullRom')
            import :: c_float, color_type, vector2_type
            implicit none
            type(vector2_type), intent(in), value :: p1
            type(vector2_type), intent(in), value :: p2
            type(vector2_type), intent(in), value :: p3
            type(vector2_type), intent(in), value :: p4
            real(kind=c_float), intent(in), value :: thick
            type(color_type),   intent(in), value :: color
        end subroutine draw_spline_segment_catmull_rom

        ! void DrawSplineSegmentLinear(Vector2 p1, Vector2 p2, float thick, Color color)
        subroutine draw_spline_segment_linear(p1, p2, thick, color) bind(c, name='DrawSplineSegmentLinear')
            import :: c_float, color_type, vector2_type
            implicit none
            type(vector2_type), intent(in), value :: p1
            type(vector2_type), intent(in), value :: p2
            real(kind=c_float), intent(in), value :: thick
            type(color_type),   intent(in), value :: color
        end subroutine draw_spline_segment_linear

        ! void DrawTriangleStrip3D(Vector3 *points, int pointCount, Color color)
        subroutine draw_triangle_strip3d(points, point_count, color) bind(c, name='DrawTriangleStrip3D')
            import :: c_int, color_type, vector3_type
            implicit none
            type(vector3_type),  intent(in)        :: points(*)
            integer(kind=c_int), intent(in), value :: point_count
            type(color_type),    intent(in), value :: color
        end subroutine draw_triangle_strip3d

        ! void DrawText(const char *text, int posX, int posY, int fontSize, Color color)
        subroutine draw_text(text, pos_x, pos_y, font_size, color) bind(c, name='DrawText')
            import :: c_char, c_int, color_type
            implicit none
            character(kind=c_char), intent(in)        :: text
            integer(kind=c_int),    intent(in), value :: pos_x
            integer(kind=c_int),    intent(in), value :: pos_y
            integer(kind=c_int),    intent(in), value :: font_size
            type(color_type),       intent(in), value :: color
        end subroutine draw_text

        ! void DrawTextCodepoint(Font font, int codepoint, Vector2 position, float fontSize, Color tint)
        subroutine draw_text_codepoint(font, codepoint, position, font_size, tint) bind(c, name='DrawTextCodepoint')
            import :: c_float, c_int, color_type, font_type, vector2_type
            implicit none
            type(font_type),     intent(in), value :: font
            integer(kind=c_int), intent(in), value :: codepoint
            type(vector2_type),  intent(in), value :: position
            real(kind=c_float),  intent(in), value :: font_size
            type(color_type),    intent(in), value :: tint
        end subroutine draw_text_codepoint

        ! void DrawTextCodepoints(Font font, const int *codepoints, int codepointCount, Vector2 position, float fontSize, float spacing, Color tint)
        subroutine draw_text_codepoints(font, codepoints, codepointCount, position, font_size, spacing, tint) &
                bind(c, name='DrawTextCodepoints')
            import :: c_float, c_int, color_type, font_type, vector2_type
            implicit none
            type(font_type),     intent(in), value :: font
            integer(kind=c_int), intent(inout)     :: codepoints(*)
            integer(kind=c_int), intent(in), value :: codepointCount
            type(vector2_type),  intent(in), value :: position
            real(kind=c_float),  intent(in), value :: font_size
            real(kind=c_float),  intent(in), value :: spacing
            type(color_type),    intent(in), value :: tint
        end subroutine draw_text_codepoints

        ! void DrawTextEx(Font font, const char *text, Vector2 position, float fontSize, float spacing, Color tint)
        subroutine draw_text_ex(font, text, position, font_size, spacing, tint) bind(c, name='DrawTextEx')
            import :: c_char, c_float, color_type, font_type, vector2_type
            implicit none
            type(font_type),        intent(in), value :: font
            character(kind=c_char), intent(in)        :: text
            type(vector2_type),     intent(in), value :: position
            real(kind=c_float),     intent(in), value :: font_size
            real(kind=c_float),     intent(in), value :: spacing
            type(color_type),       intent(in), value :: tint
        end subroutine draw_text_ex

        ! void DrawTextPro(Font font, const char *text, Vector2 position, Vector2 origin, float rotation, float fontSize, float spacing, Color tint)
        subroutine draw_text_pro(font, text, position, origin, rotation, font_size, spacing, tint) &
                bind(c, name='DrawTextPro')
            import :: c_char, c_float, color_type, font_type, vector2_type
            implicit none
            type(font_type),        intent(in), value :: font
            character(kind=c_char), intent(in)        :: text
            type(vector2_type),     intent(in), value :: position
            type(vector2_type),     intent(in), value :: origin
            real(kind=c_float),     intent(in), value :: rotation
            real(kind=c_float),     intent(in), value :: font_size
            real(kind=c_float),     intent(in), value :: spacing
            type(color_type),       intent(in), value :: tint
        end subroutine draw_text_pro

        ! void DrawTexture(Texture2D texture, int posX, int posY, Color tint)
        subroutine draw_texture(texture, pos_x, pos_y, tint) bind(c, name='DrawTexture')
            import :: c_int, color_type, texture2d_type
            implicit none
            type(texture2d_type), intent(in), value :: texture
            integer(kind=c_int),  intent(in), value :: pos_x
            integer(kind=c_int),  intent(in), value :: pos_y
            type(color_type),     intent(in), value :: tint
        end subroutine draw_texture

        ! void DrawTextureEx(Texture2D texture, Vector2 position, float rotation, float scale, Color tint)
        subroutine draw_texture_ex(texture, position, rotation, scale, tint) bind(c, name='DrawTextureEx')
            import :: c_float, color_type, texture2d_type, vector2_type
            implicit none
            type(texture2d_type), intent(in), value :: texture
            type(vector2_type),   intent(in), value :: position
            real(kind=c_float),   intent(in), value :: rotation
            real(kind=c_float),   intent(in), value :: scale
            type(color_type),     intent(in), value :: tint
        end subroutine draw_texture_ex

        ! void DrawTextureNPatch(Texture2D texture, NPatchInfo nPatchInfo, Rectangle dest, Vector2 origin, float rotation, Color tint)
        subroutine draw_texture_npatch(texture, npatch_info, dest, origin, rotation, tint) &
                bind(c, name='DrawTextureNPatch')
            import :: c_float, color_type, npatch_info_type, rectangle_type, texture2d_type, vector2_type
            implicit none
            type(texture2d_type),   intent(in), value :: texture
            type(npatch_info_type), intent(in), value :: npatch_info
            type(rectangle_type),   intent(in), value :: dest
            type(vector2_type),     intent(in), value :: origin
            real(kind=c_float),     intent(in), value :: rotation
            type(color_type),       intent(in), value :: tint
        end subroutine draw_texture_npatch

        ! void DrawTexturePro(Texture2D texture, Rectangle source, Rectangle dest, Vector2 origin, float rotation, Color tint)
        subroutine draw_texture_pro(texture, source, dest, origin, rotation, tint) bind(c, name='DrawTexturePro')
            import :: c_float, color_type, rectangle_type, texture2d_type, vector2_type
            implicit none
            type(texture2d_type), intent(in), value :: texture
            type(rectangle_type), intent(in), value :: source
            type(rectangle_type), intent(in), value :: dest
            type(vector2_type),   intent(in), value :: origin
            real(kind=c_float),   intent(in), value :: rotation
            type(color_type),     intent(in), value :: tint
        end subroutine draw_texture_pro

        ! void DrawTextureRec(Texture2D texture, Rectangle source, Vector2 position, Color tint)
        subroutine draw_texture_rec(texture, source, position, tint) bind(c, name='DrawTextureRec')
            import :: color_type, rectangle_type, texture2d_type, vector2_type
            implicit none
            type(texture2d_type), intent(in), value :: texture
            type(rectangle_type), intent(in), value :: source
            type(vector2_type),   intent(in), value :: position
            type(color_type),     intent(in), value :: tint
        end subroutine draw_texture_rec

        ! void DrawTextureV(Texture2D texture, Vector2 position, Color tint)
        subroutine draw_texture_v(texture, position, tint) bind(c, name='DrawTextureV')
            import :: color_type, texture2d_type, vector2_type
            implicit none
            type(texture2d_type), intent(in), value :: texture
            type(vector2_type),   intent(in), value :: position
            type(color_type),     intent(in), value :: tint
        end subroutine draw_texture_v

        ! void DrawTriangle(Vector2 v1, Vector2 v2, Vector2 v3, Color color)
        subroutine draw_triangle(v1, v2, v3, color) bind(c, name='DrawTriangle')
            import :: color_type, vector2_type
            implicit none
            type(vector2_type), intent(in), value :: v1
            type(vector2_type), intent(in), value :: v2
            type(vector2_type), intent(in), value :: v3
            type(color_type),   intent(in), value :: color
        end subroutine draw_triangle

        ! void DrawTriangle3D(Vector3 v1, Vector3 v2, Vector3 v3, Color color)
        subroutine draw_triangle3d(v1, v2, v3, color) bind(c, name='DrawTriangle3D')
            import :: color_type, vector3_type
            implicit none
            type(vector3_type), intent(in), value :: v1
            type(vector3_type), intent(in), value :: v2
            type(vector3_type), intent(in), value :: v3
            type(color_type),   intent(in), value :: color
        end subroutine draw_triangle3d

        ! void DrawTriangleFan(Vector2 *points, int pointCount, Color color)
        subroutine draw_triangle_fan(points, point_count, color) bind(c, name='DrawTriangleFan')
            import :: c_int, color_type, vector2_type
            implicit none
            type(vector2_type),  intent(in)        :: points(*)
            integer(kind=c_int), intent(in), value :: point_count
            type(color_type),    intent(in), value :: color
        end subroutine draw_triangle_fan

        ! void DrawTriangleLines(Vector2 v1, Vector2 v2, Vector2 v3, Color color)
        subroutine draw_triangle_lines(v1, v2, v3, color) bind(c, name='DrawTriangleLines')
            import :: color_type, vector2_type
            implicit none
            type(vector2_type), intent(in), value :: v1
            type(vector2_type), intent(in), value :: v2
            type(vector2_type), intent(in), value :: v3
            type(color_type),   intent(in), value :: color
        end subroutine draw_triangle_lines

        ! void DrawTriangleStrip(Vector2 *points, int pointCount, Color color)
        subroutine draw_triangle_strip(points, point_count, color) bind(c, name='DrawTriangleStrip')
            import :: c_int, color_type, vector2_type
            implicit none
            type(vector2_type),  intent(in)        :: points(*)
            integer(kind=c_int), intent(in), value :: point_count
            type(color_type),    intent(in), value :: color
        end subroutine draw_triangle_strip

        ! void EnableCursor(void)
        subroutine enable_cursor() bind(c, name='EnableCursor')
        end subroutine enable_cursor

        ! void EnableEventWaiting(void)
        subroutine enable_event_waiting() bind(c, name='EnableEventWaiting')
        end subroutine enable_event_waiting

        ! char *EncodeDataBase64(const unsigned char *data, int dataSize, int *outputSize)
        function encode_data_base64(data, data_size, output_size) bind(c, name='EncodeDataBase64')
            import :: c_int, c_unsigned_char, c_ptr
            implicit none
            integer(kind=c_unsigned_char), intent(in)        :: data
            integer(kind=c_int),           intent(in), value :: data_size
            integer(kind=c_int),           intent(out)       :: output_size
            type(c_ptr)                                      :: encode_data_base64
        end function encode_data_base64

        ! void EndBlendMode(void)
        subroutine end_blend_mode() bind(c, name='EndBlendMode')
        end subroutine end_blend_mode

        ! void EndDrawing(void)
        subroutine end_drawing() bind(c, name='EndDrawing')
        end subroutine end_drawing

        ! void EndMode2D(void)
        subroutine end_mode2d() bind(c, name='EndMode2D')
        end subroutine end_mode2d

        ! void EndMode3D(void)
        subroutine end_mode3d() bind(c, name='EndMode3D')
        end subroutine end_mode3d

        ! void EndScissorMode(void)
        subroutine end_scissor_mode() bind(c, name='EndScissorMode')
        end subroutine end_scissor_mode

        ! void EndShaderMode(void)
        subroutine end_shader_mode() bind(c, name='EndShaderMode')
        end subroutine end_shader_mode

        ! void EndTextureMode(void)
        subroutine end_texture_mode() bind(c, name='EndTextureMode')
        end subroutine end_texture_mode

        ! void EndVrStereoMode(void)
        subroutine end_vr_stereo_mode() bind(c, name='EndVrStereoMode')
        end subroutine end_vr_stereo_mode

        ! bool ExportDataAsCode(const unsigned char *data, int dataSize, const char *fileName)
        function export_data_as_code(data, data_size, file_name) bind(c, name='ExportDataAsCode')
            import :: c_bool, c_char, c_int, c_unsigned_char
            implicit none
            integer(kind=c_unsigned_char), intent(in)        :: data
            integer(kind=c_int),           intent(in), value :: data_size
            character(kind=c_char),        intent(in)        :: file_name
            logical(kind=c_bool)                             :: export_data_as_code
        end function export_data_as_code

        ! bool ExportFontAsCode(Font font, const char *fileName)
        function export_font_as_code(font, file_name) bind(c, name='ExportFontAsCode')
            import :: c_bool, c_char, font_type
            implicit none
            type(font_type),        intent(in), value :: font
            character(kind=c_char), intent(in)        :: file_name
            logical(kind=c_bool)                      :: export_font_as_code
        end function export_font_as_code

        ! bool ExportImage(Image image, const char *fileName)
        function export_image(image, file_name) bind(c, name='ExportImage')
            import :: c_bool, c_char, image_type
            implicit none
            type(image_type),       intent(in), value :: image
            character(kind=c_char), intent(in)        :: file_name
            logical(kind=c_bool)                      :: export_image
        end function export_image

        ! bool ExportImageAsCode(Image image, const char *fileName)
        function export_image_as_code(image, file_name) bind(c, name='ExportImageAsCode')
            import :: c_bool, c_char, image_type
            implicit none
            type(image_type),       intent(in), value :: image
            character(kind=c_char), intent(in)        :: file_name
            logical(kind=c_bool)                      :: export_image_as_code
        end function export_image_as_code

        ! unsigned char *ExportImageToMemory(Image image, const char *fileType, int *fileSize)
        function export_image_to_memory(image, file_type, file_size) bind(c, name='ExportImageToMemory')
            import :: c_char, c_int, c_ptr, image_type
            implicit none
            type(image_type),       intent(in), value :: image
            character(kind=c_char), intent(in)        :: file_type
            integer(kind=c_int),    intent(out)       :: file_size
            type(c_ptr)                               :: export_image_to_memory
        end function export_image_to_memory

        ! bool ExportMesh(Mesh mesh, const char *fileName)
        function export_mesh(mesh, file_name) bind(c, name='ExportMesh')
            import :: c_bool, c_char, mesh_type
            implicit none
            type(mesh_type),        intent(in), value :: mesh
            character(kind=c_char), intent(in)        :: file_name
            logical(kind=c_bool)                      :: export_mesh
        end function export_mesh

        ! bool ExportMeshAsCode(Mesh mesh, const char *fileName)
        function export_mesh_as_code(mesh, file_name) bind(c, name='ExportMeshAsCode')
            import :: c_bool, c_char, mesh_type
            implicit none
            type(mesh_type),        intent(in), value :: mesh
            character(kind=c_char), intent(in)        :: file_name
            logical(kind=c_bool)                      :: export_mesh_as_code
        end function export_mesh_as_code

        ! bool ExportWave(Wave wave, const char *fileName)
        function export_wave(wave, file_name) bind(c, name='ExportWave')
            import :: c_bool, c_char, wave_type
            implicit none
            type(wave_type),        intent(in), value :: wave
            character(kind=c_char), intent(in)        :: file_name
            logical(kind=c_bool)                      :: export_wave
        end function export_wave

        ! bool ExportWaveAsCode(Wave wave, const char *fileName)
        function export_wave_as_code(wave, file_name) bind(c, name='ExportWaveAsCode')
            import :: c_bool, c_char, wave_type
            implicit none
            type(wave_type),        intent(in), value :: wave
            character(kind=c_char), intent(in)        :: file_name
            logical(kind=c_bool)                      :: export_wave_as_code
        end function export_wave_as_code

        ! Color Fade(Color color, float alpha)
        function fade(color, alpha) bind(c, name='Fade')
            import :: c_float, color_type
            implicit none
            type(color_type),   intent(in), value :: color
            real(kind=c_float), intent(in), value :: alpha
            type(color_type)                      :: fade
        end function fade

        ! bool FileExists(const char *fileName)
        function file_exists(file_name) bind(c, name='FileExists')
            import :: c_bool, c_char
            implicit none
            character(kind=c_char), intent(in) :: file_name
            logical(kind=c_bool)               :: file_exists
        end function file_exists

        ! Image GenImageCellular(int width, int height, int tileSize)
        function gen_image_cellular(width, height, tile_size) bind(c, name='GenImageCellular')
            import :: c_int, image_type
            implicit none
            integer(kind=c_int), intent(in), value :: width
            integer(kind=c_int), intent(in), value :: height
            integer(kind=c_int), intent(in), value :: tile_size
            type(image_type)                       :: gen_image_cellular
        end function gen_image_cellular

        ! Image GenImageChecked(int width, int height, int checksX, int checksY, Color col1, Color col2)
        function gen_image_checked(width, height, checks_x, checks_y, col1, col2) bind(c, name='GenImageChecked')
            import :: c_int, color_type, image_type
            implicit none
            integer(kind=c_int), intent(in), value :: width
            integer(kind=c_int), intent(in), value :: height
            integer(kind=c_int), intent(in), value :: checks_x
            integer(kind=c_int), intent(in), value :: checks_y
            type(color_type),    intent(in), value :: col1
            type(color_type),    intent(in), value :: col2
            type(image_type)                       :: gen_image_checked
        end function gen_image_checked

        ! Image GenImageColor(int width, int height, Color color)
        function gen_image_color(width, height, color) bind(c, name='GenImageColor')
            import :: c_int, color_type, image_type
            implicit none
            integer(kind=c_int), intent(in), value :: width
            integer(kind=c_int), intent(in), value :: height
            type(color_type),    intent(in), value :: color
            type(image_type)                       :: gen_image_color
        end function gen_image_color

        ! Image GenImageFontAtlas(const GlyphInfo *glyphs, Rectangle **glyphRecs, int glyphCount, int fontSize, int padding, int packMethod)
        function gen_image_font_atlas(glyphs, glyph_recs, glyph_count, font_size, padding, pack_method) &
                bind(c, name='GenImageFontAtlas')
            import :: c_int, glyph_info_type, image_type, rectangle_type
            implicit none
            type(glyph_info_type), intent(inout)     :: glyphs
            type(rectangle_type),  intent(inout)     :: glyph_recs(*)
            integer(kind=c_int),   intent(in), value :: glyph_count
            integer(kind=c_int),   intent(in), value :: font_size
            integer(kind=c_int),   intent(in), value :: padding
            integer(kind=c_int),   intent(in), value :: pack_method
            type(image_type)                         :: gen_image_font_atlas
        end function gen_image_font_atlas

        ! Image GenImageGradientLinear(int width, int height, int direction, Color start, Color end)
        function gen_image_gradient_linear(width, height, direction, start, end) bind(c, name='GenImageGradientLinear')
            import :: c_int, color_type, image_type
            implicit none
            integer(kind=c_int), intent(in), value :: width
            integer(kind=c_int), intent(in), value :: height
            integer(kind=c_int), intent(in), value :: direction
            type(color_type),    intent(in), value :: start
            type(color_type),    intent(in), value :: end
            type(image_type)                       :: gen_image_gradient_linear
        end function gen_image_gradient_linear

        ! Image GenImageGradientRadial(int width, int height, float density, Color inner, Color outer)
        function gen_image_gradient_radial(width, height, density, inner, outer) bind(c, name='GenImageGradientRadial')
            import :: c_float, c_int, color_type, image_type
            implicit none
            integer(kind=c_int), intent(in), value :: width
            integer(kind=c_int), intent(in), value :: height
            real(kind=c_float),  intent(in), value :: density
            type(color_type),    intent(in), value :: inner
            type(color_type),    intent(in), value :: outer
            type(image_type)                       :: gen_image_gradient_radial
        end function gen_image_gradient_radial

        ! Image GenImageGradientSquare(int width, int height, float density, Color inner, Color outer)
        function gen_image_gradient_square(width, height, density, inner, outer) bind(c, name='GenImageGradientSquare')
            import :: c_float, c_int, color_type, image_type
            implicit none
            integer(kind=c_int), intent(in), value :: width
            integer(kind=c_int), intent(in), value :: height
            real(kind=c_float),  intent(in), value :: density
            type(color_type),    intent(in), value :: inner
            type(color_type),    intent(in), value :: outer
            type(image_type)                       :: gen_image_gradient_square
        end function gen_image_gradient_square

        ! Image GenImageWhiteNoise(int width, int height, float factor)
        function gen_image_white_noise(width, height, factor) bind(c, name='GenImageWhiteNoise')
            import :: c_float, c_int, image_type
            implicit none
            integer(kind=c_int), intent(in), value :: width
            integer(kind=c_int), intent(in), value :: height
            real(kind=c_float),  intent(in), value :: factor
            type(image_type)                       :: gen_image_white_noise
        end function gen_image_white_noise

        ! Image GenImagePerlinNoise(int width, int height, int offsetX, int offsetY, float scale)
        function gen_image_perlin_noise(width, height, offset_x, offset_y, scale) bind(c, name='GenImagePerlinNoise')
            import :: c_float, c_int, image_type
            implicit none
            integer(kind=c_int), intent(in), value :: width
            integer(kind=c_int), intent(in), value :: height
            integer(kind=c_int), intent(in), value :: offset_x
            integer(kind=c_int), intent(in), value :: offset_y
            real(kind=c_float),  intent(in), value :: scale
            type(image_type)                       :: gen_image_perlin_noise
        end function gen_image_perlin_noise

        ! Image GenImageText(int width, int height, const char *text)
        function gen_image_text(width, height, text) bind(c, name='GenImageText')
            import :: c_char, c_int, image_type
            implicit none
            integer(kind=c_int),    intent(in), value :: width
            integer(kind=c_int),    intent(in), value :: height
            character(kind=c_char), intent(in)        :: text
            type(image_type)                          :: gen_image_text
        end function gen_image_text

        ! Mesh GenMeshCone(float radius, float height, int slices)
        function gen_mesh_cone(radius, height, slices) bind(c, name='GenMeshCone')
            import :: c_float, c_int, mesh_type
            implicit none
            real(kind=c_float),  intent(in), value :: radius
            real(kind=c_float),  intent(in), value :: height
            integer(kind=c_int), intent(in), value :: slices
            type(mesh_type)                        :: gen_mesh_cone
        end function gen_mesh_cone

        ! Mesh GenMeshCube(float width, float height, float length)
        function gen_mesh_cube(width, height, length) bind(c, name='GenMeshCube')
            import :: c_float, mesh_type
            implicit none
            real(kind=c_float), intent(in), value :: width
            real(kind=c_float), intent(in), value :: height
            real(kind=c_float), intent(in), value :: length
            type(mesh_type)                       :: gen_mesh_cube
        end function gen_mesh_cube

        ! Mesh GenMeshCubicmap(Image cubicmap, Vector3 cubeSize)
        function gen_mesh_cubicmap(cubicmap, cube_size) bind(c, name='GenMeshCubicmap')
            import :: image_type, mesh_type, vector3_type
            implicit none
            type(image_type),   intent(in), value :: cubicmap
            type(vector3_type), intent(in), value :: cube_size
            type(mesh_type)                       :: gen_mesh_cubicmap
        end function gen_mesh_cubicmap

        ! Mesh GenMeshCylinder(float radius, float height, int slices)
        function gen_mesh_cylinder(radius, height, slices) bind(c, name='GenMeshCylinder')
            import :: c_float, c_int, mesh_type
            implicit none
            real(kind=c_float),  intent(in), value :: radius
            real(kind=c_float),  intent(in), value :: height
            integer(kind=c_int), intent(in), value :: slices
            type(mesh_type)                        :: gen_mesh_cylinder
        end function gen_mesh_cylinder

        ! Mesh GenMeshHeightmap(Image heightmap, Vector3 size)
        function gen_mesh_heightmap(heightmap, size) bind(c, name='GenMeshHeightmap')
            import :: image_type, mesh_type, vector3_type
            implicit none
            type(image_type),   intent(in), value :: heightmap
            type(vector3_type), intent(in), value :: size
            type(mesh_type)                       :: gen_mesh_heightmap
        end function gen_mesh_heightmap

        ! Mesh GenMeshHemiSphere(float radius, int rings, int slices)
        function gen_mesh_hemi_sphere(radius, rings, slices) bind(c, name='GenMeshHemiSphere')
            import :: c_float, c_int, mesh_type
            implicit none
            real(kind=c_float),  intent(in), value :: radius
            integer(kind=c_int), intent(in), value :: rings
            integer(kind=c_int), intent(in), value :: slices
            type(mesh_type)                        :: gen_mesh_hemi_sphere
        end function gen_mesh_hemi_sphere

        ! Mesh GenMeshKnot(float radius, float size, int radSeg, int sides)
        function gen_mesh_knot(radius, size, rad_seg, sides) bind(c, name='GenMeshKnot')
            import :: c_float, c_int, mesh_type
            implicit none
            real(kind=c_float),  intent(in), value :: radius
            real(kind=c_float),  intent(in), value :: size
            integer(kind=c_int), intent(in), value :: rad_seg
            integer(kind=c_int), intent(in), value :: sides
            type(mesh_type)                        :: gen_mesh_knot
        end function gen_mesh_knot

        ! Mesh GenMeshPlane(float width, float length, int resX, int resZ)
        function gen_mesh_plane(width, length, res_x, res_z) bind(c, name='GenMeshPlane')
            import :: c_float, c_int, mesh_type
            implicit none
            real(kind=c_float),  intent(in), value :: width
            real(kind=c_float),  intent(in), value :: length
            integer(kind=c_int), intent(in), value :: res_x
            integer(kind=c_int), intent(in), value :: res_z
            type(mesh_type)                        :: gen_mesh_plane
        end function gen_mesh_plane

        ! Mesh GenMeshPoly(int sides, float radius)
        function gen_mesh_poly(sides, radius) bind(c, name='GenMeshPoly')
            import :: c_float, c_int, mesh_type
            implicit none
            integer(kind=c_int), intent(in), value :: sides
            real(kind=c_float),  intent(in), value :: radius
            type(mesh_type)                        :: gen_mesh_poly
        end function gen_mesh_poly

        ! Mesh GenMeshSphere(float radius, int rings, int slices)
        function gen_mesh_sphere(radius, rings, slices) bind(c, name='GenMeshSphere')
            import :: c_float, c_int, mesh_type
            implicit none
            real(kind=c_float),  intent(in), value :: radius
            integer(kind=c_int), intent(in), value :: rings
            integer(kind=c_int), intent(in), value :: slices
            type(mesh_type)                        :: gen_mesh_sphere
        end function gen_mesh_sphere

        ! void GenMeshTangents(Mesh *mesh)
        subroutine gen_mesh_tangents(mesh) bind(c, name='GenMeshTangents')
            import :: mesh_type
            implicit none
            type(mesh_type), intent(in) :: mesh
        end subroutine gen_mesh_tangents

        ! Mesh GenMeshTorus(float radius, float size, int radSeg, int sides)
        function gen_mesh_torus(radius, size, rad_seg, sides) bind(c, name='GenMeshTorus')
            import :: c_float, c_int, mesh_type
            implicit none
            real(kind=c_float),  intent(in), value :: radius
            real(kind=c_float),  intent(in), value :: size
            integer(kind=c_int), intent(in), value :: rad_seg
            integer(kind=c_int), intent(in), value :: sides
            type(mesh_type)                        :: gen_mesh_torus
        end function gen_mesh_torus

        ! void GenTextureMipmaps(Texture2D *texture)
        subroutine gen_texture_mipmaps(texture) bind(c, name='GenTextureMipmaps')
            import :: texture2d_type
            implicit none
            type(texture2d_type), intent(inout) :: texture
        end subroutine gen_texture_mipmaps

        ! const char *GetApplicationDirectory(void)
        function get_application_directory() bind(c, name='GetApplicationDirectory')
            import :: c_ptr
            implicit none
            type(c_ptr) :: get_application_directory
        end function get_application_directory

        ! Matrix GetCameraMatrix(Camera camera)
        function get_camera_matrix(camera) bind(c, name='GetCameraMatrix')
            import :: camera3d_type, matrix_type
            implicit none
            type(camera3d_type), intent(in), value :: camera
            type(matrix_type)                      :: get_camera_matrix
        end function get_camera_matrix

        ! Matrix GetCameraMatrix2D(Camera2D camera)
        function get_camera_matrix2d(camera) bind(c, name='GetCameraMatrix2D')
            import :: camera2d_type, matrix_type
            implicit none
            type(camera2d_type), intent(in), value :: camera
            type(matrix_type)                      :: get_camera_matrix2d
        end function get_camera_matrix2d

        ! int GetCharPressed(void)
        function get_char_pressed() bind(c, name='GetCharPressed')
            import :: c_int
            implicit none
            integer(kind=c_int) :: get_char_pressed
        end function get_char_pressed

        ! Image GetClipboardImage(void)
        function get_clipboard_image() bind(c, name='GetClipboardImage')
            import :: image_type
            implicit none
            type(image_type) :: get_clipboard_image
        end function get_clipboard_image

        ! const char *GetClipboardText(void)
        function get_clipboard_text() bind(c, name='GetClipboardText')
            import :: c_ptr
            implicit none
            type(c_ptr) :: get_clipboard_text
        end function get_clipboard_text

        ! int GetCodepoint(const char *text, int *codepointSize)
        function get_codepoint(text, codepoint_size) bind(c, name='GetCodepoint')
            import :: c_char, c_int
            implicit none
            character(kind=c_char), intent(in)  :: text
            integer(kind=c_int),    intent(out) :: codepoint_size
            integer(kind=c_int)                 :: get_codepoint
        end function get_codepoint

        ! int GetCodepointCount(const char *text)
        function get_codepoint_count(text) bind(c, name='GetCodepointCount')
            import :: c_char, c_int
            implicit none
            character(kind=c_char), intent(in) :: text
            integer(kind=c_int)                :: get_codepoint_count
        end function get_codepoint_count

        ! int GetCodepointNext(const char *text, int *codepointSize)
        function get_codepoint_next(text, codepoint_size) bind(c, name='GetCodepointNext')
            import :: c_char, c_int
            implicit none
            character(kind=c_char), intent(in)  :: text
            integer(kind=c_int),    intent(out) :: codepoint_size
            integer(kind=c_int)                 :: get_codepoint_next
        end function get_codepoint_next

        ! int GetCodepointPrevious(const char *text, int *codepointSize)
        function get_codepoint_previous(text, codepoint_size) bind(c, name='GetCodepointPrevious')
            import :: c_char, c_int
            implicit none
            character(kind=c_char), intent(in)  :: text
            integer(kind=c_int),    intent(out) :: codepoint_size
            integer(kind=c_int)                 :: get_codepoint_previous
        end function get_codepoint_previous

        ! Rectangle GetCollisionRec(Rectangle rec1, Rectangle rec2)
        function get_collision_rec(rec1, rec2) bind(c, name='GetCollisionRec')
            import :: rectangle_type
            implicit none
            type(rectangle_type), intent(in), value :: rec1
            type(rectangle_type), intent(in), value :: rec2
            type(rectangle_type)                    :: get_collision_rec
        end function get_collision_rec

        ! Color GetColor(unsigned int hexValue)
        function get_color(hex_value) bind(c, name='GetColor')
            import :: c_unsigned_int, color_type
            implicit none
            integer(kind=c_unsigned_int), intent(in), value :: hex_value
            type(color_type)                                :: get_color
        end function get_color

        ! int GetCurrentMonitor(void)
        function get_current_monitor() bind(c, name='GetCurrentMonitor')
            import :: c_int
            implicit none
            integer(kind=c_int) :: get_current_monitor
        end function get_current_monitor

        ! const char *GetDirectoryPath(const char *filePath)
        function get_directory_path(file_path) bind(c, name='GetDirectoryPath')
            import :: c_char, c_ptr
            implicit none
            character(kind=c_char), intent(in) :: file_path
            type(c_ptr)                        :: get_directory_path
        end function get_directory_path

        ! int GetFPS(void)
        function get_fps() bind(c, name='GetFPS')
            import :: c_int
            implicit none
            integer(kind=c_int) :: get_fps
        end function get_fps

        ! const char *GetFileExtension(const char *fileName)
        function get_file_extension(file_name) bind(c, name='GetFileExtension')
            import :: c_char, c_ptr
            implicit none
            character(kind=c_char), intent(in) :: file_name
            type(c_ptr)                        :: get_file_extension
        end function get_file_extension

        ! int GetFileLength(const char *fileName)
        function get_file_length(file_name) bind(c, name='GetFileLength')
            import :: c_char, c_int
            implicit none
            character(kind=c_char), intent(in) :: file_name
            integer(kind=c_int)                :: get_file_length
        end function get_file_length

        ! long GetFileModTime(const char *fileName)
        function get_file_mod_time(file_name) bind(c, name='GetFileModTime')
            import :: c_char, c_long
            implicit none
            character(kind=c_char), intent(in) :: file_name
            integer(kind=c_long)               :: get_file_mod_time
        end function get_file_mod_time

        ! const char *GetFileName(const char *filePath)
        function get_file_name(file_path) bind(c, name='GetFileName')
            import :: c_char, c_ptr
            implicit none
            character(kind=c_char), intent(in) :: file_path
            type(c_ptr)                        :: get_file_name
        end function get_file_name

        ! const char *GetFileNameWithoutExt(const char *filePath)
        function get_file_name_without_ext(file_path) bind(c, name='GetFileNameWithoutExt')
            import :: c_char, c_ptr
            implicit none
            character(kind=c_char), intent(in) :: file_path
            type(c_ptr)                        :: get_file_name_without_ext
        end function get_file_name_without_ext

        ! Font GetFontDefault(void)
        function get_font_default() bind(c, name='GetFontDefault')
            import :: font_type
            implicit none
            type(font_type) :: get_font_default
        end function get_font_default

        ! float GetFrameTime(void)
        function get_frame_time() bind(c, name='GetFrameTime')
            import :: c_float
            implicit none
            real(kind=c_float) :: get_frame_time
        end function get_frame_time

        ! int GetGamepadAxisCount(int gamepad)
        function get_gamepad_axis_count(gamepad) bind(c, name='GetGamepadAxisCount')
            import :: c_int
            implicit none
            integer(kind=c_int), intent(in), value :: gamepad
            integer(kind=c_int)                    :: get_gamepad_axis_count
        end function get_gamepad_axis_count

        ! float GetGamepadAxisMovement(int gamepad, int axis)
        function get_gamepad_axis_movement(gamepad, axis) bind(c, name='GetGamepadAxisMovement')
            import :: c_float, c_int
            implicit none
            integer(kind=c_int), intent(in), value :: gamepad
            integer(kind=c_int), intent(in), value :: axis
            real(kind=c_float)                     :: get_gamepad_axis_movement
        end function get_gamepad_axis_movement

        ! int GetGamepadButtonPressed(void)
        function get_gamepad_button_pressed() bind(c, name='GetGamepadButtonPressed')
            import :: c_int
            implicit none
            integer(kind=c_int) :: get_gamepad_button_pressed
        end function get_gamepad_button_pressed

        ! const char *GetGamepadName(int gamepad)
        function get_gamepad_name(gamepad) bind(c, name='GetGamepadName')
            import :: c_char, c_int, c_ptr
            implicit none
            integer(kind=c_int), intent(in), value :: gamepad
            type(c_ptr)                            :: get_gamepad_name
        end function get_gamepad_name

        ! int GetGestureDetected(void)
        function get_gesture_detected() bind(c, name='GetGestureDetected')
            import :: c_int
            implicit none
            integer(kind=c_int) :: get_gesture_detected
        end function get_gesture_detected

        ! float GetGestureDragAngle(void)
        function get_gesture_drag_angle() bind(c, name='GetGestureDragAngle')
            import :: c_float
            implicit none
            real(kind=c_float) :: get_gesture_drag_angle
        end function get_gesture_drag_angle

        ! float GetGestureHoldDuration(void)
        function get_gesture_hold_duration() bind(c, name='GetGestureHoldDuration')
            import :: c_float
            implicit none
            real(kind=c_float) :: get_gesture_hold_duration
        end function get_gesture_hold_duration

        ! float GetGesturePinchAngle(void)
        function get_gesture_pinch_angle() bind(c, name='GetGesturePinchAngle')
            import :: c_float
            implicit none
            real(kind=c_float) :: get_gesture_pinch_angle
        end function get_gesture_pinch_angle

        ! Rectangle GetGlyphAtlasRec(Font font, int codepoint)
        function get_glyph_atlas_rec(font, codepoint) bind(c, name='GetGlyphAtlasRec')
            import :: c_int, font_type, rectangle_type
            implicit none
            type(font_type),     intent(in), value :: font
            integer(kind=c_int), intent(in), value :: codepoint
            type(rectangle_type)                   :: get_glyph_atlas_rec
        end function get_glyph_atlas_rec

        ! int GetGlyphIndex(Font font, int codepoint)
        function get_glyph_index(font, codepoint) bind(c, name='GetGlyphIndex')
            import :: c_int, font_type
            implicit none
            type(font_type),     intent(in), value :: font
            integer(kind=c_int), intent(in), value :: codepoint
            integer(kind=c_int)                    :: get_glyph_index
        end function get_glyph_index

        ! GlyphInfo GetGlyphInfo(Font font, int codepoint)
        function get_glyph_info(font, codepoint) bind(c, name='GetGlyphInfo')
            import :: c_int, font_type, glyph_info_type
            implicit none
            type(font_type),     intent(in), value :: font
            integer(kind=c_int), intent(in), value :: codepoint
            type(glyph_info_type)                  :: get_glyph_info
        end function get_glyph_info

        ! float GetMasterVolume(void)
        function get_master_volume() bind(c, name='GetMasterVolume')
            import :: c_float
            implicit none
            real(kind=c_float) :: get_master_volume
        end function get_master_volume

        ! Rectangle GetImageAlphaBorder(Image image, float threshold)
        function get_image_alpha_border(image, threshold) bind(c, name='GetImageAlphaBorder')
            import :: c_float, image_type, rectangle_type
            implicit none
            type(image_type),   intent(in), value :: image
            real(kind=c_float), intent(in), value :: threshold
            type(rectangle_type)                  :: get_image_alpha_border
        end function get_image_alpha_border

        ! Ray GetScreenToWorldRay(Vector2 position, Camera camera)
        function get_screen_to_world_ray(position, camera) bind(c, name='GetScreenToWorldRay')
            import :: camera2d_type, ray_type, vector2_type
            implicit none
            type(vector2_type),  intent(in), value :: position
            type(camera2d_type), intent(in), value :: camera
            type(ray_type)                         :: get_screen_to_world_ray
        end function get_screen_to_world_ray

        ! Ray GetScreenToWorldRayEx(Vector2 position, Camera camera, int width, int height)
        function get_screen_to_world_ray_ex(position, camera, width, height) bind(c, name='GetScreenToWorldRayEx')
            import :: c_int, camera2d_type, ray_type, vector2_type
            implicit none
            type(vector2_type) , intent(in), value :: position
            type(camera2d_type), intent(in), value :: camera
            integer(kind=c_int), intent(in), value :: width
            integer(kind=c_int), intent(in), value :: height
            type(ray_type)                         :: get_screen_to_world_ray_ex
        end function get_screen_to_world_ray_ex

        ! Vector2 GetSplinePointBasis(Vector2 p1, Vector2 p2, Vector2 p3, Vector2 p4, float t)
        function get_spline_point_basis(p1, p2, p3, p4, t) bind(c, name='GetSplinePointBasis')
            import :: c_float, vector2_type
            implicit none
            type(vector2_type), intent(in), value :: p1
            type(vector2_type), intent(in), value :: p2
            type(vector2_type), intent(in), value :: p3
            type(vector2_type), intent(in), value :: p4
            real(kind=c_float), intent(in), value :: t
            type(vector2_type)                    :: get_spline_point_basis
        end function get_spline_point_basis

        ! Vector2 GetSplinePointBezierCubic(Vector2 p1, Vector2 c2, Vector2 c3, Vector2 p4, float t)
        function get_spline_point_bezier_cubic(p1, c2, c3, p4, t) bind(c, name='GetSplinePointBezierCubic')
            import :: c_float, vector2_type
            implicit none
            type(vector2_type), intent(in), value :: p1
            type(vector2_type), intent(in), value :: c2
            type(vector2_type), intent(in), value :: c3
            type(vector2_type), intent(in), value :: p4
            real(kind=c_float), intent(in), value :: t
            type(vector2_type)                    :: get_spline_point_bezier_cubic
        end function get_spline_point_bezier_cubic

        ! Vector2 GetSplinePointBezierQuad(Vector2 p1, Vector2 c2, Vector2 p3, float t)
        function get_spline_point_bezier_quad(p1, c2, p3, t) bind(c, name='GetSplinePointBezierQuad')
            import :: c_float, vector2_type
            implicit none
            type(vector2_type), intent(in), value :: p1
            type(vector2_type), intent(in), value :: c2
            type(vector2_type), intent(in), value :: p3
            real(kind=c_float), intent(in), value :: t
            type(vector2_type)                    :: get_spline_point_bezier_quad
        end function get_spline_point_bezier_quad

        ! Vector2 GetSplinePointCatmullRom(Vector2 p1, Vector2 p2, Vector2 p3, Vector2 p4, float t)
        function get_spline_point_catmull_rom(p1, p2, p3, p4, t) bind(c, name='GetSplinePointCatmullRom')
            import :: c_float, vector2_type
            implicit none
            type(vector2_type), intent(in), value :: p1
            type(vector2_type), intent(in), value :: p2
            type(vector2_type), intent(in), value :: p3
            type(vector2_type), intent(in), value :: p4
            real(kind=c_float), intent(in), value :: t
            type(vector2_type)                    :: get_spline_point_catmull_rom
        end function get_spline_point_catmull_rom

        ! Vector2 GetSplinePointLinear(Vector2 startPos, Vector2 endPos, float t)
        function get_spline_point_linear(start_pos, end_pos, t) bind(c, name='GetSplinePointLinear')
            import :: c_float, vector2_type
            implicit none
            type(vector2_type), intent(in), value :: start_pos
            type(vector2_type), intent(in), value :: end_pos
            real(kind=c_float), intent(in), value :: t
            type(vector2_type)                    :: get_spline_point_linear
        end function get_spline_point_linear

        ! void ImageBlurGaussian(Image *image, int blurSize)
        subroutine image_blur_gaussian(image, blur_size) bind(c, name='ImageBlurGaussian')
            import :: c_int, image_type
            implicit none
            type(image_type),    intent(inout)     :: image
            integer(kind=c_int), intent(in), value :: blur_size
        end subroutine image_blur_gaussian

        ! Color GetImageColor(Image image, int x, int y)
        function get_image_color(image, x, y) bind(c, name='GetImageColor')
            import :: c_int, color_type, image_type
            implicit none
            type(image_type),    intent(in), value :: image
            integer(kind=c_int), intent(in), value :: x
            integer(kind=c_int), intent(in), value :: y
            type(color_type)                       :: get_image_color
        end function get_image_color

        ! int GetKeyPressed(void)
        function get_key_pressed() bind(c, name='GetKeyPressed')
            import :: c_int
            implicit none
            integer(kind=c_int) :: get_key_pressed
        end function get_key_pressed

        ! BoundingBox GetMeshBoundingBox(Mesh mesh)
        function get_mesh_bounding_box(mesh) bind(c, name='GetMeshBoundingBox')
            import :: bounding_box_type, mesh_type
            implicit none
            type(mesh_type), intent(in), value :: mesh
            type(bounding_box_type)            :: get_mesh_bounding_box
        end function get_mesh_bounding_box

        ! BoundingBox GetModelBoundingBox(Model model)
        function get_model_bounding_box(model) bind(c, name='GetModelBoundingBox')
            import :: bounding_box_type, model_type
            implicit none
            type(model_type), intent(in), value :: model
            type(bounding_box_type)             :: get_model_bounding_box
        end function get_model_bounding_box

        ! int GetMonitorCount(void)
        function get_monitor_count() bind(c, name='GetMonitorCount')
            import :: c_int
            implicit none
            integer(kind=c_int) :: get_monitor_count
        end function get_monitor_count

        ! int GetMonitorHeight(int monitor)
        function get_monitor_height(monitor) bind(c, name='GetMonitorHeight')
            import :: c_int
            implicit none
            integer(kind=c_int), intent(in), value :: monitor
            integer(kind=c_int)                    :: get_monitor_height
        end function get_monitor_height

        ! const char *GetMonitorName(int monitor)
        function get_monitor_name(monitor) bind(c, name='GetMonitorName')
            import :: c_int, c_ptr
            implicit none
            integer(kind=c_int), intent(in), value :: monitor
            type(c_ptr)                            :: get_monitor_name
        end function get_monitor_name

        ! int GetMonitorPhysicalHeight(int monitor)
        function get_monitor_physical_height(monitor) bind(c, name='GetMonitorPhysicalHeight')
            import :: c_int
            implicit none
            integer(kind=c_int), intent(in), value :: monitor
            integer(kind=c_int)                    :: get_monitor_physical_height
        end function get_monitor_physical_height

        ! int GetMonitorPhysicalWidth(int monitor)
        function get_monitor_physical_width(monitor) bind(c, name='GetMonitorPhysicalWidth')
            import :: c_int
            implicit none
            integer(kind=c_int), intent(in), value :: monitor
            integer(kind=c_int)                    :: get_monitor_physical_width
        end function get_monitor_physical_width

        ! int GetMonitorRefreshRate(int monitor)
        function get_monitor_refresh_rate(monitor) bind(c, name='GetMonitorRefreshRate')
            import :: c_int
            implicit none
            integer(kind=c_int), intent(in), value :: monitor
            integer(kind=c_int)                    :: get_monitor_refresh_rate
        end function get_monitor_refresh_rate

        ! int GetMonitorWidth(int monitor)
        function get_monitor_width(monitor) bind(c, name='GetMonitorWidth')
            import :: c_int
            implicit none
            integer(kind=c_int), intent(in), value :: monitor
            integer(kind=c_int)                    :: get_monitor_width
        end function get_monitor_width

        ! Vector2 GetMouseDelta(void)
        function get_mouse_delta() bind(c, name='GetMouseDelta')
            import :: vector2_type
            implicit none
            type(vector2_type) :: get_mouse_delta
        end function get_mouse_delta

        ! Vector2 GetMousePosition(void)
        function get_mouse_position() bind(c, name='GetMousePosition')
            import :: vector2_type
            implicit none
            type(vector2_type) :: get_mouse_position
        end function get_mouse_position

        ! float GetMouseWheelMove(void)
        function get_mouse_wheel_move() bind(c, name='GetMouseWheelMove')
            import :: c_float
            implicit none
            real(kind=c_float) :: get_mouse_wheel_move
        end function get_mouse_wheel_move

        ! int GetMouseX(void)
        function get_mouse_x() bind(c, name='GetMouseX')
            import :: c_int
            implicit none
            integer(kind=c_int) :: get_mouse_x
        end function get_mouse_x

        ! int GetMouseY(void)
        function get_mouse_y() bind(c, name='GetMouseY')
            import :: c_int
            implicit none
            integer(kind=c_int) :: get_mouse_y
        end function get_mouse_y

        ! float GetMusicTimeLength(Music music)
        function get_music_time_length(music) bind(c, name='GetMusicTimeLength')
            import :: c_float, music_type
            implicit none
            type(music_type), intent(in), value :: music
            real(kind=c_float)                  :: get_music_time_length
        end function get_music_time_length

        ! float GetMusicTimePlayed(Music music)
        function get_music_time_played(music) bind(c, name='GetMusicTimePlayed')
            import :: c_float, music_type
            implicit none
            type(music_type), intent(in), value :: music
            real(kind=c_float)                  :: get_music_time_played
        end function get_music_time_played

        ! Color GetPixelColor(void *srcPtr, int format)
        function get_pixel_color(src_ptr, format) bind(c, name='GetPixelColor')
            import :: c_int, c_ptr, color_type
            implicit none
            type(c_ptr),         intent(in), value :: src_ptr
            integer(kind=c_int), intent(in), value :: format
            type(color_type)                       :: get_pixel_color
        end function get_pixel_color

        ! int GetPixelDataSize(int width, int height, int format)
        function get_pixel_data_size(width, height, format) bind(c, name='GetPixelDataSize')
            import :: c_int
            implicit none
            integer(kind=c_int), intent(in), value :: width
            integer(kind=c_int), intent(in), value :: height
            integer(kind=c_int), intent(in), value :: format
            integer(kind=c_int)                    :: get_pixel_data_size
        end function get_pixel_data_size

        ! const char *GetPrevDirectoryPath(const char *dirPath)
        function get_prev_directory_path(dir_path) bind(c, name='GetPrevDirectoryPath')
            import :: c_char, c_ptr
            implicit none
            character(kind=c_char), intent(in) :: dir_path
            type(c_ptr)                        :: get_prev_directory_path
        end function get_prev_directory_path

        ! int GetRandomValue(int min, int max)
        function get_random_value(min, max) bind(c, name='GetRandomValue')
            import :: c_int
            implicit none
            integer(kind=c_int), intent(in), value :: min
            integer(kind=c_int), intent(in), value :: max
            integer(kind=c_int)                    :: get_random_value
        end function get_random_value

        ! RayCollision GetRayCollisionBox(Ray ray, BoundingBox box)
        function get_ray_collision_box(ray, box) bind(c, name='GetRayCollisionBox')
            import :: bounding_box_type, ray_collision_type, ray_type
            implicit none
            type(ray_type),          intent(in), value :: ray
            type(bounding_box_type), intent(in), value :: box
            type(ray_collision_type)                   :: get_ray_collision_box
        end function get_ray_collision_box

        ! RayCollision GetRayCollisionMesh(Ray ray, Mesh mesh, Matrix transform)
        function get_ray_collision_mesh(ray, mesh, transform) bind(c, name='GetRayCollisionMesh')
            import :: matrix_type, mesh_type, ray_collision_type, ray_type
            implicit none
            type(ray_type),    intent(in), value :: ray
            type(mesh_type),   intent(in), value :: mesh
            type(matrix_type), intent(in), value :: transform
            type(ray_collision_type)             :: get_ray_collision_mesh
        end function get_ray_collision_mesh

        ! RayCollision GetRayCollisionQuad(Ray ray, Vector3 p1, Vector3 p2, Vector3 p3, Vector3 p4)
        function get_ray_collision_quad(ray, p1, p2, p3, p4) bind(c, name='GetRayCollisionQuad')
            import :: ray_collision_type, ray_type, vector3_type
            implicit none
            type(ray_type),     intent(in), value :: ray
            type(vector3_type), intent(in), value :: p1
            type(vector3_type), intent(in), value :: p2
            type(vector3_type), intent(in), value :: p3
            type(vector3_type), intent(in), value :: p4
            type(ray_collision_type)              :: get_ray_collision_quad
        end function get_ray_collision_quad

        ! RayCollision GetRayCollisionSphere(Ray ray, Vector3 center, float radius)
        function get_ray_collision_sphere(ray, center, radius) bind(c, name='GetRayCollisionSphere')
            import :: c_float, ray_collision_type, ray_type, vector3_type
            implicit none
            type(ray_type),     intent(in), value :: ray
            type(vector3_type), intent(in), value :: center
            real(kind=c_float), intent(in), value :: radius
            type(ray_collision_type)              :: get_ray_collision_sphere
        end function get_ray_collision_sphere

        ! RayCollision GetRayCollisionTriangle(Ray ray, Vector3 p1, Vector3 p2, Vector3 p3)
        function get_ray_collision_triangle(ray, p1, p2, p3) bind(c, name='GetRayCollisionTriangle')
            import :: ray_collision_type, ray_type, vector3_type
            implicit none
            type(ray_type),     intent(in), value :: ray
            type(vector3_type), intent(in), value :: p1
            type(vector3_type), intent(in), value :: p2
            type(vector3_type), intent(in), value :: p3
            type(ray_collision_type)              :: get_ray_collision_triangle
        end function get_ray_collision_triangle

        ! int GetRenderHeight(void)
        function get_render_height() bind(c, name='GetRenderHeight')
            import :: c_int
            implicit none
            integer(kind=c_int) :: get_render_height
        end function get_render_height

        ! int GetRenderWidth(void)
        function get_render_width() bind(c, name='GetRenderWidth')
            import :: c_int
            implicit none
            integer(kind=c_int) :: get_render_width
        end function get_render_width

        ! int GetScreenHeight(void)
        function get_screen_height() bind(c, name='GetScreenHeight')
            import :: c_int
            implicit none
            integer(kind=c_int) :: get_screen_height
        end function get_screen_height

        ! Vector2 GetScreenToWorld2D(Vector2 position, Camera2D camera)
        function get_screen_to_world2d(position, camera) bind(c, name='GetScreenToWorld2D')
            import :: camera2d_type, vector2_type
            implicit none
            type(vector2_type),  intent(in), value :: position
            type(camera2d_type), intent(in), value :: camera
            type(vector2_type)                     :: get_screen_to_world2d
        end function get_screen_to_world2d

        ! int GetScreenWidth(void)
        function get_screen_width() bind(c, name='GetScreenWidth')
            import :: c_int
            implicit none
            integer(kind=c_int) :: get_screen_width
        end function get_screen_width

        ! int GetShaderLocation(Shader shader, const char *uniformName)
        function get_shader_location(shader, uniform_name) bind(c, name='GetShaderLocation')
            import :: c_char, c_int, shader_type
            implicit none
            type(shader_type),      intent(in), value :: shader
            character(kind=c_char), intent(in)        :: uniform_name
            integer(kind=c_int)                       :: get_shader_location
        end function get_shader_location

        ! int GetShaderLocationAttrib(Shader shader, const char *attribName)
        function get_shader_location_attrib(shader, attrib_name) bind(c, name='GetShaderLocationAttrib')
            import :: c_char, c_int, shader_type
            implicit none
            type(shader_type),      intent(in), value :: shader
            character(kind=c_char), intent(in)        :: attrib_name
            integer(kind=c_int)                       :: get_shader_location_attrib
        end function get_shader_location_attrib

        ! double GetTime(void)
        function get_time() bind(c, name='GetTime')
            import :: c_double
            implicit none
            real(kind=c_double) :: get_time
        end function get_time

        ! int GetTouchPointCount(void)
        function get_touch_point_count() bind(c, name='GetTouchPointCount')
            import :: c_int
            implicit none
            integer(kind=c_int) :: get_touch_point_count
        end function get_touch_point_count

        ! int GetTouchPointId(int index)
        function get_touch_point_id(index) bind(c, name='GetTouchPointId')
            import :: c_int
            implicit none
            integer(kind=c_int), intent(in), value :: index
            integer(kind=c_int)                    :: get_touch_point_id
        end function get_touch_point_id

        ! int GetTouchX(void)
        function get_touch_x() bind(c, name='GetTouchX')
            import :: c_int
            implicit none
            integer(kind=c_int) :: get_touch_x
        end function get_touch_x

        ! int GetTouchY(void)
        function get_touch_y() bind(c, name='GetTouchY')
            import :: c_int
            implicit none
            integer(kind=c_int) :: get_touch_y
        end function get_touch_y

        ! void *GetWindowHandle(void)
        function get_window_handle() bind(c, name='GetWindowHandle')
            import :: c_ptr
            implicit none
            type(c_ptr) :: get_window_handle
        end function get_window_handle

        ! const char *GetWorkingDirectory(void)
        function get_working_directory() bind(c, name='GetWorkingDirectory')
            import :: c_ptr
            implicit none
            type(c_ptr) :: get_working_directory
        end function get_working_directory

        ! Vector2 GetWorldToScreen2D(Vector2 position, Camera2D camera)
        function get_world_to_screen2d(position, camera) bind(c, name='GetWorldToScreen2D')
            import :: camera2d_type, vector2_type
            implicit none
            type(vector2_type),  intent(in), value :: position
            type(camera2d_type), intent(in), value :: camera
            type(vector2_type)                     :: get_world_to_screen2d
        end function get_world_to_screen2d

        ! void HideCursor(void)
        subroutine hide_cursor() bind(c, name='HideCursor')
        end subroutine hide_cursor

        ! void ImageAlphaClear(Image *image, Color color, float threshold)
        subroutine image_alpha_clear(image, color, threshold) bind(c, name='ImageAlphaClear')
            import :: c_float, color_type, image_type
            implicit none
            type(image_type),   intent(inout)     :: image
            type(color_type),   intent(in), value :: color
            real(kind=c_float), intent(in), value :: threshold
        end subroutine image_alpha_clear

        ! void ImageAlphaCrop(Image *image, float threshold)
        subroutine image_alpha_crop(image, threshold) bind(c, name='ImageAlphaCrop')
            import :: c_float, image_type
            implicit none
            type(image_type),   intent(inout)     :: image
            real(kind=c_float), intent(in), value :: threshold
        end subroutine image_alpha_crop

        ! void ImageAlphaMask(Image *image, Image alphaMask)
        subroutine image_alpha_mask(image, alpha_mask) bind(c, name='ImageAlphaMask')
            import :: image_type
            implicit none
            type(image_type), intent(inout)     :: image
            type(image_type), intent(in), value :: alpha_mask
        end subroutine image_alpha_mask

        ! void ImageAlphaPremultiply(Image *image)
        subroutine image_alpha_premultiply(image) bind(c, name='ImageAlphaPremultiply')
            import :: image_type
            implicit none
            type(image_type), intent(inout) :: image
        end subroutine image_alpha_premultiply

        ! void ImageClearBackground(Image *dst, Color color)
        subroutine image_clear_background(dst, color) bind(c, name='ImageClearBackground')
            import :: color_type, image_type
            implicit none
            type(image_type), intent(inout)     :: dst
            type(color_type), intent(in), value :: color
        end subroutine image_clear_background

        ! void ImageColorBrightness(Image *image, int brightness)
        subroutine image_color_brightness(image, brightness) bind(c, name='ImageColorBrightness')
            import :: c_int, image_type
            implicit none
            type(image_type),    intent(inout)     :: image
            integer(kind=c_int), intent(in), value :: brightness
        end subroutine image_color_brightness

        ! void ImageColorContrast(Image *image, float contrast)
        subroutine image_color_contrast(image, contrast) bind(c, name='ImageColorContrast')
            import :: c_float, image_type
            implicit none
            type(image_type),   intent(inout)     :: image
            real(kind=c_float), intent(in), value :: contrast
        end subroutine image_color_contrast

        ! void ImageColorGrayscale(Image *image)
        subroutine image_color_grayscale(image) bind(c, name='ImageColorGrayscale')
            import :: image_type
            implicit none
            type(image_type), intent(inout) :: image
        end subroutine image_color_grayscale

        ! void ImageColorInvert(Image *image)
        subroutine image_color_invert(image) bind(c, name='ImageColorInvert')
            import :: image_type
            implicit none
            type(image_type), intent(inout) :: image
        end subroutine image_color_invert

        ! void ImageColorReplace(Image *image, Color color, Color replace)
        subroutine image_color_replace(image, color, replace) bind(c, name='ImageColorReplace')
            import :: color_type, image_type
            implicit none
            type(image_type), intent(inout)     :: image
            type(color_type), intent(in), value :: color
            type(color_type), intent(in), value :: replace
        end subroutine image_color_replace

        ! void ImageColorTint(Image *image, Color color)
        subroutine image_color_tint(image, color) bind(c, name='ImageColorTint')
            import :: color_type, image_type
            implicit none
            type(image_type), intent(inout)     :: image
            type(color_type), intent(in), value :: color
        end subroutine image_color_tint

        ! Image ImageCopy(Image image)
        function image_copy(image) bind(c, name='ImageCopy')
            import :: image_type
            implicit none
            type(image_type), intent(in), value :: image
            type(image_type)                    :: image_copy
        end function image_copy

        ! void ImageCrop(Image *image, Rectangle crop)
        subroutine image_crop(image, crop) bind(c, name='ImageCrop')
            import :: image_type, rectangle_type
            implicit none
            type(image_type),     intent(inout)     :: image
            type(rectangle_type), intent(in), value :: crop
        end subroutine image_crop

        ! void ImageDither(Image *image, int rBpp, int gBpp, int bBpp, int aBpp)
        subroutine image_dither(image, r_bpp, g_bpp, b_bpp, a_bpp) bind(c, name='ImageDither')
            import :: c_int, image_type
            implicit none
            type(image_type),    intent(inout)     :: image
            integer(kind=c_int), intent(in), value :: r_bpp
            integer(kind=c_int), intent(in), value :: g_bpp
            integer(kind=c_int), intent(in), value :: b_bpp
            integer(kind=c_int), intent(in), value :: a_bpp
        end subroutine image_dither

        ! void ImageDraw(Image *dst, Image src, Rectangle srcRec, Rectangle dstRec, Color tint)
        subroutine image_draw(dst, src, src_rec, dst_rec, tint) bind(c, name='ImageDraw')
            import :: color_type, image_type, rectangle_type
            implicit none
            type(image_type),     intent(inout)     :: dst
            type(image_type),     intent(in), value :: src
            type(rectangle_type), intent(in), value :: src_rec
            type(rectangle_type), intent(in), value :: dst_rec
            type(color_type),     intent(in), value :: tint
        end subroutine image_draw

        ! void ImageDrawCircle(Image *dst, int centerX, int centerY, int radius, Color color)
        subroutine image_draw_circle(dst, center_x, center_y, radius, color) bind(c, name='ImageDrawCircle')
            import :: c_int, color_type, image_type
            implicit none
            type(image_type),    intent(inout)     :: dst
            integer(kind=c_int), intent(in), value :: center_x
            integer(kind=c_int), intent(in), value :: center_y
            integer(kind=c_int), intent(in), value :: radius
            type(color_type),    intent(in), value :: color
        end subroutine image_draw_circle

        ! void ImageDrawCircleLines(Image *dst, int centerX, int centerY, int radius, Color color)
        subroutine image_draw_circle_lines(dst, center_x, center_y, radius, color) bind(c, name='ImageDrawCircleLines')
            import :: c_int, color_type, image_type
            implicit none
            type(image_type),    intent(inout)     :: dst
            integer(kind=c_int), intent(in), value :: center_x
            integer(kind=c_int), intent(in), value :: center_y
            integer(kind=c_int), intent(in), value :: radius
            type(color_type),    intent(in), value :: color
        end subroutine image_draw_circle_lines

        ! void ImageDrawCircleLinesV(Image *dst, Vector2 center, int radius, Color color)
        subroutine image_draw_circle_lines_v(dst, center, radius, color) bind(c, name='ImageDrawCircleLinesV')
            import :: c_int, color_type, image_type, vector2_type
            implicit none
            type(image_type),    intent(inout)     :: dst
            type(vector2_type),  intent(in), value :: center
            integer(kind=c_int), intent(in), value :: radius
            type(color_type),    intent(in), value :: color
        end subroutine image_draw_circle_lines_v

        ! void ImageDrawCircleV(Image *dst, Vector2 center, int radius, Color color)
        subroutine image_draw_circle_v(dst, center, radius, color) bind(c, name='ImageDrawCircleV')
            import :: c_int, color_type, image_type, vector2_type
            implicit none
            type(image_type),    intent(inout)     :: dst
            type(vector2_type),  intent(in), value :: center
            integer(kind=c_int), intent(in), value :: radius
            type(color_type),    intent(in), value :: color
        end subroutine image_draw_circle_v

        ! void ImageDrawLine(Image *dst, int startPosX, int startPosY, int endPosX, int endPosY, Color color)
        subroutine image_draw_line(dst, start_pos_x, start_pos_y, end_pos_x, end_pos_y, color) &
                bind(c, name='ImageDrawLine')
            import :: c_int, color_type, image_type
            implicit none
            type(image_type),    intent(inout)     :: dst
            integer(kind=c_int), intent(in), value :: start_pos_x
            integer(kind=c_int), intent(in), value :: start_pos_y
            integer(kind=c_int), intent(in), value :: end_pos_x
            integer(kind=c_int), intent(in), value :: end_pos_y
            type(color_type),    intent(in), value :: color
        end subroutine image_draw_line

        ! void ImageDrawLineEx(Image *dst, Vector2 start, Vector2 end, int thick, Color color)
        subroutine image_draw_line_ex(dst, start, end, thick, color) bind(c, name='ImageDrawLineEx')
            import :: c_int, color_type, image_type, vector2_type
            implicit none
            type(image_type),    intent(inout)     :: dst
            type(vector2_type),  intent(in), value :: start
            type(vector2_type),  intent(in), value :: end
            integer(kind=c_int), intent(in), value :: thick
            type(color_type),    intent(in), value :: color
        end subroutine image_draw_line_ex

        ! void ImageDrawLineV(Image *dst, Vector2 start, Vector2 end, Color color)
        subroutine image_draw_line_v(dst, start, end, color) bind(c, name='ImageDrawLineV')
            import :: color_type, image_type, vector2_type
            implicit none
            type(image_type),   intent(inout)     :: dst
            type(vector2_type), intent(in), value :: start
            type(vector2_type), intent(in), value :: end
            type(color_type)  , intent(in), value :: color
        end subroutine image_draw_line_v

        ! void ImageDrawPixel(Image *dst, int posX, int posY, Color color)
        subroutine image_draw_pixel(dst, pos_x, pos_y, color) bind(c, name='ImageDrawPixel')
            import :: c_int, color_type, image_type
            implicit none
            type(image_type),    intent(inout)     :: dst
            integer(kind=c_int), intent(in), value :: pos_x
            integer(kind=c_int), intent(in), value :: pos_y
            type(color_type),    intent(in), value :: color
        end subroutine image_draw_pixel

        ! void ImageDrawPixelV(Image *dst, Vector2 position, Color color)
        subroutine image_draw_pixel_v(dst, position, color) bind(c, name='ImageDrawPixelV')
            import :: color_type, image_type, vector2_type
            implicit none
            type(image_type),   intent(inout)     :: dst
            type(vector2_type), intent(in), value :: position
            type(color_type),   intent(in), value :: color
        end subroutine image_draw_pixel_v

        ! void ImageDrawRectangle(Image *dst, int posX, int posY, int width, int height, Color color)
        subroutine image_draw_rectangle(dst, pos_x, pos_y, width, height, color) bind(c, name='ImageDrawRectangle')
            import :: c_int, color_type, image_type
            implicit none
            type(image_type),    intent(inout)     :: dst
            integer(kind=c_int), intent(in), value :: pos_x
            integer(kind=c_int), intent(in), value :: pos_y
            integer(kind=c_int), intent(in), value :: width
            integer(kind=c_int), intent(in), value :: height
            type(color_type),    intent(in), value :: color
        end subroutine image_draw_rectangle

        ! void ImageDrawRectangleLines(Image *dst, Rectangle rec, int thick, Color color)
        subroutine image_draw_rectangle_lines(dst, rec, thick, color) bind(c, name='ImageDrawRectangleLines')
            import :: c_int, color_type, image_type, rectangle_type
            implicit none
            type(image_type),     intent(inout)     :: dst
            type(rectangle_type), intent(in), value :: rec
            integer(kind=c_int),  intent(in), value :: thick
            type(color_type),     intent(in), value :: color
        end subroutine image_draw_rectangle_lines

        ! void ImageDrawRectangleRec(Image *dst, Rectangle rec, Color color)
        subroutine image_draw_rectangle_rec(dst, rec, color) bind(c, name='ImageDrawRectangleRec')
            import :: color_type, image_type, rectangle_type
            implicit none
            type(image_type),     intent(inout)     :: dst
            type(rectangle_type), intent(in), value :: rec
            type(color_type),     intent(in), value :: color
        end subroutine image_draw_rectangle_rec

        ! void ImageDrawRectangleV(Image *dst, Vector2 position, Vector2 size, Color color)
        subroutine image_draw_rectangle_v(dst, position, size, color) bind(c, name='ImageDrawRectangleV')
            import :: color_type, image_type, vector2_type
            implicit none
            type(image_type),   intent(inout)     :: dst
            type(vector2_type), intent(in), value :: position
            type(vector2_type), intent(in), value :: size
            type(color_type),   intent(in), value :: color
        end subroutine image_draw_rectangle_v

        ! void ImageDrawText(Image *dst, const char *text, int posX, int posY, int fontSize, Color color)
        subroutine image_draw_text(dst, text, pos_x, pos_y, font_size, color) bind(c, name='ImageDrawText')
            import :: c_char, c_int, color_type, image_type
            implicit none
            type(image_type),       intent(inout)     :: dst
            character(kind=c_char), intent(in)        :: text
            integer(kind=c_int),    intent(in), value :: pos_x
            integer(kind=c_int),    intent(in), value :: pos_y
            integer(kind=c_int),    intent(in), value :: font_size
            type(color_type),       intent(in), value :: color
        end subroutine image_draw_text

        ! void ImageDrawTextEx(Image *dst, Font font, const char *text, Vector2 position, float fontSize, float spacing, Color tint)
        subroutine image_draw_text_ex(dst, font, text, position, font_size, spacing, tint) bind(c, name='ImageDrawTextEx')
            import :: c_char, c_float, color_type, font_type, image_type, vector2_type
            implicit none
            type(image_type),       intent(inout)     :: dst
            type(font_type),        intent(in), value :: font
            character(kind=c_char), intent(in)        :: text
            type(vector2_type),     intent(in), value :: position
            real(kind=c_float),     intent(in), value :: font_size
            real(kind=c_float),     intent(in), value :: spacing
            type(color_type),       intent(in), value :: tint
        end subroutine image_draw_text_ex

        ! void ImageDrawTriangle(Image *dst, Vector2 v1, Vector2 v2, Vector2 v3, Color color)
        subroutine image_draw_triangle(dst, v1, v2, v3, color) bind(c, name='ImageDrawTriangle')
            import :: color_type, image_type, vector2_type
            implicit none
            type(image_type),   intent(inout)     :: dst
            type(vector2_type), intent(in), value :: v1
            type(vector2_type), intent(in), value :: v2
            type(vector2_type), intent(in), value :: v3
            type(color_type),   intent(in), value :: color
        end subroutine image_draw_triangle

        ! void ImageDrawTriangleEx(Image *dst, Vector2 v1, Vector2 v2, Vector2 v3, Color c1, Color c2, Color c3)
        subroutine image_draw_triangle_ex(dst, v1, v2, v3, c1, c2, c3) bind(c, name='ImageDrawTriangleEx')
            import :: color_type, image_type, vector2_type
            implicit none
            type(image_type),   intent(inout)     :: dst
            type(vector2_type), intent(in), value :: v1
            type(vector2_type), intent(in), value :: v2
            type(vector2_type), intent(in), value :: v3
            type(color_type),   intent(in), value :: c1
            type(color_type),   intent(in), value :: c2
            type(color_type),   intent(in), value :: c3
        end subroutine image_draw_triangle_ex

        ! void ImageDrawTriangleFan(Image *dst, Vector2 *points, int pointCount, Color color)
        subroutine image_draw_triangle_fan(dst, points, point_count, color) bind(c, name='ImageDrawTriangleFan')
            import :: c_int, color_type, image_type, vector2_type
            implicit none
            type(image_type),    intent(inout)     :: dst
            type(vector2_type),  intent(inout)     :: points
            integer(kind=c_int), intent(in), value :: point_count
            type(color_type),    intent(in), value :: color
        end subroutine image_draw_triangle_fan

        ! void ImageDrawTriangleLines(Image *dst, Vector2 v1, Vector2 v2, Vector2 v3, Color color)
        subroutine image_draw_triangle_lines(dst, v1, v2, v3, color) bind(c, name='ImageDrawTriangleLines')
            import :: color_type, image_type, vector2_type
            implicit none
            type(image_type),   intent(inout)     :: dst
            type(vector2_type), intent(in), value :: v1
            type(vector2_type), intent(in), value :: v2
            type(vector2_type), intent(in), value :: v3
            type(color_type),   intent(in), value :: color
        end subroutine image_draw_triangle_lines

        ! void ImageDrawTriangleStrip(Image *dst, Vector2 *points, int pointCount, Color color)
        subroutine image_draw_triangle_strip(dst, points, point_count, color) bind(c, name='ImageDrawTriangleStrip')
            import :: c_int, color_type, image_type, vector2_type
            implicit none
            type(image_type),    intent(inout)     :: dst
            type(vector2_type),  intent(inout)     :: points
            integer(kind=c_int), intent(in), value :: point_count
            type(color_type),    intent(in), value :: color
        end subroutine image_draw_triangle_strip

        ! void ImageFlipHorizontal(Image *image)
        subroutine image_flip_horizontal(image) bind(c, name='ImageFlipHorizontal')
            import :: image_type
            implicit none
            type(image_type), intent(inout) :: image
        end subroutine image_flip_horizontal

        ! void ImageFlipVertical(Image *image)
        subroutine image_flip_vertical(image) bind(c, name='ImageFlipVertical')
            import :: image_type
            implicit none
            type(image_type), intent(inout) :: image
        end subroutine image_flip_vertical

        ! void ImageFormat(Image *image, int newFormat)
        subroutine image_format(image, new_format) bind(c, name='ImageFormat')
            import :: c_int, image_type
            implicit none
            type(image_type),    intent(inout)     :: image
            integer(kind=c_int), intent(in), value :: new_format
        end subroutine image_format

        ! Image ImageFromImage(Image image, Rectangle rec)
        function image_from_image(image, rec) bind(c, name='ImageFromImage')
            import :: image_type, rectangle_type
            implicit none
            type(image_type),     intent(in), value :: image
            type(rectangle_type), intent(in), value :: rec
            type(image_type)                        :: image_from_image
        end function image_from_image

        ! Image ImageFromChannel(Image image, int selectedChannel)
        function image_from_channel(image, selected_channel) bind(c, name='ImageFromChannel')
            import :: c_int, image_type
            implicit none
            type(image_type),    intent(in), value :: image
            integer(kind=c_int), intent(in), value :: selected_channel
            type(image_type)                       :: image_from_channel
        end function image_from_channel

        ! void ImageKernelConvolution(Image *image, const float *kernel, int kernelSize)
        subroutine image_kernel_convolution(image, kernel, kernel_size) bind(c, name='ImageKernelConvolution')
            import :: c_float, c_int, image_type
            implicit none
            type(image_type),    intent(inout)     :: image
            real(kind=c_float),  intent(inout)     :: kernel(*)
            integer(kind=c_int), intent(in), value :: kernel_size
        end subroutine image_kernel_convolution

        ! void ImageMipmaps(Image *image)
        subroutine image_mipmaps(image) bind(c, name='ImageMipmaps')
            import :: image_type
            implicit none
            type(image_type), intent(inout) :: image
        end subroutine image_mipmaps

        ! void ImageResize(Image *image, int newWidth, int newHeight)
        subroutine image_resize(image, new_width, new_height) bind(c, name='ImageResize')
            import :: c_int, image_type
            implicit none
            type(image_type),    intent(inout)     :: image
            integer(kind=c_int), intent(in), value :: new_width
            integer(kind=c_int), intent(in), value :: new_height
        end subroutine image_resize

        ! void ImageResizeCanvas(Image *image, int newWidth, int newHeight, int offsetX, int offsetY, Color fill)
        subroutine image_resize_canvas(image, new_width, new_height, offset_x, offset_y, fill) bind(c, name='ImageResizeCanvas')
            import :: c_int, color_type, image_type
            implicit none
            type(image_type),    intent(inout)     :: image
            integer(kind=c_int), intent(in), value :: new_width
            integer(kind=c_int), intent(in), value :: new_height
            integer(kind=c_int), intent(in), value :: offset_x
            integer(kind=c_int), intent(in), value :: offset_y
            type(color_type),    intent(in), value :: fill
        end subroutine image_resize_canvas

        ! void ImageResizeNN(Image *image, int newWidth,int newHeight)
        subroutine image_resize_nn(image, new_width, new_height) bind(c, name='ImageResizeNN')
            import :: c_int, image_type
            implicit none
            type(image_type),    intent(inout)     :: image
            integer(kind=c_int), intent(in), value :: new_width
            integer(kind=c_int), intent(in), value :: new_height
        end subroutine image_resize_nn

        ! void ImageRotate(Image *image, int degrees)
        subroutine image_rotate(image, degrees) bind(c, name='ImageRotate')
            import :: c_int, image_type
            implicit none
            type(image_type),    intent(inout)     :: image
            integer(kind=c_int), intent(in), value :: degrees
        end subroutine image_rotate

        ! void ImageRotateCCW(Image *image)
        subroutine image_rotate_ccw(image) bind(c, name='ImageRotateCCW')
            import :: image_type
            implicit none
            type(image_type), intent(inout) :: image
        end subroutine image_rotate_ccw

        ! void ImageRotateCW(Image *image)
        subroutine image_rotate_cw(image) bind(c, name='ImageRotateCW')
            import :: image_type
            implicit none
            type(image_type), intent(inout) :: image
        end subroutine image_rotate_cw

        ! Image ImageText(const char *text, int fontSize, Color color)
        function image_text(text, font_size, color) bind(c, name='ImageText')
            import :: c_char, c_int, color_type, image_type
            implicit none
            character(kind=c_char), intent(in)        :: text
            integer(kind=c_int),    intent(in), value :: font_size
            type(color_type),       intent(in), value :: color
            type(image_type)                          :: image_text
        end function image_text

        ! Image ImageTextEx(Font font, const char *text, float fontSize, float spacing, Color tint)
        function image_text_ex(font, text, font_size, spacing, tint) bind(c, name='ImageTextEx')
            import :: c_char, c_float, color_type, font_type, image_type
            implicit none
            type(font_type),        intent(in), value :: font
            character(kind=c_char), intent(in)        :: text
            real(kind=c_float),     intent(in), value :: font_size
            real(kind=c_float),     intent(in), value :: spacing
            type(color_type),       intent(in), value :: tint
            type(image_type)                          :: image_text_ex
        end function image_text_ex

        ! void ImageToPOT(Image *image, Color fill)
        subroutine image_to_pot(image, fill) bind(c, name='ImageToPOT')
            import :: color_type, image_type
            implicit none
            type(image_type), intent(inout)     :: image
            type(color_type), intent(in), value :: fill
        end subroutine image_to_pot

        ! void InitAudioDevice(void)
        subroutine init_audio_device() bind(c, name='InitAudioDevice')
        end subroutine init_audio_device

        ! void InitWindow(int width, int height, const char *title)
        subroutine init_window(width, height, title) bind(c, name='InitWindow')
            import :: c_char, c_int
            implicit none
            integer(kind=c_int),    intent(in), value :: width
            integer(kind=c_int),    intent(in), value :: height
            character(kind=c_char), intent(in)        :: title
        end subroutine init_window

        ! bool IsAudioDeviceReady(void)
        function is_audio_device_ready() bind(c, name='IsAudioDeviceReady')
            import :: c_bool
            implicit none
            logical(kind=c_bool) :: is_audio_device_ready
        end function is_audio_device_ready

        ! bool IsAudioStreamPlaying(AudioStream stream)
        function is_audio_stream_playing(stream) bind(c, name='IsAudioStreamPlaying')
            import :: audio_stream_type, c_bool
            implicit none
            type(audio_stream_type), intent(in), value :: stream
            logical(kind=c_bool)                       :: is_audio_stream_playing
        end function is_audio_stream_playing

        ! bool IsAudioStreamProcessed(AudioStream stream)
        function is_audio_stream_processed(stream) bind(c, name='IsAudioStreamProcessed')
            import :: audio_stream_type, c_bool
            implicit none
            type(audio_stream_type), intent(in), value :: stream
            logical(kind=c_bool)                       :: is_audio_stream_processed
        end function is_audio_stream_processed

        ! bool IsAudioStreamReady(AudioStream stream)
        function is_audio_stream_ready(stream) bind(c, name='IsAudioStreamReady')
            import :: audio_stream_type, c_bool
            implicit none
            type(audio_stream_type), intent(in), value :: stream
            logical(kind=c_bool)                       :: is_audio_stream_ready
        end function is_audio_stream_ready

        ! bool IsCursorHidden(void)
        function is_cursor_hidden() bind(c, name='IsCursorHidden')
            import :: c_bool
            implicit none
            logical(kind=c_bool) :: is_cursor_hidden
        end function is_cursor_hidden

        ! bool IsCursorOnScreen(void)
        function is_cursor_on_screen() bind(c, name='IsCursorOnScreen')
            import :: c_bool
            implicit none
            logical(kind=c_bool) :: is_cursor_on_screen
        end function is_cursor_on_screen

        ! bool IsFileDropped(void)
        function is_file_dropped() bind(c, name='IsFileDropped')
            import :: c_bool
            implicit none
            logical(kind=c_bool) :: is_file_dropped
        end function is_file_dropped

        ! bool IsFileExtension(const char *fileName, const char *ext)
        function is_file_extension(file_name, ext) bind(c, name='IsFileExtension')
            import :: c_bool, c_char
            implicit none
            character(kind=c_char), intent(in) :: file_name
            character(kind=c_char), intent(in) :: ext
            logical(kind=c_bool)               :: is_file_extension
        end function is_file_extension

        ! bool IsFileNameValid(const char *fileName)
        function is_file_name_valid(file_name) bind(c, name='IsFileNameValid')
            import :: c_bool, c_char
            implicit none
            character(kind=c_char), intent(in) :: file_name
            logical(kind=c_bool)               :: is_file_name_valid
        end function is_file_name_valid

        ! bool IsFontReady(Font font)
        function is_font_ready(font) bind(c, name='IsFontReady')
            import :: c_bool, font_type
            implicit none
            type(font_type), intent(in), value :: font
            logical(kind=c_bool)               :: is_font_ready
        end function is_font_ready

        ! bool IsGamepadAvailable(int gamepad)
        function is_gamepad_available(gamepad) bind(c, name='IsGamepadAvailable')
            import :: c_bool, c_int
            implicit none
            integer(kind=c_int), intent(in), value :: gamepad
            logical(kind=c_bool)                   :: is_gamepad_available
        end function is_gamepad_available

        ! bool IsGamepadButtonDown(int gamepad, int button)
        function is_gamepad_button_down(gamepad, button) bind(c, name='IsGamepadButtonDown')
            import :: c_bool, c_int
            implicit none
            integer(kind=c_int), intent(in), value :: gamepad
            integer(kind=c_int), intent(in), value :: button
            logical(kind=c_bool)                   :: is_gamepad_button_down
        end function is_gamepad_button_down

        ! bool IsGamepadButtonPressed(int gamepad, int button)
        function is_gamepad_button_pressed(gamepad, button) bind(c, name='IsGamepadButtonPressed')
            import :: c_bool, c_int
            implicit none
            integer(kind=c_int), intent(in), value :: gamepad
            integer(kind=c_int), intent(in), value :: button
            logical(kind=c_bool)                   :: is_gamepad_button_pressed
        end function is_gamepad_button_pressed

        ! bool IsGamepadButtonReleased(int gamepad, int button)
        function is_gamepad_button_released(gamepad, button) bind(c, name='IsGamepadButtonReleased')
            import :: c_bool, c_int
            implicit none
            integer(kind=c_int), intent(in), value :: gamepad
            integer(kind=c_int), intent(in), value :: button
            logical(kind=c_bool)                   :: is_gamepad_button_released
        end function is_gamepad_button_released

        ! bool IsGamepadButtonUp(int gamepad, int button)
        function is_gamepad_button_up(gamepad, button) bind(c, name='IsGamepadButtonUp')
            import :: c_bool, c_int
            implicit none
            integer(kind=c_int), intent(in), value :: gamepad
            integer(kind=c_int), intent(in), value :: button
            logical(kind=c_bool)                   :: is_gamepad_button_up
        end function is_gamepad_button_up

        ! bool IsGestureDetected(unsigned int gesture)
        function is_gesture_detected(gesture) bind(c, name='IsGestureDetected')
            import :: c_bool, c_unsigned_int
            implicit none
            integer(kind=c_unsigned_int), intent(in), value :: gesture
            logical(kind=c_bool)                            :: is_gesture_detected
        end function is_gesture_detected

        ! bool IsImageReady(Image image)
        function is_image_ready(image) bind(c, name='IsImageReady')
            import :: c_bool, image_type
            implicit none
            type(image_type), intent(in), value :: image
            logical(kind=c_bool)                :: is_image_ready
        end function is_image_ready

        ! bool IsKeyDown(int key)
        function is_key_down(key) bind(c, name='IsKeyDown')
            import :: c_bool, c_int
            implicit none
            integer(kind=c_int), intent(in), value :: key
            logical(kind=c_bool)                   :: is_key_down
        end function is_key_down

        ! bool IsKeyPressed(int key)
        function is_key_pressed(key) bind(c, name='IsKeyPressed')
            import :: c_bool, c_int
            implicit none
            integer(kind=c_int), intent(in), value :: key
            logical(kind=c_bool)                   :: is_key_pressed
        end function is_key_pressed

        ! bool IsKeyPressedRepeat(int key)
        function is_key_pressed_repeat(key) bind(c, name='IsKeyPressedRepeat')
            import :: c_bool, c_int
            implicit none
            integer(kind=c_int), intent(in), value :: key
            logical(kind=c_bool)                   :: is_key_pressed_repeat
        end function is_key_pressed_repeat

        ! bool IsKeyReleased(int key)
        function is_key_released(key) bind(c, name='IsKeyReleased')
            import :: c_bool, c_int
            implicit none
            integer(kind=c_int), intent(in), value :: key
            logical(kind=c_bool)                   :: is_key_released
        end function is_key_released

        ! bool IsKeyUp(int key)
        function is_key_up(key) bind(c, name='IsKeyUp')
            import :: c_bool, c_int
            implicit none
            integer(kind=c_int), intent(in), value :: key
            logical(kind=c_bool)                   :: is_key_up
        end function is_key_up

        ! bool IsMaterialReady(Material material)
        function is_material_ready(material) bind(c, name='IsMaterialReady')
            import :: c_bool, material_type
            implicit none
            type(material_type), intent(in), value :: material
            logical(kind=c_bool)                   :: is_material_ready
        end function is_material_ready

        ! bool IsModelAnimationValid(Model model, ModelAnimation anim)
        function is_model_animation_valid(model, anim) bind(c, name='IsModelAnimationValid')
            import :: c_bool, model_animation_type, model_type
            implicit none
            type(model_type),           intent(in), value :: model
            type(model_animation_type), intent(in), value :: anim
            logical(kind=c_bool)                          :: is_model_animation_valid
        end function is_model_animation_valid

        ! bool IsModelReady(Model model)
        function is_model_ready(model) bind(c, name='IsModelReady')
            import :: c_bool, model_type
            implicit none
            type(model_type), intent(in), value :: model
            logical(kind=c_bool)                :: is_model_ready
        end function is_model_ready

        ! bool IsMouseButtonDown(int button)
        function is_mouse_button_down(button) bind(c, name='IsMouseButtonDown')
            import :: c_bool, c_int
            implicit none
            integer(kind=c_int), intent(in), value :: button
            logical(kind=c_bool)                   :: is_mouse_button_down
        end function is_mouse_button_down

        ! bool IsMouseButtonPressed(int button)
        function is_mouse_button_pressed(button) bind(c, name='IsMouseButtonPressed')
            import :: c_bool, c_int
            implicit none
            integer(kind=c_int), intent(in), value :: button
            logical(kind=c_bool)                   :: is_mouse_button_pressed
        end function is_mouse_button_pressed

        ! bool IsMouseButtonReleased(int button)
        function is_mouse_button_released(button) bind(c, name='IsMouseButtonReleased')
            import :: c_bool, c_int
            implicit none
            integer(kind=c_int), intent(in), value :: button
            logical(kind=c_bool)                   :: is_mouse_button_released
        end function is_mouse_button_released

        ! bool IsMouseButtonUp(int button)
        function is_mouse_button_up(button) bind(c, name='IsMouseButtonUp')
            import :: c_bool, c_int
            implicit none
            integer(kind=c_int), intent(in), value :: button
            logical(kind=c_bool)                   :: is_mouse_button_up
        end function is_mouse_button_up

        ! bool IsMusicReady(Music music)
        function is_music_ready(music) bind(c, name='IsMusicReady')
            import :: c_bool, music_type
            implicit none
            type(music_type), intent(in), value :: music
            logical(kind=c_bool)                :: is_music_ready
        end function is_music_ready

        ! bool IsMusicStreamPlaying(Music music)
        function is_music_stream_playing(music) bind(c, name='IsMusicStreamPlaying')
            import :: c_bool, music_type
            implicit none
            type(music_type), intent(in), value :: music
            logical(kind=c_bool)                :: is_music_stream_playing
        end function is_music_stream_playing

        ! bool IsPathFile(const char *path)
        function is_path_file(path) bind(c, name='IsPathFile')
            import :: c_bool, c_char
            implicit none
            character(kind=c_char), intent(in) :: path
            logical(kind=c_bool)               :: is_path_file
        end function is_path_file

        ! bool IsRenderTextureReady(RenderTexture2D target)
        function is_render_texture_ready(target) bind(c, name='IsRenderTextureReady')
            import :: c_bool, render_texture2d_type
            implicit none
            type(render_texture2d_type), intent(in), value :: target
            logical(kind=c_bool)                           :: is_render_texture_ready
        end function is_render_texture_ready

        ! bool IsShaderReady(Shader shader)
        function is_shader_ready(shader) bind(c, name='IsShaderReady')
            import :: c_bool, shader_type
            implicit none
            type(shader_type), intent(in), value :: shader
            logical(kind=c_bool)                 :: is_shader_ready
        end function is_shader_ready

        ! bool IsSoundPlaying(Sound sound)
        function is_sound_playing(sound) bind(c, name='IsSoundPlaying')
            import :: c_bool, sound_type
            implicit none
            type(sound_type), intent(in), value :: sound
            logical(kind=c_bool)                :: is_sound_playing
        end function is_sound_playing

        ! bool IsSoundReady(Sound sound)
        function is_sound_ready(sound) bind(c, name='IsSoundReady')
            import :: c_bool, sound_type
            implicit none
            type(sound_type), intent(in), value :: sound
            logical(kind=c_bool)                :: is_sound_ready
        end function is_sound_ready

        ! bool IsTextureReady(Texture2D texture)
        function is_texture_ready(texture) bind(c, name='IsTextureReady')
            import :: c_bool, texture2d_type
            implicit none
            type(texture2d_type), intent(in), value :: texture
            logical(kind=c_bool)                    :: is_texture_ready
        end function is_texture_ready

        ! bool IsWaveReady(Wave wave)
        function is_wave_ready(wave) bind(c, name='IsWaveReady')
            import :: c_bool, wave_type
            implicit none
            type(wave_type), intent(in), value :: wave
            logical(kind=c_bool)               :: is_wave_ready
        end function is_wave_ready

        ! bool IsWindowFocused(void)
        function is_window_focused() bind(c, name='IsWindowFocused')
            import :: c_bool
            implicit none
            logical(kind=c_bool) :: is_window_focused
        end function is_window_focused

        ! bool IsWindowFullscreen(void)
        function is_window_fullscreen() bind(c, name='IsWindowFullscreen')
            import :: c_bool
            implicit none
            logical(kind=c_bool) :: is_window_fullscreen
        end function is_window_fullscreen

        ! bool IsWindowHidden(void)
        function is_window_hidden() bind(c, name='IsWindowHidden')
            import :: c_bool
            implicit none
            logical(kind=c_bool) :: is_window_hidden
        end function is_window_hidden

        ! bool IsWindowMaximized(void)
        function is_window_maximized() bind(c, name='IsWindowMaximized')
            import :: c_bool
            implicit none
            logical(kind=c_bool) :: is_window_maximized
        end function is_window_maximized

        ! bool IsWindowMinimized(void)
        function is_window_minimized() bind(c, name='IsWindowMinimized')
            import :: c_bool
            implicit none
            logical(kind=c_bool) :: is_window_minimized
        end function is_window_minimized

        ! bool IsWindowReady(void)
        function is_window_ready() bind(c, name='IsWindowReady')
            import :: c_bool
            implicit none
            logical(kind=c_bool) :: is_window_ready
        end function is_window_ready

        ! bool IsWindowResized(void)
        function is_window_resized() bind(c, name='IsWindowResized')
            import :: c_bool
            implicit none
            logical(kind=c_bool) :: is_window_resized
        end function is_window_resized

        ! bool IsWindowState(unsigned int flag)
        function is_window_state(flag) bind(c, name='IsWindowState')
            import :: c_bool, c_unsigned_int
            implicit none
            integer(kind=c_unsigned_int), intent(in), value :: flag
            logical(kind=c_bool)                            :: is_window_state
        end function is_window_state

        ! AudioStream LoadAudioStream(unsigned int sampleRate, unsigned int sampleSize, unsigned int channels)
        function load_audio_stream(sample_rate, sample_size, channels) bind(c, name='LoadAudioStream')
            import :: audio_stream_type, c_unsigned_int
            implicit none
            integer(kind=c_unsigned_int), intent(in), value :: sample_rate
            integer(kind=c_unsigned_int), intent(in), value :: sample_size
            integer(kind=c_unsigned_int), intent(in), value :: channels
            type(audio_stream_type)                         :: load_audio_stream
        end function load_audio_stream

        ! int *LoadCodepoints(const char *text, int *count)
        function load_codepoints(text, count) bind(c, name='LoadCodepoints')
            import :: c_char, c_int, c_ptr
            implicit none
            character(kind=c_char), intent(in)  :: text
            integer(kind=c_int),    intent(out) :: count
            type(c_ptr)                         :: load_codepoints
        end function load_codepoints

        ! FilePathList LoadDirectoryFiles(const char *dirPath)
        function load_directory_files(dir_path) bind(c, name='LoadDirectoryFiles')
            import :: c_char, file_path_list_type
            implicit none
            character(kind=c_char), intent(in) :: dir_path
            type(file_path_list_type)          :: load_directory_files
        end function load_directory_files

        ! FilePathList LoadDirectoryFilesEx(const char *basePath, const char *filter, bool scanSubdirs)
        function load_directory_files_ex(base_path, filter, scan_subdirs) bind(c, name='LoadDirectoryFilesEx')
            import :: c_bool, c_char, file_path_list_type
            implicit none
            character(kind=c_char), intent(in)        :: base_path
            character(kind=c_char), intent(in)        :: filter
            logical(kind=c_bool),   intent(in), value :: scan_subdirs
            type(file_path_list_type)                 :: load_directory_files_ex
        end function load_directory_files_ex

        ! FilePathList LoadDroppedFiles(void)
        function load_dropped_files() bind(c, name='LoadDroppedFiles')
            import :: file_path_list_type
            implicit none
            type(file_path_list_type) :: load_dropped_files
        end function load_dropped_files

        ! unsigned char *LoadFileData(const char *fileName, int *dataSize)
        function load_file_data(file_name, data_size) bind(c, name='LoadFileData')
            import :: c_char, c_int, c_ptr
            implicit none
            character(kind=c_char), intent(in)  :: file_name
            integer(kind=c_int),    intent(out) :: data_size
            type(c_ptr)                         :: load_file_data
        end function load_file_data

        ! char *LoadFileText(const char *fileName)
        function load_file_text(file_name) bind(c, name='LoadFileText')
            import :: c_char, c_ptr
            implicit none
            character(kind=c_char), intent(in) :: file_name
            type(c_ptr)                        :: load_file_text
        end function load_file_text

        ! Font LoadFont(const char *fileName)
        function load_font(file_name) bind(c, name='LoadFont')
            import :: c_char, font_type
            implicit none
            character(kind=c_char), intent(in) :: file_name
            type(font_type)                    :: load_font
        end function load_font

        ! GlyphInfo *LoadFontData(const unsigned char *fileData, int dataSize, int fontSize, int *codepoints, int codepointsCount, int type)
        function load_font_data(file_data, data_size, font_size, codepoints, codepoints_count, type) &
                bind(c, name='LoadFontData')
            import :: c_char, c_int, c_ptr, glyph_info_type
            implicit none
            character(kind=c_char), intent(in)        :: file_data
            integer(kind=c_int),    intent(in), value :: data_size
            integer(kind=c_int),    intent(in), value :: font_size
            integer(kind=c_int),    intent(inout)     :: codepoints(*)
            integer(kind=c_int),    intent(in), value :: codepoints_count
            integer(kind=c_int),    intent(in), value :: type
            type(c_ptr)                               :: load_font_data
        end function load_font_data

        ! Font LoadFontEx(const char *fileName, int fontSize, int *codepoints, int codepointsCount)
        function load_font_ex(file_name, font_size, codepoints, codepoints_count) bind(c, name='LoadFontEx')
            import :: c_char, c_int, font_type
            implicit none
            character(kind=c_char), intent(in)        :: file_name
            integer(kind=c_int),    intent(in), value :: font_size
            integer(kind=c_int),    intent(inout)     :: codepoints(*)
            integer(kind=c_int),    intent(in), value :: codepoints_count
            type(font_type)                           :: load_font_ex
        end function load_font_ex

        ! Font LoadFontFromImage(Image image, Color key, int firstChar)
        function load_font_from_image(image, key, first_char) bind(c, name='LoadFontFromImage')
            import :: c_int, color_type, font_type, image_type
            implicit none
            type(image_type),    intent(in), value :: image
            type(color_type),    intent(in), value :: key
            integer(kind=c_int), intent(in), value :: first_char
            type(font_type)                        :: load_font_from_image
        end function load_font_from_image

        ! Font LoadFontFromMemory(const char *fileType, const unsigned char *fileData, int dataSize, int fontSize, int *codepoints, int codepointsCount)
        function load_font_from_memory(file_type, file_data, data_size, font_size, codepoints, codepoints_count) &
                bind(c, name='LoadFontFromMemory')
            import :: c_char, c_int, font_type
            implicit none
            character(kind=c_char), intent(in)        :: file_type
            character(kind=c_char), intent(in)        :: file_data
            integer(kind=c_int),    intent(in), value :: data_size
            integer(kind=c_int),    intent(in), value :: font_size
            integer(kind=c_int),    intent(inout)     :: codepoints(*)
            integer(kind=c_int),    intent(in), value :: codepoints_count
            type(font_type)                           :: load_font_from_memory
        end function load_font_from_memory

        ! Image LoadImage(const char *fileName)
        function load_image(file_name) bind(c, name='LoadImage')
            import :: c_char, image_type
            implicit none
            character(kind=c_char), intent(in) :: file_name
            type(image_type)                   :: load_image
        end function load_image

        ! Image LoadImageAnim(const char *fileName, int *frames)
        function load_image_anim(file_name, frames) bind(c, name='LoadImageAnim')
            import :: c_char, c_int, image_type
            implicit none
            character(kind=c_char), intent(in)  :: file_name
            integer(kind=c_int),    intent(out) :: frames
            type(image_type)                    :: load_image_anim
        end function load_image_anim

        ! Image LoadImageAnimFromMemory(const char *fileType, const unsigned char *fileData, int dataSize, int *frames)
        function load_image_anim_from_memory(file_type, file_data, data_size, frames) bind(c, name='LoadImageAnimFromMemory')
            import :: c_char, c_int, image_type
            implicit none
            character(kind=c_char), intent(in)        :: file_type
            character(kind=c_char), intent(in)        :: file_data
            integer(kind=c_int),    intent(in), value :: data_size
            integer(kind=c_int),    intent(out)       :: frames
            type(image_type)                          :: load_image_anim_from_memory
        end function load_image_anim_from_memory

        ! Color *LoadImageColors(Image image)
        function load_image_colors(image) bind(c, name='LoadImageColors')
            import :: c_ptr, image_type
            implicit none
            type(image_type), intent(in), value :: image
            type(c_ptr)                         :: load_image_colors
        end function load_image_colors

        ! Image LoadImageFromMemory(const char *fileType, const unsigned char *fileData, int dataSize)
        function load_image_from_memory(file_type, file_data, data_size) bind(c, name='LoadImageFromMemory')
            import :: c_char, c_int, image_type
            implicit none
            character(kind=c_char), intent(in)        :: file_type
            character(kind=c_char), intent(in)        :: file_data
            integer(kind=c_int),    intent(in), value :: data_size
            type(image_type)                          :: load_image_from_memory
        end function load_image_from_memory

        ! Image LoadImageFromScreen(void)
        function load_image_from_screen() bind(c, name='LoadImageFromScreen')
            import :: image_type
            implicit none
            type(image_type) :: load_image_from_screen
        end function load_image_from_screen

        ! Image LoadImageFromTexture(Texture2D texture)
        function load_image_from_texture(texture) bind(c, name='LoadImageFromTexture')
            import :: image_type, texture2d_type
            implicit none
            type(texture2d_type), intent(in), value :: texture
            type(image_type)                        :: load_image_from_texture
        end function load_image_from_texture

        ! Color *LoadImagePalette(Image image, int maxPaletteSize, int *colorCount)
        function load_image_palette(image, max_palette_size, color_count) bind(c, name='LoadImagePalette')
            import :: c_int, c_ptr, image_type
            implicit none
            type(image_type),    intent(in), value :: image
            integer(kind=c_int), intent(in), value :: max_palette_size
            integer(kind=c_int), intent(out)       :: color_count
            type(c_ptr)                            :: load_image_palette
        end function load_image_palette

        ! Image LoadImageRaw(const char *fileName, int width, int height, int format, int headerSize)
        function load_image_raw(file_name, width, height, format, header_size) bind(c, name='LoadImageRaw')
            import :: c_char, c_int, image_type
            implicit none
            character(kind=c_char), intent(in)        :: file_name
            integer(kind=c_int),    intent(in), value :: width
            integer(kind=c_int),    intent(in), value :: height
            integer(kind=c_int),    intent(in), value :: format
            integer(kind=c_int),    intent(in), value :: header_size
            type(image_type)                          :: load_image_raw
        end function load_image_raw

        ! Image LoadImageSvg(const char *fileNameOrString, int width, int height)
        function load_image_svg(file_name_or_string, width, height) bind(c, name='LoadImageSvg')
            import :: c_char, c_int, image_type
            implicit none
            character(kind=c_char), intent(in)        :: file_name_or_string
            integer(kind=c_int),    intent(in), value :: width
            integer(kind=c_int),    intent(in), value :: height
            type(image_type)                          :: load_image_svg
        end function load_image_svg

        ! Material LoadMaterialDefault(void)
        function load_material_default() bind(c, name='LoadMaterialDefault')
            import :: material_type
            implicit none
            type(material_type) :: load_material_default
        end function load_material_default

        ! Material *LoadMaterials(const char *fileName, int *materialCount)
        function load_materials(file_name, material_count) bind(c, name='LoadMaterials')
            import :: c_char, c_int, c_ptr
            implicit none
            character(kind=c_char), intent(in)  :: file_name
            integer(kind=c_int),    intent(out) :: material_count
            type(c_ptr)                         :: load_materials
        end function load_materials

        ! Model LoadModel(const char *fileName)
        function load_model(file_name) bind(c, name='LoadModel')
            import :: c_char, model_type
            implicit none
            character(kind=c_char), intent(in) :: file_name
            type(model_type)                   :: load_model
        end function load_model

        ! ModelAnimation *LoadModelAnimations(const char *fileName, int *animCount)
        function load_model_animations(file_name, anim_count) bind(c, name='LoadModelAnimations')
            import :: c_char, c_int, c_ptr
            implicit none
            character(kind=c_char), intent(in)  :: file_name
            integer(kind=c_int),    intent(out) :: anim_count
            type(c_ptr)                         :: load_model_animations
        end function load_model_animations

        ! Model LoadModelFromMesh(Mesh mesh)
        function load_model_from_mesh(mesh) bind(c, name='LoadModelFromMesh')
            import :: mesh_type, model_type
            implicit none
            type(mesh_type), intent(in), value :: mesh
            type(model_type)                   :: load_model_from_mesh
        end function load_model_from_mesh

        ! Music LoadMusicStream(const char *fileName)
        function load_music_stream(file_name) bind(c, name='LoadMusicStream')
            import :: c_char, music_type
            implicit none
            character(kind=c_char), intent(in) :: file_name
            type(music_type)                   :: load_music_stream
        end function load_music_stream

        ! Music LoadMusicStreamFromMemory(const char *fileType, const unsigned char *data, int dataSize)
        function load_music_stream_from_memory(file_type, data, data_size) bind(c, name='LoadMusicStreamFromMemory')
            import :: c_char, c_int, music_type
            implicit none
            character(kind=c_char), intent(in)        :: file_type
            character(kind=c_char), intent(in)        :: data
            integer(kind=c_int),    intent(in), value :: data_size
            type(music_type)                          :: load_music_stream_from_memory
        end function load_music_stream_from_memory

        ! int *LoadRandomSequence(unsigned int count, int min, int max)
        function load_random_sequence(count, min, max) bind(c, name='LoadRandomSequence')
            import :: c_int, c_ptr, c_unsigned_int
            implicit none
            integer(kind=c_unsigned_int), intent(in), value :: count
            integer(kind=c_int),          intent(in), value :: min
            integer(kind=c_int),          intent(in), value :: max
            type(c_ptr)                                     :: load_random_sequence
        end function load_random_sequence

        ! RenderTexture2D LoadRenderTexture(int width, int height)
        function load_render_texture(width, height) bind(c, name='LoadRenderTexture')
            import :: c_int, render_texture2d_type
            implicit none
            integer(kind=c_int), intent(in), value :: width
            integer(kind=c_int), intent(in), value :: height
            type(render_texture2d_type)            :: load_render_texture
        end function load_render_texture

        ! Shader LoadShader(const char *vsFileName, const char *fsFileName)
        function load_shader(vs_file_name, fs_file_name) bind(c, name='LoadShader')
            import :: c_char, shader_type
            implicit none
            character(kind=c_char), intent(in) :: vs_file_name
            character(kind=c_char), intent(in) :: fs_file_name
            type(shader_type)                  :: load_shader
        end function load_shader

        ! Shader LoadShaderFromMemory(const char *vsCode, const char *fsCode)
        function load_shader_from_memory(vs_code, fs_code) bind(c, name='LoadShaderFromMemory')
            import :: c_char, shader_type
            implicit none
            character(kind=c_char), intent(in) :: vs_code
            character(kind=c_char), intent(in) :: fs_code
            type(shader_type)                  :: load_shader_from_memory
        end function load_shader_from_memory

        ! Sound LoadSound(const char *fileName)
        function load_sound(file_name) bind(c, name='LoadSound')
            import :: c_char, sound_type
            implicit none
            character(kind=c_char), intent(in) :: file_name
            type(sound_type)                   :: load_sound
        end function load_sound

        ! Sound LoadSoundAlias(Sound source)
        function load_sound_alias(source) bind(c, name='LoadSoundAlias')
            import :: sound_type
            implicit none
            type(sound_type), intent(in), value :: source
            type(sound_type)                    :: load_sound_alias
        end function load_sound_alias

        ! Sound LoadSoundFromWave(Wave wave)
        function load_sound_from_wave(wave) bind(c, name='LoadSoundFromWave')
            import :: sound_type, wave_type
            implicit none
            type(wave_type), intent(in), value :: wave
            type(sound_type)                   :: load_sound_from_wave
        end function load_sound_from_wave

        ! Texture2D LoadTexture(const char *fileName)
        function load_texture(file_name) bind(c, name='LoadTexture')
            import :: c_char, texture2d_type
            implicit none
            character(kind=c_char), intent(in) :: file_name
            type(texture2d_type)               :: load_texture
        end function load_texture

        ! TextureCubemap LoadTextureCubemap(Image image, int layout)
        function load_texture_cubemap(image, layout) bind(c, name='LoadTextureCubemap')
            import :: c_int, image_type, texture_cubemap_type
            implicit none
            type(image_type),    intent(in), value :: image
            integer(kind=c_int), intent(in), value :: layout
            type(texture_cubemap_type)             :: load_texture_cubemap
        end function load_texture_cubemap

        ! Texture2D LoadTextureFromImage(Image image)
        function load_texture_from_image(image) bind(c, name='LoadTextureFromImage')
            import :: image_type, texture2d_type
            implicit none
            type(image_type), intent(in), value :: image
            type(texture2d_type)                :: load_texture_from_image
        end function load_texture_from_image

        ! char *LoadUTF8(const int *codepoints, int length)
        function load_utf8(codepoints, length) bind(c, name='LoadUTF8')
            import :: c_int, c_ptr
            implicit none
            integer(kind=c_int), intent(out)       :: codepoints(*)
            integer(kind=c_int), intent(in), value :: length
            type(c_ptr)                            :: load_utf8
        end function load_utf8

        ! VrStereoConfig LoadVrStereoConfig(VrDeviceInfo device)
        function load_vr_stereo_config(device) bind(c, name='LoadVrStereoConfig')
            import :: vr_device_info_type, vr_stereo_config_type
            implicit none
            type(vr_device_info_type), intent(in), value :: device
            type(vr_stereo_config_type)                  :: load_vr_stereo_config
        end function load_vr_stereo_config

        ! Wave LoadWave(const char *fileName)
        function load_wave(file_name) bind(c, name='LoadWave')
            import :: c_char, wave_type
            implicit none
            character(kind=c_char), intent(in) :: file_name
            type(wave_type)                    :: load_wave
        end function load_wave

        ! Wave LoadWaveFromMemory(const char *fileType, const unsigned char *fileData, int dataSize)
        function load_wave_from_memory(file_type, file_data, data_size) bind(c, name='LoadWaveFromMemory')
            import :: c_char, c_int, wave_type
            implicit none
            character(kind=c_char), intent(in)        :: file_type
            character(kind=c_char), intent(in)        :: file_data
            integer(kind=c_int),    intent(in), value :: data_size
            type(wave_type)                           :: load_wave_from_memory
        end function load_wave_from_memory

        ! float *LoadWaveSamples(Wave wave)
        function load_wave_samples(wave) bind(c, name='LoadWaveSamples')
            import :: c_ptr, wave_type
            implicit none
            type(wave_type), intent(in), value :: wave
            type(c_ptr)                        :: load_wave_samples
        end function load_wave_samples

        ! int MakeDirectory(const char *dirPath)
        function make_directory(dir_path) bind(c, name='MakeDirectory')
            import :: c_char, c_int
            implicit none
            character(kind=c_char), intent(in) :: dir_path
            integer(kind=c_int)                :: make_directory
        end function make_directory

        ! void MaximizeWindow(void)
        subroutine maximize_window() bind(c, name='MaximizeWindow')
        end subroutine maximize_window

        ! int MeasureText(const char *text, int fontSize)
        function measure_text(text, font_size) bind(c, name='MeasureText')
            import :: c_char, c_int
            implicit none
            character(kind=c_char), intent(in)        :: text
            integer(kind=c_int),    intent(in), value :: font_size
            integer(kind=c_int)                       :: measure_text
        end function measure_text

        ! Vector2 MeasureTextEx(Font font, const char *text, float fontSize, float spacing)
        function measure_text_ex(font, text, font_size, spacing) bind(c, name='MeasureTextEx')
            import :: c_char, c_float, font_type, vector2_type
            implicit none
            type(font_type),        intent(in), value :: font
            character(kind=c_char), intent(in)        :: text
            real(kind=c_float),     intent(in), value :: font_size
            real(kind=c_float),     intent(in), value :: spacing
            type(vector2_type)                        :: measure_text_ex
        end function measure_text_ex

        ! void *MemAlloc(unsigned int size)
        function mem_alloc(size) bind(c, name='MemAlloc')
            import :: c_ptr, c_unsigned_int
            implicit none
            integer(kind=c_unsigned_int), intent(in), value :: size
            type(c_ptr)                                     :: mem_alloc
        end function mem_alloc

        ! void MemFree(void *ptr)
        subroutine mem_free(ptr) bind(c, name='MemFree')
            import :: c_ptr
            implicit none
            type(c_ptr), intent(in), value :: ptr
        end subroutine mem_free

        ! void *MemRealloc(void *ptr, unsigned int size)
        function mem_realloc(ptr, size) bind(c, name='MemRealloc')
            import :: c_ptr, c_unsigned_int
            implicit none
            type(c_ptr),                  intent(in), value :: ptr
            integer(kind=c_unsigned_int), intent(in), value :: size
            type(c_ptr)                                     :: mem_realloc
        end function mem_realloc

        ! void MinimizeWindow(void)
        subroutine minimize_window() bind(c, name='MinimizeWindow')
        end subroutine minimize_window

        ! void OpenURL(const char *url)
        subroutine open_url(url) bind(c, name='OpenURL')
            import :: c_char
            implicit none
            character(kind=c_char), intent(in) :: url
        end subroutine open_url

        ! void PauseAudioStream(AudioStream stream)
        subroutine pause_audio_stream(stream) bind(c, name='PauseAudioStream')
            import :: audio_stream_type
            implicit none
            type(audio_stream_type), intent(in), value :: stream
        end subroutine pause_audio_stream

        ! void PauseMusicStream(Music music)
        subroutine pause_music_stream(music) bind(c, name='PauseMusicStream')
            import :: music_type
            implicit none
            type(music_type), intent(in), value :: music
        end subroutine pause_music_stream

        ! void PauseSound(Sound sound)
        subroutine pause_sound(sound) bind(c, name='PauseSound')
            import :: sound_type
            implicit none
            type(sound_type), intent(in), value :: sound
        end subroutine pause_sound

        ! void PlayAudioStream(AudioStream stream)
        subroutine play_audio_stream(stream) bind(c, name='PlayAudioStream')
            import :: audio_stream_type
            implicit none
            type(audio_stream_type), intent(in), value :: stream
        end subroutine play_audio_stream

        ! void PlayMusicStream(Music music)
        subroutine play_music_stream(music) bind(c, name='PlayMusicStream')
            import :: music_type
            implicit none
            type(music_type), intent(in), value :: music
        end subroutine play_music_stream

        ! void PlaySound(Sound sound)
        subroutine play_sound(sound) bind(c, name='PlaySound')
            import :: sound_type
            implicit none
            type(sound_type), intent(in), value :: sound
        end subroutine play_sound

        ! void PollInputEvents(void)
        subroutine poll_input_events() bind(c, name='PollInputEvents')
        end subroutine poll_input_events

        ! void RestoreWindow(void)
        subroutine restore_window() bind(c, name='RestoreWindow')
        end subroutine restore_window

        ! void ResumeAudioStream(AudioStream stream)
        subroutine resume_audio_stream(stream) bind(c, name='ResumeAudioStream')
            import :: audio_stream_type
            implicit none
            type(audio_stream_type), intent(in), value :: stream
        end subroutine resume_audio_stream

        ! void ResumeMusicStream(Music music)
        subroutine resume_music_stream(music) bind(c, name='ResumeMusicStream')
            import :: music_type
            implicit none
            type(music_type), intent(in), value :: music
        end subroutine resume_music_stream

        ! void ResumeSound(Sound sound)
        subroutine resume_sound(sound) bind(c, name='ResumeSound')
            import :: sound_type
            implicit none
            type(sound_type), intent(in), value :: sound
        end subroutine resume_sound

        ! bool SaveFileData(const char *fileName, void *data, int dataSize)
        function save_file_data(file_name, data, data_size) bind(c, name='SaveFileData')
            import :: c_bool, c_char, c_int, c_ptr
            implicit none
            character(kind=c_char), intent(in)        :: file_name
            type(c_ptr),            intent(in), value :: data
            integer(kind=c_int),    intent(in), value :: data_size
            logical(kind=c_bool)                      :: save_file_data
        end function save_file_data

        ! bool SaveFileText(const char *fileName, char *text)
        function save_file_text(file_name, text) bind(c, name='SaveFileText')
            import :: c_bool, c_char
            implicit none
            character(kind=c_char), intent(in) :: file_name
            character(kind=c_char), intent(in) :: text
            logical(kind=c_bool)               :: save_file_text
        end function save_file_text

        ! void SeekMusicStream(Music music, float position)
        subroutine seek_music_stream(music, position) bind(c, name='SeekMusicStream')
            import :: c_float, music_type
            implicit none
            type(music_type),   intent(in), value :: music
            real(kind=c_float), intent(in), value :: position
        end subroutine seek_music_stream

        ! void SetAudioStreamBufferSizeDefault(int size)
        subroutine set_audio_stream_buffer_size_default(size) bind(c, name='SetAudioStreamBufferSizeDefault')
            import :: c_int
            implicit none
            integer(kind=c_int), intent(in), value :: size
        end subroutine set_audio_stream_buffer_size_default

        ! void SetAudioStreamPan(AudioStream stream, float pan)
        subroutine set_audio_stream_pan(stream, pan) bind(c, name='SetAudioStreamPan')
            import :: audio_stream_type, c_float
            implicit none
            type(audio_stream_type), intent(in), value :: stream
            real(kind=c_float),      intent(in), value :: pan
        end subroutine set_audio_stream_pan

        ! void SetAudioStreamPitch(AudioStream stream, float pitch)
        subroutine set_audio_stream_pitch(stream, pitch) bind(c, name='SetAudioStreamPitch')
            import :: audio_stream_type, c_float
            implicit none
            type(audio_stream_type), intent(in), value :: stream
            real(kind=c_float),      intent(in), value :: pitch
        end subroutine set_audio_stream_pitch

        ! void SetAudioStreamVolume(AudioStream stream, float volume)
        subroutine set_audio_stream_volume(stream, volume) bind(c, name='SetAudioStreamVolume')
            import :: audio_stream_type, c_float
            implicit none
            type(audio_stream_type), intent(in), value :: stream
            real(kind=c_float),      intent(in), value :: volume
        end subroutine set_audio_stream_volume

        ! void SetCameraAltControl(int keyAlt)
        subroutine set_camera_alt_control(key_alt) bind(c, name='SetCameraAltControl')
            import :: c_int
            implicit none
            integer(kind=c_int), intent(in), value :: key_alt
        end subroutine set_camera_alt_control

        ! void SetCameraMode(Camera camera, int mode)
        subroutine set_camera_mode(camera, mode) bind(c, name='SetCameraMode')
            import :: c_int, camera3d_type
            implicit none
            type(camera3d_type), intent(in), value :: camera
            integer(kind=c_int), intent(in), value :: mode
        end subroutine set_camera_mode

        ! void SetCameraMoveControls(int keyFront, int keyBack, int keyRight, int keyLeft, int keyUp, int keyDown)
        subroutine set_camera_move_controls(key_front, key_back, key_right, key_left, key_up, key_down) &
                bind(c, name='SetCameraMoveControls')
            import :: c_int
            implicit none
            integer(kind=c_int), intent(in), value :: key_front
            integer(kind=c_int), intent(in), value :: key_back
            integer(kind=c_int), intent(in), value :: key_right
            integer(kind=c_int), intent(in), value :: key_left
            integer(kind=c_int), intent(in), value :: key_up
            integer(kind=c_int), intent(in), value :: key_down
        end subroutine set_camera_move_controls

        ! void SetCameraPanControl(int keyPan)
        subroutine set_camera_pan_control(key_pan) bind(c, name='SetCameraPanControl')
            import :: c_int
            implicit none
            integer(kind=c_int), intent(in), value :: key_pan
        end subroutine set_camera_pan_control

        ! void SetCameraSmoothZoomControl(int keySmoothZoom)
        subroutine set_camera_smooth_zoom_control(key_smooth_zoom) bind(c, name='SetCameraSmoothZoomControl')
            import :: c_int
            implicit none
            integer(kind=c_int), intent(in), value :: key_smooth_zoom
        end subroutine set_camera_smooth_zoom_control

        ! void SetClipboardText(const char *text)
        subroutine set_clipboard_text(text) bind(c, name='SetClipboardText')
            import :: c_char
            implicit none
            character(kind=c_char), intent(in) :: text
        end subroutine set_clipboard_text

        ! void SetConfigFlags(unsigned int flags)
        subroutine set_config_flags(flags) bind(c, name='SetConfigFlags')
            import :: c_unsigned_int
            implicit none
            integer(kind=c_unsigned_int), intent(in), value :: flags
        end subroutine set_config_flags

        ! void SetExitKey(int key)
        subroutine set_exit_key(key) bind(c, name='SetExitKey')
            import :: c_int
            implicit none
            integer(kind=c_int), intent(in), value :: key
        end subroutine set_exit_key

        ! int SetGamepadMappings(const char *mappings)
        function set_gamepad_mappings(mappings) bind(c, name='SetGamepadMappings')
            import :: c_char, c_int
            implicit none
            character(kind=c_char), intent(in) :: mappings
            integer(kind=c_int)                :: set_gamepad_mappings
        end function set_gamepad_mappings

        ! void SetGesturesEnabled(unsigned int flags)
        subroutine set_gestures_enabled(flags) bind(c, name='SetGesturesEnabled')
            import :: c_unsigned_int
            implicit none
            integer(kind=c_unsigned_int), intent(in), value :: flags
        end subroutine set_gestures_enabled

        ! void SetLoadFileDataCallback(LoadFileDataCallback callback)
        subroutine set_load_file_data_callback(callback) bind(c, name='SetLoadFileDataCallback')
            import :: c_funptr
            implicit none
            type(c_funptr), intent(in), value :: callback
        end subroutine set_load_file_data_callback

        ! void SetLoadFileTextCallback(LoadFileTextCallback callback)
        subroutine set_load_file_text_callback(callback) bind(c, name='SetLoadFileTextCallback')
            import :: c_funptr
            implicit none
            type(c_funptr), intent(in), value :: callback
        end subroutine set_load_file_text_callback

        ! void SetMasterVolume(float volume)
        subroutine set_master_volume(volume) bind(c, name='SetMasterVolume')
            import :: c_float
            implicit none
            real(kind=c_float), intent(in), value :: volume
        end subroutine set_master_volume

        ! void SetMaterialTexture(Material *material, int mapType, Texture2D texture)
        subroutine set_material_texture(material, map_type, texture) bind(c, name='SetMaterialTexture')
            import :: c_int, material_type, texture2d_type
            implicit none
            type(material_type),  intent(inout)     :: material
            integer(kind=c_int),  intent(in), value :: map_type
            type(texture2d_type), intent(in), value :: texture
        end subroutine set_material_texture

        ! void SetModelMeshMaterial(Model *model, int meshId, int materialId)
        subroutine set_model_mesh_material(model, mesh_id, material_id) bind(c, name='SetModelMeshMaterial')
            import :: c_int, model_type
            implicit none
            type(model_type),    intent(inout)     :: model
            integer(kind=c_int), intent(in), value :: mesh_id
            integer(kind=c_int), intent(in), value :: material_id
        end subroutine set_model_mesh_material

        ! void SetMouseCursor(int cursor)
        subroutine set_mouse_cursor(cursor) bind(c, name='SetMouseCursor')
            import :: c_int
            implicit none
            integer(kind=c_int), intent(in), value :: cursor
        end subroutine set_mouse_cursor

        ! void SetMouseOffset(int offsetX, int offsetY)
        subroutine set_mouse_offset(offset_x, offset_y) bind(c, name='SetMouseOffset')
            import :: c_int
            implicit none
            integer(kind=c_int), intent(in), value :: offset_x
            integer(kind=c_int), intent(in), value :: offset_y
        end subroutine set_mouse_offset

        ! void SetMousePosition(int x, int y)
        subroutine set_mouse_position(x, y) bind(c, name='SetMousePosition')
            import :: c_int
            implicit none
            integer(kind=c_int), intent(in), value :: x
            integer(kind=c_int), intent(in), value :: y
        end subroutine set_mouse_position

        ! void SetMouseScale(float scaleX, float scaleY)
        subroutine set_mouse_scale(scale_x, scale_y) bind(c, name='SetMouseScale')
            import :: c_float
            implicit none
            real(kind=c_float), intent(in), value :: scale_x
            real(kind=c_float), intent(in), value :: scale_y
        end subroutine set_mouse_scale

        ! void SetMusicPan(Music music, float pan)
        subroutine set_music_pan(music, pan) bind(c, name='SetMusicPan')
            import :: c_float, music_type
            implicit none
            type(music_type),   intent(in), value :: music
            real(kind=c_float), intent(in), value :: pan
        end subroutine set_music_pan

        ! void SetMusicPitch(Music music, float pitch)
        subroutine set_music_pitch(music, pitch) bind(c, name='SetMusicPitch')
            import :: c_float, music_type
            implicit none
            type(music_type),   intent(in), value :: music
            real(kind=c_float), intent(in), value :: pitch
        end subroutine set_music_pitch

        ! void SetMusicVolume(Music music, float volume)
        subroutine set_music_volume(music, volume) bind(c, name='SetMusicVolume')
            import :: c_float, music_type
            implicit none
            type(music_type),   intent(in), value :: music
            real(kind=c_float), intent(in), value :: volume
        end subroutine set_music_volume

        ! void SetPixelColor(void *dstPtr, Color color, int format)
        subroutine set_pixel_color(dst_ptr, color, format) bind(c, name='SetPixelColor')
            import :: c_int, c_ptr, color_type
            implicit none
            type(c_ptr),         intent(in), value :: dst_ptr
            type(color_type),    intent(in), value :: color
            integer(kind=c_int), intent(in), value :: format
        end subroutine set_pixel_color

        ! void SetRandomSeed(unsigned int seed)
        subroutine set_random_seed(seed) bind(c, name='SetRandomSeed')
            import :: c_unsigned_int
            implicit none
            integer(kind=c_unsigned_int), intent(in), value :: seed
        end subroutine set_random_seed

        ! void SetSaveFileDataCallback(SaveFileDataCallback callback)
        subroutine set_save_file_data_callback(callback) bind(c, name='SetSaveFileDataCallback')
            import :: c_funptr
            implicit none
            type(c_funptr), intent(in), value :: callback
        end subroutine set_save_file_data_callback

        ! void SetSaveFileTextCallback(SaveFileTextCallback callback)
        subroutine set_save_file_text_callback(callback) bind(c, name='SetSaveFileTextCallback')
            import :: c_funptr
            implicit none
            type(c_funptr), intent(in), value :: callback
        end subroutine set_save_file_text_callback

        ! void SetShaderValue(Shader shader, int locIndex, const void *value, int uniformType)
        subroutine set_shader_value(shader, loc_index, value, uniform_type) bind(c, name='SetShaderValue')
            import :: c_int, c_ptr, shader_type
            implicit none
            type(shader_type),   intent(in), value :: shader
            integer(kind=c_int), intent(in), value :: loc_index
            type(c_ptr),         intent(in), value :: value
            integer(kind=c_int), intent(in), value :: uniform_type
        end subroutine set_shader_value

        ! void SetShaderValueMatrix(Shader shader, int locIndex, Matrix mat)
        subroutine set_shader_value_matrix(shader, loc_index, mat) bind(c, name='SetShaderValueMatrix')
            import :: c_int, matrix_type, shader_type
            implicit none
            type(shader_type),   intent(in), value :: shader
            integer(kind=c_int), intent(in), value :: loc_index
            type(matrix_type),   intent(in), value :: mat
        end subroutine set_shader_value_matrix

        ! void SetShaderValueTexture(Shader shader, int locIndex, Texture2D texture)
        subroutine set_shader_value_texture(shader, loc_index, texture) bind(c, name='SetShaderValueTexture')
            import :: c_int, shader_type, texture2d_type
            implicit none
            type(shader_type),    intent(in), value :: shader
            integer(kind=c_int),  intent(in), value :: loc_index
            type(texture2d_type), intent(in), value :: texture
        end subroutine set_shader_value_texture

        ! void SetShaderValueV(Shader shader, int locIndex, const void *value, int uniformType, int count)
        subroutine set_shader_value_v(shader, loc_index, value, uniform_type, count) bind(c, name='SetShaderValueV')
            import :: c_int, c_ptr, shader_type
            implicit none
            type(shader_type),   intent(in), value :: shader
            integer(kind=c_int), intent(in), value :: loc_index
            type(c_ptr),         intent(in), value :: value
            integer(kind=c_int), intent(in), value :: uniform_type
            integer(kind=c_int), intent(in), value :: count
        end subroutine set_shader_value_v

        ! void SetShapesTexture(Texture2D texture, Rectangle source)
        subroutine set_shapes_texture(texture, source) bind(c, name='SetShapesTexture')
            import :: rectangle_type, texture2d_type
            implicit none
            type(texture2d_type), intent(in), value :: texture
            type(rectangle_type), intent(in), value :: source
        end subroutine set_shapes_texture

        ! void SetSoundPan(Sound sound, float pan)
        subroutine set_sound_pan(sound, pan) bind(c, name='SetSoundPan')
            import :: c_float, sound_type
            implicit none
            type(sound_type),   intent(in), value :: sound
            real(kind=c_float), intent(in), value :: pan
        end subroutine set_sound_pan

        ! void SetSoundPitch(Sound sound, float pitch)
        subroutine set_sound_pitch(sound, pitch) bind(c, name='SetSoundPitch')
            import :: c_float, sound_type
            implicit none
            type(sound_type),   intent(in), value :: sound
            real(kind=c_float), intent(in), value :: pitch
        end subroutine set_sound_pitch

        ! void SetSoundVolume(Sound sound, float volume)
        subroutine set_sound_volume(sound, volume) bind(c, name='SetSoundVolume')
            import :: c_float, sound_type
            implicit none
            type(sound_type),   intent(in), value :: sound
            real(kind=c_float), intent(in), value :: volume
        end subroutine set_sound_volume

        ! void SetTargetFPS(int fps)
        subroutine set_target_fps(fps) bind(c, name='SetTargetFPS')
            import :: c_int
            implicit none
            integer(kind=c_int), intent(in), value :: fps
        end subroutine set_target_fps

        ! void SetTextLineSpacing(int spacing)
        subroutine set_text_line_spacing(spacing) bind(c, name='SetTextLineSpacing')
            import :: c_int
            implicit none
            integer(kind=c_int), intent(in), value :: spacing
        end subroutine set_text_line_spacing

        ! void SetTextureFilter(Texture2D texture, int filter)
        subroutine set_texture_filter(texture, filter) bind(c, name='SetTextureFilter')
            import :: c_int, texture2d_type
            implicit none
            type(texture2d_type), intent(in), value :: texture
            integer(kind=c_int),  intent(in), value :: filter
        end subroutine set_texture_filter

        ! void SetTextureWrap(Texture2D texture, int wrap)
        subroutine set_texture_wrap(texture, wrap) bind(c, name='SetTextureWrap')
            import :: c_int, texture2d_type
            implicit none
            type(texture2d_type), intent(in), value :: texture
            integer(kind=c_int),  intent(in), value :: wrap
        end subroutine set_texture_wrap

        ! void SetTraceLogCallback(TraceLogCallback callback)
        subroutine set_trace_log_callback(callback) bind(c, name='SetTraceLogCallback')
            import :: c_funptr
            implicit none
            type(c_funptr), intent(in), value :: callback
        end subroutine set_trace_log_callback

        ! void SetTraceLogLevel(int logLevel)
        subroutine set_trace_log_level(log_level) bind(c, name='SetTraceLogLevel')
            import :: c_int
            implicit none
            integer(kind=c_int), intent(in), value :: log_level
        end subroutine set_trace_log_level

        ! void SetWindowFocused(void)
        subroutine set_window_focused() bind(c, name='SetWindowFocused')
        end subroutine set_window_focused

        ! void SetWindowIcon(Image image)
        subroutine set_window_icon(image) bind(c, name='SetWindowIcon')
            import :: image_type
            implicit none
            type(image_type), intent(in), value :: image
        end subroutine set_window_icon

        ! void SetWindowIcons(Image *images, int count)
        subroutine set_window_icons(images, count) bind(c, name='SetWindowIcons')
            import :: c_int, image_type
            implicit none
            type(image_type),    intent(inout)     :: images
            integer(kind=c_int), intent(in), value :: count
        end subroutine set_window_icons

        ! void SetWindowMaxSize(int width, int height)
        subroutine set_window_max_size(width, height) bind(c, name='SetWindowMaxSize')
            import :: c_int
            implicit none
            integer(kind=c_int), intent(in), value :: width
            integer(kind=c_int), intent(in), value :: height
        end subroutine set_window_max_size

        ! void SetWindowMinSize(int width, int height)
        subroutine set_window_min_size(width, height) bind(c, name='SetWindowMinSize')
            import :: c_int
            implicit none
            integer(kind=c_int), intent(in), value :: width
            integer(kind=c_int), intent(in), value :: height
        end subroutine set_window_min_size

        ! void SetWindowMonitor(int monitor)
        subroutine set_window_monitor(monitor) bind(c, name='SetWindowMonitor')
            import :: c_int
            implicit none
            integer(kind=c_int), intent(in), value :: monitor
        end subroutine set_window_monitor

        ! void SetWindowOpacity(float opacity)
        subroutine set_window_opacity(opacity) bind(c, name='SetWindowOpacity')
            import :: c_float
            implicit none
            real(kind=c_float), intent(in), value :: opacity
        end subroutine set_window_opacity

        ! void SetWindowPosition(int x, int y)
        subroutine set_window_position(x, y) bind(c, name='SetWindowPosition')
            import :: c_int
            implicit none
            integer(kind=c_int), intent(in), value :: x
            integer(kind=c_int), intent(in), value :: y
        end subroutine set_window_position

        ! void SetWindowSize(int width, int height)
        subroutine set_window_size(width, height) bind(c, name='SetWindowSize')
            import :: c_int
            implicit none
            integer(kind=c_int), intent(in), value :: width
            integer(kind=c_int), intent(in), value :: height
        end subroutine set_window_size

        ! void SetWindowState(unsigned int flags)
        subroutine set_window_state(flags) bind(c, name='SetWindowState')
            import :: c_unsigned_int
            implicit none
            integer(kind=c_unsigned_int), intent(in), value :: flags
        end subroutine set_window_state

        ! void SetWindowTitle(const char *title)
        subroutine set_window_title(title) bind(c, name='SetWindowTitle')
            import :: c_char
            implicit none
            character(kind=c_char), intent(in) :: title
        end subroutine set_window_title

        ! void ShowCursor(void)
        subroutine show_cursor() bind(c, name='ShowCursor')
        end subroutine show_cursor

        ! void StopAudioStream(AudioStream stream)
        subroutine stop_audio_stream(stream) bind(c, name='StopAudioStream')
            import :: audio_stream_type
            implicit none
            type(audio_stream_type), intent(in), value :: stream
        end subroutine stop_audio_stream

        ! void StopMusicStream(Music music)
        subroutine stop_music_stream(music) bind(c, name='StopMusicStream')
            import :: music_type
            implicit none
            type(music_type), intent(in), value :: music
        end subroutine stop_music_stream

        ! void StopSound(Sound sound)
        subroutine stop_sound(sound) bind(c, name='StopSound')
            import :: sound_type
            implicit none
            type(sound_type), intent(in), value :: sound
        end subroutine stop_sound

        ! void SwapScreenBuffer(void)
        subroutine swap_screen_buffer() bind(c, name='SwapScreenBuffer')
        end subroutine swap_screen_buffer

        ! void TakeScreenshot(const char *fileName)
        subroutine take_screenshot(file_name) bind(c, name='TakeScreenshot')
            import :: c_char
            implicit none
            character(kind=c_char), intent(in) :: file_name
        end subroutine take_screenshot

        ! void TextAppend(char *text, const char *append, int *position)
        subroutine text_append(text, append, position) bind(c, name='TextAppend')
            import :: c_char, c_int
            implicit none
            character(kind=c_char), intent(in) :: text
            character(kind=c_char), intent(in) :: append
            integer(kind=c_int),    intent(in) :: position
        end subroutine text_append

        ! int TextCopy(char *dst, const char *src)
        function text_copy(dst, src) bind(c, name='TextCopy')
            import :: c_char, c_int
            implicit none
            character(kind=c_char), intent(in) :: dst
            character(kind=c_char), intent(in) :: src
            integer(kind=c_int)                :: text_copy
        end function text_copy

        ! int TextFindIndex(const char *text, const char *find)
        function text_find_index(text, find) bind(c, name='TextFindIndex')
            import :: c_char, c_int
            implicit none
            character(kind=c_char), intent(in) :: text
            character(kind=c_char), intent(in) :: find
            integer(kind=c_int)                :: text_find_index
        end function text_find_index

        ! char *TextInsert(const char *text, const char *insert, int position)
        function text_insert(text, insert, position) bind(c, name='TextInsert')
            import :: c_char, c_int, c_ptr
            implicit none
            character(kind=c_char), intent(in)        :: text
            character(kind=c_char), intent(in)        :: insert
            integer(kind=c_int),    intent(in), value :: position
            type(c_ptr)                               :: text_insert
        end function text_insert

        ! bool TextIsEqual(const char *text1, const char *text2)
        function text_is_equal(text1, text2) bind(c, name='TextIsEqual')
            import :: c_bool, c_char
            implicit none
            character(kind=c_char), intent(in) :: text1
            character(kind=c_char), intent(in) :: text2
            logical(kind=c_bool)               :: text_is_equal
        end function text_is_equal

        ! const char *TextJoin(const char **textList, int count, const char *delimiter)
        function text_join(text_list, count, delimiter) bind(c, name='TextJoin')
            import :: c_char, c_int, c_ptr
            implicit none
            character(kind=c_char), intent(in)        :: text_list(*)
            integer(kind=c_int),    intent(in), value :: count
            character(kind=c_char), intent(in)        :: delimiter
            type(c_ptr)                               :: text_join
        end function text_join

        ! unsigned int TextLength(const char *text)
        function text_length(text) bind(c, name='TextLength')
            import :: c_char, c_unsigned_int
            implicit none
            character(kind=c_char), intent(in) :: text
            integer(kind=c_unsigned_int)       :: text_length
        end function text_length

        ! char *TextReplace(char *text, const char *replace, const char *by)
        function text_replace(text, replace, by) bind(c, name='TextReplace')
            import :: c_char, c_ptr
            implicit none
            character(kind=c_char), intent(in) :: text
            character(kind=c_char), intent(in) :: replace
            character(kind=c_char), intent(in) :: by
            type(c_ptr)                        :: text_replace
        end function text_replace

        ! const char **TextSplit(const char *text, char delimiter, int *count)
        function text_split(text, delimiter, count) bind(c, name='TextSplit')
            import :: c_char, c_int, c_ptr
            implicit none
            character(kind=c_char), intent(in)        :: text
            character(kind=c_char), intent(in), value :: delimiter
            integer(kind=c_int),    intent(out)       :: count
            type(c_ptr)                               :: text_split
        end function text_split

        ! const char *TextSubtext(const char *text, int position, int length)
        function text_subtext(text, position, length) bind(c, name='TextSubtext')
            import :: c_char, c_int, c_ptr
            implicit none
            character(kind=c_char), intent(in)        :: text
            integer(kind=c_int),    intent(in), value :: position
            integer(kind=c_int),    intent(in), value :: length
            type(c_ptr)                               :: text_subtext
        end function text_subtext

        ! const char *TextToCamel(const char *text)
        function text_to_camel(text) bind(c, name='TextToCamel')
            import :: c_char, c_ptr
            implicit none
            character(kind=c_char), intent(in) :: text
            type(c_ptr)                        :: text_to_camel
        end function text_to_camel

        ! float TextToFloat(const char *text)
        function text_to_float(text) bind(c, name='TextToFloat')
            import :: c_char, c_float
            implicit none
            character(kind=c_char), intent(in) :: text
            real(kind=c_float)                 :: text_to_float
        end function text_to_float

        ! int TextToInteger(const char *text)
        function text_to_integer(text) bind(c, name='TextToInteger')
            import :: c_char, c_int
            implicit none
            character(kind=c_char), intent(in) :: text
            integer(kind=c_int)                :: text_to_integer
        end function text_to_integer

        ! const char *TextToLower(const char *text)
        function text_to_lower(text) bind(c, name='TextToLower')
            import :: c_char, c_ptr
            implicit none
            character(kind=c_char), intent(in) :: text
            type(c_ptr)                        :: text_to_lower
        end function text_to_lower

        ! const char *TextToPascal(const char *text)
        function text_to_pascal(text) bind(c, name='TextToPascal')
            import :: c_char, c_ptr
            implicit none
            character(kind=c_char), intent(in) :: text
            type(c_ptr)                        :: text_to_pascal
        end function text_to_pascal

        ! const char *TextToSnake(const char *text)
        function text_to_snake(text) bind(c, name='TextToSnake')
            import :: c_char, c_ptr
            implicit none
            character(kind=c_char), intent(in) :: text
            type(c_ptr)                        :: text_to_snake
        end function text_to_snake

        ! const char *TextToUpper(const char *text)
        function text_to_upper(text) bind(c, name='TextToUpper')
            import :: c_char, c_ptr
            implicit none
            character(kind=c_char), intent(in) :: text
            type(c_ptr)                        :: text_to_upper
        end function text_to_upper

        ! void ToggleBorderlessWindowed(void)
        subroutine toggle_borderless_windowed() bind(c, name='ToggleBorderlessWindowed')
        end subroutine toggle_borderless_windowed

        ! void ToggleFullscreen(void)
        subroutine toggle_fullscreen() bind(c, name='ToggleFullscreen')
        end subroutine toggle_fullscreen

        ! void TraceLog(int logLevel, const char *text)
        subroutine trace_log(log_level, text) bind(c, name='TraceLog')
            import :: c_char, c_int
            implicit none
            integer(kind=c_int),    intent(in), value :: log_level
            character(kind=c_char), intent(in)        :: text
        end subroutine trace_log

        ! void UnloadAudioStream(AudioStream stream)
        subroutine unload_audio_stream(stream) bind(c, name='UnloadAudioStream')
            import :: audio_stream_type
            implicit none
            type(audio_stream_type), intent(in), value :: stream
        end subroutine unload_audio_stream

        ! void UnloadCodepoints(int *codepoints)
        subroutine unload_codepoints(codepoints) bind(c, name='UnloadCodepoints')
            import :: c_int
            implicit none
            integer(kind=c_int), intent(inout) :: codepoints(*)
        end subroutine unload_codepoints

        ! void UnloadDirectoryFiles(FilePathList files)
        subroutine unload_directory_files(files) bind(c, name='UnloadDirectoryFiles')
            import :: file_path_list_type
            implicit none
            type(file_path_list_type), intent(in), value :: files
        end subroutine unload_directory_files

        ! void UnloadDroppedFiles(FilePathList files)
        subroutine unload_dropped_files(files) bind(c, name='UnloadDroppedFiles')
            import :: file_path_list_type
            implicit none
            type(file_path_list_type), intent(in), value :: files
        end subroutine unload_dropped_files

        ! void UnloadFileData(unsigned char *data)
        subroutine unload_file_data(data) bind(c, name='UnloadFileData')
            import :: c_unsigned_char
            implicit none
            integer(kind=c_unsigned_char), intent(in) :: data
        end subroutine unload_file_data

        ! void UnloadFileText(char *text)
        subroutine unload_file_text(text) bind(c, name='UnloadFileText')
            import :: c_char
            implicit none
            character(kind=c_char), intent(in) :: text
        end subroutine unload_file_text

        ! void UnloadFont(Font font)
        subroutine unload_font(font) bind(c, name='UnloadFont')
            import :: font_type
            implicit none
            type(font_type), intent(in), value :: font
        end subroutine unload_font

        ! void UnloadFontData(GlyphInfo *glyphs, int glyphCount)
        subroutine unload_font_data(glyphs, glyph_count) bind(c, name='UnloadFontData')
            import :: c_int, glyph_info_type
            implicit none
            type(glyph_info_type), intent(inout)     :: glyphs
            integer(kind=c_int),   intent(in), value :: glyph_count
        end subroutine unload_font_data

        ! void UnloadImage(Image image)
        subroutine unload_image(image) bind(c, name='UnloadImage')
            import :: image_type
            implicit none
            type(image_type), intent(in), value :: image
        end subroutine unload_image

        ! void UnloadImageColors(Color *colors)
        subroutine unload_image_colors(colors) bind(c, name='UnloadImageColors')
            import :: color_type
            implicit none
            type(color_type), intent(inout) :: colors(*)
        end subroutine unload_image_colors

        ! void UnloadImagePalette(Color *colors)
        subroutine unload_image_palette(colors) bind(c, name='UnloadImagePalette')
            import :: color_type
            implicit none
            type(color_type), intent(inout) :: colors(*)
        end subroutine unload_image_palette

        ! void UnloadMaterial(Material material)
        subroutine unload_material(material) bind(c, name='UnloadMaterial')
            import :: material_type
            implicit none
            type(material_type), intent(in), value :: material
        end subroutine unload_material

        ! void UnloadMesh(Mesh mesh)
        subroutine unload_mesh(mesh) bind(c, name='UnloadMesh')
            import :: mesh_type
            implicit none
            type(mesh_type), intent(in), value :: mesh
        end subroutine unload_mesh

        ! void UnloadModel(Model model)
        subroutine unload_model(model) bind(c, name='UnloadModel')
            import :: model_type
            implicit none
            type(model_type), intent(in), value :: model
        end subroutine unload_model

        ! void UnloadModelAnimation(ModelAnimation anim)
        subroutine unload_model_animation(anim) bind(c, name='UnloadModelAnimation')
            import :: model_animation_type
            implicit none
            type(model_animation_type), intent(in), value :: anim
        end subroutine unload_model_animation

        ! void UnloadModelAnimations(ModelAnimation *animations, int count)
        subroutine unload_model_animations(animations, count) bind(c, name='UnloadModelAnimations')
            import :: c_int, model_animation_type
            implicit none
            type(model_animation_type), intent(inout)     :: animations(*)
            integer(kind=c_int),        intent(in), value :: count
        end subroutine unload_model_animations

        ! void UnloadMusicStream(Music music)
        subroutine unload_music_stream(music) bind(c, name='UnloadMusicStream')
            import :: music_type
            implicit none
            type(music_type), intent(in), value :: music
        end subroutine unload_music_stream

        ! void UnloadRandomSequence(int *sequence)
        subroutine unload_random_sequence(sequence) bind(c, name='UnloadRandomSequence')
            import :: c_int
            implicit none
            integer(kind=c_int), intent(inout) :: sequence(*)
        end subroutine unload_random_sequence

        ! void UnloadRenderTexture(RenderTexture2D target)
        subroutine unload_render_texture(target) bind(c, name='UnloadRenderTexture')
            import :: render_texture2d_type
            implicit none
            type(render_texture2d_type), intent(in), value :: target
        end subroutine unload_render_texture

        ! void UnloadShader(Shader shader)
        subroutine unload_shader(shader) bind(c, name='UnloadShader')
            import :: shader_type
            implicit none
            type(shader_type), intent(in), value :: shader
        end subroutine unload_shader

        ! void UnloadSound(Sound sound)
        subroutine unload_sound(sound) bind(c, name='UnloadSound')
            import :: sound_type
            implicit none
            type(sound_type), intent(in), value :: sound
        end subroutine unload_sound

        ! void UnloadSoundAlias(Sound alias)
        subroutine unload_sound_alias(alias) bind(c, name='UnloadSoundAlias')
            import :: sound_type
            implicit none
            type(sound_type), intent(in), value :: alias
        end subroutine unload_sound_alias

        ! void UnloadTexture(Texture2D texture)
        subroutine unload_texture(texture) bind(c, name='UnloadTexture')
            import :: texture2d_type
            implicit none
            type(texture2d_type), intent(in), value :: texture
        end subroutine unload_texture

        ! void UnloadUTF8(char *text)
        subroutine unload_utf8(text) bind(c, name='UnloadUTF8')
            import :: c_char
            implicit none
            character(kind=c_char), intent(in) :: text
        end subroutine unload_utf8

        ! void UnloadVrStereoConfig(VrStereoConfig config)
        subroutine unload_vr_stereo_config(config) bind(c, name='UnloadVrStereoConfig')
            import :: vr_stereo_config_type
            implicit none
            type(vr_stereo_config_type), intent(in), value :: config
        end subroutine unload_vr_stereo_config

        ! void UnloadWave(Wave wave)
        subroutine unload_wave(wave) bind(c, name='UnloadWave')
            import :: wave_type
            implicit none
            type(wave_type), intent(in), value :: wave
        end subroutine unload_wave

        ! void UnloadWaveSamples(float *samples)
        subroutine unload_wave_samples(samples) bind(c, name='UnloadWaveSamples')
            import :: c_float
            implicit none
            real(kind=c_float), intent(inout) :: samples(*)
        end subroutine unload_wave_samples

        ! void UpdateAudioStream(AudioStream stream, const void *data, int frameCount)
        subroutine update_audio_stream(stream, data, frame_count) bind(c, name='UpdateAudioStream')
            import :: audio_stream_type, c_int, c_ptr
            implicit none
            type(audio_stream_type), intent(in), value :: stream
            type(c_ptr),             intent(in), value :: data
            integer(kind=c_int),     intent(in), value :: frame_count
        end subroutine update_audio_stream

        ! void UpdateCamera(Camera *camera, int mode)
        subroutine update_camera(camera, mode) bind(c, name='UpdateCamera')
            import :: camera3d_type, c_int
            implicit none
            type(camera3d_type), intent(inout)     :: camera
            integer(kind=c_int), intent(in), value :: mode
        end subroutine update_camera

        ! void UpdateMeshBuffer(Mesh mesh, int index, const void *data, int dataSize, int offset)
        subroutine update_mesh_buffer(mesh, index, data, data_size, offset) bind(c, name='UpdateMeshBuffer')
            import :: c_int, c_ptr, mesh_type
            implicit none
            type(mesh_type),     intent(in), value :: mesh
            integer(kind=c_int), intent(in), value :: index
            type(c_ptr),         intent(in), value :: data
            integer(kind=c_int), intent(in), value :: data_size
            integer(kind=c_int), intent(in), value :: offset
        end subroutine update_mesh_buffer

        ! void UpdateModelAnimation(Model model, ModelAnimation anim, int frame)
        subroutine update_model_animation(model, anim, frame) bind(c, name='UpdateModelAnimation')
            import :: c_int, model_animation_type, model_type
            implicit none
            type(model_type),           intent(in), value :: model
            type(model_animation_type), intent(in), value :: anim
            integer(kind=c_int),        intent(in), value :: frame
        end subroutine update_model_animation

        ! void UpdateMusicStream(Music music)
        subroutine update_music_stream(music) bind(c, name='UpdateMusicStream')
            import :: music_type
            implicit none
            type(music_type), intent(in), value :: music
        end subroutine update_music_stream

        ! void UpdateSound(Sound sound, const void *data, int sampleCount)
        subroutine update_sound(sound, data, sample_count) bind(c, name='UpdateSound')
            import :: c_int, c_ptr, sound_type
            implicit none
            type(sound_type),    intent(in), value :: sound
            type(c_ptr),         intent(in), value :: data
            integer(kind=c_int), intent(in), value :: sample_count
        end subroutine update_sound

        ! void UpdateTexture(Texture2D texture, const void *pixels)
        subroutine update_texture(texture, pixels) bind(c, name='UpdateTexture')
            import :: c_ptr, texture2d_type
            implicit none
            type(texture2d_type), intent(in), value :: texture
            type(c_ptr),          intent(in), value :: pixels
        end subroutine update_texture

        ! void UpdateTextureRec(Texture2D texture, Rectangle rec, const void *pixels)
        subroutine update_texture_rec(texture, rec, pixels) bind(c, name='UpdateTextureRec')
            import :: c_ptr, rectangle_type, texture2d_type
            implicit none
            type(texture2d_type), intent(in), value :: texture
            type(rectangle_type), intent(in), value :: rec
            type(c_ptr),          intent(in), value :: pixels
        end subroutine update_texture_rec

        ! void UploadMesh(Mesh *mesh, bool dynamic)
        subroutine upload_mesh(mesh, dynamic) bind(c, name='UploadMesh')
            import :: c_bool, mesh_type
            implicit none
            type(mesh_type),      intent(inout)     :: mesh
            logical(kind=c_bool), intent(in), value :: dynamic
        end subroutine upload_mesh

        ! void WaitTime(double seconds)
        subroutine wait_time(seconds) bind(c, name='WaitTime')
            import :: c_double
            implicit none
            real(kind=c_double), intent(in), value :: seconds
        end subroutine wait_time

        ! Wave WaveCopy(Wave wave)
        function wave_copy(wave) bind(c, name='WaveCopy')
            import :: wave_type
            implicit none
            type(wave_type), intent(in), value :: wave
            type(wave_type)                    :: wave_copy
        end function wave_copy

        ! void WaveCrop(Wave *wave, int initSample, int finalSample)
        subroutine wave_crop(wave, init_sample, final_sample) bind(c, name='WaveCrop')
            import :: c_int, wave_type
            implicit none
            type(wave_type),     intent(in)        :: wave
            integer(kind=c_int), intent(in), value :: init_sample
            integer(kind=c_int), intent(in), value :: final_sample
        end subroutine wave_crop

        ! void WaveFormat(Wave *wave, int sampleRate, int sampleSize, int channels)
        subroutine wave_format(wave, sample_rate, sample_size, channels) bind(c, name='WaveFormat')
            import :: c_int, wave_type
            implicit none
            type(wave_type),     intent(in)        :: wave
            integer(kind=c_int), intent(in), value :: sample_rate
            integer(kind=c_int), intent(in), value :: sample_size
            integer(kind=c_int), intent(in), value :: channels
        end subroutine wave_format

        ! bool WindowShouldClose(void)
        function window_should_close() bind(c, name='WindowShouldClose')
            import :: c_bool
            implicit none
            logical(kind=c_bool) :: window_should_close
        end function window_should_close
    end interface
contains
    pure elemental real function deg2rad(d) result(r)
        real, intent(in) :: d

        r = d * (PI / 180.0)
    end function deg2rad

    pure elemental real function rad2deg(r) result(d)
        real, intent(in) :: r

        d = r * (180.0 / PI)
    end function rad2deg
end module raylib
