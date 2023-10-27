ffi.cdef[[
    void keybd_event(unsigned char bVk, unsigned char bScan, int dwFlags, int dwExtraInfo);
    int MapVirtualKeyA(int uCode, int uMapType);
    short GetAsyncKeyState(int vKey);
    short GetKeyState(int nVirtKey);

    typedef struct { int x, y; } POINT;
    void* GetDesktopWindow();
    int SetCursorPos(int x, int y);
    int GetCursorPos(POINT* lpPoint);
    int ShowCursor(int bShow);

    typedef unsigned int UINT;
    void* GetForegroundWindow(void);
    int GetWindowTextA(void* hWnd, char* lpString, int nMaxCount);
    void* GetModuleHandleA(const char* lpModuleName);
    UINT GetModuleFileNameA(void* hModule, char* lpFilename, UINT nSize);
    int MessageBoxA(void* hWnd, const char* lpText, const char* lpCaption, UINT uType);

    typedef struct {
        int32_t width;
        int32_t height;
    } ScreenSize;
    void* GetDC(void*);
    int32_t GetDeviceCaps(void*, int32_t);
    int32_t ReleaseDC(void*, void*);

    typedef struct tagPOINT {
        long  x;
        long  y;
    } POINT, *PPOINT, *LPPOINT;
    typedef struct tagMSG {
        void*         hwnd;
        unsigned int  message;
        unsigned int  wParam;
        unsigned long lParam;
        unsigned long time;
        POINT         pt;
        unsigned long lPrivate;
    } MSG, *PMSG, *LPMSG;
    int PeekMessageA(LPMSG lpMsg, void* hWnd, unsigned int wMsgFilterMin, unsigned int wMsgFilterMax, unsigned int wRemoveMsg);

    void* CreateFileA(
        const char*                lpFileName,
        unsigned long                 dwDesiredAccess,
        unsigned long                 dwShareMode,
        unsigned long lpSecurityAttributes,
        unsigned long                 dwCreationDisposition,
        unsigned long                 dwFlagsAndAttributes,
        void*                hTemplateFile
    );
    bool ReadFile(
        void*       hFile,
        char*       lpBuffer,
        unsigned long        nNumberOfBytesToRead,
        unsigned long*      lpNumberOfBytesRead,
        int lpOverlapped
    );
    bool WriteFile(
        void*       hFile,
        char*      lpBuffer,
        unsigned long        nNumberOfBytesToWrite,
        unsigned long*      lpNumberOfBytesWritten,
        void* lpOverlapped
    );
    bool DeleteFileA(
        const char*                lpFileName
    );
    unsigned long GetFileSize(
        void*  hFile,
        unsigned long* lpFileSizeHigh
    );
    bool CreateDirectoryA(
        const char*                lpPathName,
        void* lpSecurityAttributes
    );
    void* CloseHandle(void *hFile);
    typedef int(__fastcall* clantag_t)(const char*, const char*);
    typedef struct _OVERLAPPED {
        unsigned long* Internal;
        unsigned long* InternalHigh;
        union {
            struct {
            unsigned long Offset;
            unsigned long OffsetHigh;
            } DUMMYSTRUCTNAME;
            void* Pointer;
        } DUMMYUNIONNAME;
        void*    hEvent;
    } OVERLAPPED, *LPOVERLAPPED;
    typedef struct _class
    {
        void** this;
    }aclass;

    uintptr_t GetClipboardData(uint32_t uFormat);
    int IsClipboardFormatAvailable(uint32_t format);
    bool OpenClipboard(void* hWndNewOwner);
    bool EmptyClipboard();
    bool CloseClipboard();
    uintptr_t GlobalAlloc(uint32_t uFlags, size_t dwBytes);
    void* GlobalLock(uintptr_t hMem);
    bool GlobalUnlock(uintptr_t hMem);
    void* lstrcpyA(void* lpString1, const char* lpString2);
    bool SetClipboardData(uint32_t uFormat, uintptr_t hMem);

    void* __stdcall ShellExecuteA(void* hwnd, const char* op, const char* file, const char* params, const char* dir, int show_cmd);
    typedef void(__thiscall* find_or_load_model_t)(void*, const char*);
    typedef long(__thiscall* get_file_time_t)(void* this, const char* pFileName, const char* pPathID);
    typedef bool(__thiscall* file_exists_t)(void* this, const char* pFileName, const char* pPathID);
    typedef const char* LPCSTR;
    enum{
        MB_OK = 0x00000000L,
        MB_ICONINFORMATION = 0x00000040L
    };
    void* __stdcall URLDownloadToFileA(void* LPUNKNOWN, const char* LPCSTR, const char* LPCSTR2, int a, int LPBINDSTATUSCALLBACK);
    bool DeleteUrlCacheEntryA(const char* lpszUrlName);
    typedef uint64_t SteamAPICall_t;
    struct SteamAPI_callback_base_vtbl {
        void(__thiscall *run1)(struct SteamAPI_callback_base *, void *, bool, uint64_t);
        void(__thiscall *run2)(struct SteamAPI_callback_base *, void *);
        int(__thiscall *get_size)(struct SteamAPI_callback_base *);
    };
    struct SteamAPI_callback_base {
        struct SteamAPI_callback_base_vtbl *vtbl;
        uint8_t flags;
        int id;
        uint64_t api_call_handle;
        struct SteamAPI_callback_base_vtbl vtbl_storage[1];
    };//hwid

    typedef void*(__thiscall* c_entity_list_get_client_entity_t)(void*, int);
	struct c_color { unsigned char clr[4]; };
    struct WeaponInfo_t {
        char _0x0000[20];
        __int32 max_clip;
        char _0x0018[12];
        __int32 max_reserved_ammo;
        char _0x0028[96];
        char* hud_name;
        char* weapon_name;
        char _0x0090[60];
        __int32 type;
        __int32 price;
        __int32 reward;
        char _0x00D8[20];
        bool full_auto;
        char _0x00ED[3];
        __int32 damage;
        float armor_ratio;
        __int32 bullets;
        float penetration;
        char _0x0100[8];
        float range;
        float range_modifier;
        char _0x0110[16];
        bool silencer;
        char _0x0121[15];
        float max_speed;
        float max_speed_alt;
        char _0x0138[76];
        __int32 recoil_seed;
        char _0x0188[32];
    };
    struct pose_params_t {
        char pad[8];
        float     m_flStart;
        float     m_flEnd;
        float     m_flState;
    };
]]
function notify(...)
    return client.notify(tostring(...))
end
vk = {}
keydown = {}
function keydown.is_key_clicked(virtualKey)
    vk[virtualKey] = vk[virtualKey] or ffi.C.GetAsyncKeyState(virtualKey)
    return bit.band(vk[virtualKey], 1) == 1
end
function keydown.is_key_pressed(virtualKey)
    vk[virtualKey] = vk[virtualKey] or ffi.C.GetAsyncKeyState(virtualKey)
    return bit.band(vk[virtualKey], 32768) == 32768
end
function keydown.get_key_coded(presclik)
    for i = 0, 255 do
        if (presclik==1 and keydown.is_key_clicked(i)) or (presclik==2 and keydown.is_key_pressed(i)) then
            return i
        end
    end
    return nil
end
function map_virtual_key_to_ascii(virtualKey)
    if virtualKey >= 65 and virtualKey <= 90 then -- 大写字母 A-Z
        return virtualKey + 32 -- 将虚拟键码转换为对应的小写字母的ASCII码
    else
        return virtualKey
    end
end
function keydown.get_key_code()
    for i = 0, 255 do
        if keydown.is_key_pressed(i) or keydown.is_key_clicked(i) then
            return string.format("0x%02X", map_virtual_key_to_ascii(i))
        end
    end
    return nil
end
client.register_callback("frame_stage_notify", function()
    for k, _ in pairs(vk)do
        vk[k] = nil
    end
end)
function simulate_is_Key_clicked(vkCode)
    ffi.C.keybd_event(vkCode, ffi.C.MapVirtualKeyA(vkCode, 0), 0x0000, 0)
    ffi.C.keybd_event(vkCode, ffi.C.MapVirtualKeyA(vkCode, 0), 0x0002, 0)
end
function decimalToHex(decimal)
    local hexDigits = "0123456789ABCDEF"
    local hexString = ""
    while decimal > 0 do
        local remainder = decimal % 16
        hexString = hexDigits:sub(remainder+1, remainder+1) .. hexString
        decimal = math.floor(decimal / 16)
    end
    return hexString
end
function decimalToKeycode(vkCode)
    return tonumber(string.format("%#04x", vkCode))
end
function math_lerp(a, b, t) return a + (b - a) * t end
function math_lerp2(a, b, t) return (1 - t) * a + t * b end
UrlMon = ffi.load('UrlMon')
user32 = ffi.load("user32")
WiniNet = ffi.load('WinInet')
user32 = ffi.load("user32")
kernel32 = ffi.load("kernel32")
wintitle = ffi.new("char[?]", 256)-- 获取窗口标题
function is_csgo()
    local hWnd = user32.GetForegroundWindow()-- 获取当前窗口句柄
    user32.GetWindowTextA(hWnd, wintitle, 256)
    -- client.notify("当前窗口标题："..ffi.string(wintitle))
    -- window 显示为 "Counter-Strike: Global Offensive - Direct3D 9"
    -- macOS  显示为 "Counter-Strike: Global Offensive - Metal"
    -- Linux  显示为 "Counter-Strike: Global Offensive - Vulkan"。
    return (string.sub(ffi.string(wintitle), 1, 32))== "Counter-Strike: Global Offensive"
end
function retrieveClipboardText()
    ffi.C.OpenClipboard(nil)
    if ffi.C.IsClipboardFormatAvailable(1) ~= 0 then
        local hClipboardData = ffi.C.GetClipboardData(1)
        local pClipboardText = ffi.cast("const char*", ffi.C.GlobalLock(hClipboardData))
        if pClipboardText ~= nil then
            local clipboardText = ffi.string(pClipboardText)
            ffi.C.GlobalUnlock(hClipboardData)
            ffi.C.CloseClipboard()
            return clipboardText
        end
        ffi.C.GlobalUnlock(hClipboardData)
    end
    ffi.C.CloseClipboard()
    return nil
end
function setClipboardText(text)
    ffi.C.OpenClipboard(nil)
    ffi.C.EmptyClipboard()
    local size = #text + 1
    local hMem = ffi.C.GlobalAlloc(0x0002, size)
    local mem = ffi.C.GlobalLock(hMem)
    ffi.C.lstrcpyA(mem, text)
    ffi.C.GlobalUnlock(hMem)
    ffi.C.SetClipboardData(1, hMem)
    ffi.C.CloseClipboard()
end
function cursor_pos(min_x, min_y, max_x, max_y)
    local cursor = renderer.get_cursor_pos()
    return ((cursor.x >= min_x) and (cursor.x <= max_x)) and ((cursor.y >= min_y) and (cursor.y <= max_y))
end
function ui_menu_drag(x, y, z, w, xmenu, ymenu, item)
    local cursor = renderer.get_cursor_pos()
	if (cursor.x >= x) and (cursor.x <= z) and (cursor.y >= y) and (cursor.y <= w) then
		if keydown.is_key_pressed(0x01) and item[1] == 0 then
			item[1] = 1
			item[2] = xmenu:get_value()- cursor.x
			item[3] = ymenu:get_value()- cursor.y
		end
	end
	if not keydown.is_key_pressed(0x01) then item[1] = 0 end
	if item[1] == 1 then
		xmenu:set_value(cursor.x + item[2])
		ymenu:set_value(cursor.y + item[3])
	end
end
function ui_menu_single_drag(x, y, z, w, x_or_y, menu, item)
    local cursor = renderer.get_cursor_pos()
    if (cursor.x >= x) and (cursor.x <= z) and (cursor.y >= y) and (cursor.y <= w) then
        if keydown.is_key_pressed(0x01) and item[1] == false then
            item[1] = true
            item[2] = menu:get_value()-((x_or_y == "x" and cursor.x) or (x_or_y == "y" and cursor.y))
        end
    end
    if not keydown.is_key_pressed(0x01) then item[1] = false end
    if item[1] == true then
        if x_or_y == "x" then
            menu:set_value( cursor.x+item[2] )
        elseif x_or_y == "y" then
            menu:set_value( cursor.y+item[2] )
        end
    end
end
function getScreenSize()
    local screenSize = ffi.new("ScreenSize")
    local desktopWindow = ffi.C.GetDesktopWindow()
    local dc = ffi.C.GetDC(desktopWindow)
    screenSize.width = ffi.C.GetDeviceCaps(dc, 8)
    screenSize.height = ffi.C.GetDeviceCaps(dc, 10)
    ffi.C.ReleaseDC(desktopWindow, dc)
    return screenSize
end
function FindMax(floats)
    local result = floats[1]
    for i = 1, #floats do
        local value = floats[i]
        if value > result then
            result = value
        end
    end
    return result
end
function FindMin(floats)
    local result = floats[1]
    for i = 1, #floats do
        local value = floats[i]
        if value < result then
            result = value
        end
    end
    return result
end
function toHex(color)
    return string.format("#%02X%02X%02X%02X", color.red*255, color.green*255, color.blue*255, color.alpha*255)
end
function ToRGBA(color)
    return color.red*255, color.green*255, color.blue*255, color.alpha*255
end
function hexToRGB(hex)
    hex = hex:gsub("#","")
    local red   = tonumber(hex:sub(1, 2), 16)
    local green = tonumber(hex:sub(3, 4), 16)
    local blue  = tonumber(hex:sub(5, 6), 16)
    local alpha = tonumber(hex:sub(7, 8), 16)
    return red, green, blue, alpha
end
function RGBToHSV(r, g, b, a)
    local r, g, b = r/255, g/255, b/255
    local max, min = FindMax({ r, g, b }), FindMin({ r, g, b })
    local h, s, v
    v = max
    if max == 0 then s = 0 else s = 1 - min / max end
    if max - min == 0 then
        h = 0
    elseif max == g then
        h = (b - r) * 60 / (max - min) + 120
    elseif max == b then
        h = (r - g) * 60 / (max - min) + 240
    else
        h = (g - b) * 60 / (max - min)
        if b > g then
            h = h + 360
        end
    end
    return h, s, v, a
end
function HSVToRGB(h, s, v, a)
    local r, g, b
    local c = v * s
    local x = c * (1 - math.abs((h / 60) % 2 - 1))
    local m = v - c
    if h < 60 then
        r, g, b = c, x, 0
    elseif h < 120 then
        r, g, b = x, c, 0
    elseif h < 180 then
        r, g, b = 0, c, x
    elseif h < 240 then
        r, g, b = 0, x, c
    elseif h < 300 then
        r, g, b = x, 0, c
    else
        r, g, b = c, 0, x
    end
    return (r + m)*255, (g + m)*255, (b + m)*255, a
end
function hsv2rgb(h, s, v, a)
    local r, g, b
    local i = math.floor(h * 6);
    local f = h * 6 - i;
    local p = v * (1 - s);
    local q = v * (1 - f * s);
    local t = v * (1 - (1 - f) * s);
    i = i % 6
    if i == 0 then r, g, b = v, t, p
    elseif i == 1 then r, g, b = q, v, p
    elseif i == 2 then r, g, b = p, v, t
    elseif i == 3 then r, g, b = p, q, v
    elseif i == 4 then r, g, b = t, p, v
    elseif i == 5 then r, g, b = v, p, q
    end
    return color_t.new(r * 255, g * 255, b * 255, a * 255)
end
function vecchange(vec, to)
    if to == 2 then
        return vec2_t.new(vec.x, vec.y)
    elseif to == 3 then
        return vec3_t.new(vec.x, vec.y, vec.z)
    end
end
function gettable_text(tbr)--简易table.insert
    local numbertable = {}
    if not tbr:match("-?%d+") then return end
    for _ in tbr:gmatch("-?%d+") do table.insert(numbertable, tonumber(_)) end
    return numbertable -- 返回 numbertable
end
function isscoped()
    return entitylist.get_local_player():get_prop_bool(se.get_netvar('DT_CSPlayer', 'm_bIsScoped'))
end
netvars = {
    m_hmyweapons = 0x2E08,
    m_hactiveweapon = 0x2F08,
    m_iobservermode = 0x3388,
    m_hobservertarget = 0x339C,
    m_iitemdefinitionindex = 0x2FBA,
    m_vecorigin = se.get_netvar("DT_BaseEntity", "m_vecOrigin"),
    m_vinitialvelocity = se.get_netvar( "DT_BaseCSGrenadeProjectile", "m_vInitialVelocity" ),
    m_dmgradius = se.get_netvar("DT_BaseGrenade", "m_DmgRadius"),
    m_ihealth = se.get_netvar("DT_BasePlayer", "m_iHealth"),
    m_vecVelocity = {
        [0] = se.get_netvar("DT_BasePlayer", "m_vecVelocity[0]"),
        [1] = se.get_netvar("DT_BasePlayer", "m_vecVelocity[1]"),
    },
    m_fflags = se.get_netvar("DT_BasePlayer", "m_fFlags"),
    m_iteamnum = se.get_netvar("DT_BaseEntity", "m_iTeamNum"),
    m_flnextprimaryattack = se.get_netvar("DT_BaseCombatWeapon", "m_flNextPrimaryAttack"),
    m_ntickbase = se.get_netvar("DT_BasePlayer", "m_nTickBase"),
    m_iclip1 = se.get_netvar("DT_BaseCombatWeapon", "m_iClip1"),
    m_fthrowtime = se.get_netvar("DT_BaseCSGrenade", "m_fThrowTime"),
    m_bpinpulled = se.get_netvar("DT_BaseCSGrenade", "m_bPinPulled"),
    m_nrendermode = se.get_netvar("DT_BaseEntity", "m_nRenderMode"),
    m_bdidsmokeeffect = se.get_netvar("DT_SmokeGrenadeProjectile", "m_bDidSmokeEffect"),
    m_nsmokeeffecttickbegin = se.get_netvar("DT_SmokeGrenadeProjectile", "m_nSmokeEffectTickBegin"),
    m_nfireeffecttickbegin  = se.get_netvar("DT_Inferno", "m_nFireEffectTickBegin"),
    m_bfireisburning = se.get_netvar("DT_Inferno", "m_bFireIsBurning"),
    m_firecount = se.get_netvar("DT_Inferno", "m_fireCount"),
    m_firexdelta = se.get_netvar("DT_Inferno", "m_fireXDelta"),
    m_fireydelta = se.get_netvar("DT_Inferno", "m_fireYDelta"),
    m_firezdelta = se.get_netvar("DT_Inferno", "m_fireZDelta"),
    m_flvelocitymodifier = se.get_netvar("DT_CSPlayer", "m_flVelocityModifier"),
    m_vecviewoffset = se.get_netvar("DT_BasePlayer", "m_vecViewOffset[0]"),
    m_hactiveweapon = se.get_netvar("DT_BaseCombatCharacter", "m_hActiveWeapon"),
    m_flduckamount = se.get_netvar("DT_BasePlayer", "m_flDuckAmount"),
    m_armorvalue = se.get_netvar("DT_CSPlayer", "m_ArmorValue"),--71628
    m_bhashelmet = se.get_netvar("DT_CSPlayer", "m_bHasHelmet"),--71616
    m_bhasdefuser = 0x117DC,--se.get_netvar("DT_CSPlayer", "m_bHasDefuser"),--0x117DC
    m_bisdefusing = 0x997C,--se.get_netvar("DT_CSPlayer", "m_bIsDefusing"),--0x997C
    m_hownerentity = 0x14C,--se.get_netvar("DT_BasePlayer", "m_hOwnerEntity"),--0x14C
    m_icompteammatecolor = se.get_netvar("DT_CSPlayerResource", "m_iCompTeammateColor"),
    m_ionlyteamtovote = se.get_netvar("DT_VoteController", "m_iOnlyTeamToVote"),
    m_iactiveissueindex = se.get_netvar("DT_VoteController", "m_iActiveIssueIndex"),
    m_flc4blow = se.get_netvar( "DT_PlantedC4", "m_flC4Blow" ),
    m_fldefusecountdown = se.get_netvar( "DT_PlantedC4", "m_flDefuseCountDown" ),
    m_fltimerlength = se.get_netvar( "DT_PlantedC4", "m_flTimerLength" ),
    m_hbombdefuser = se.get_netvar( "DT_PlantedC4", "m_hBombDefuser" ),
    m_bstartedarming = se.get_netvar( "DT_WeaponC4", "m_bStartedArming" ),
    m_farmedtime = se.get_netvar( "DT_WeaponC4", "m_fArmedTime" ),
    m_bombsitecenterA = se.get_netvar( "DT_CSPlayerResource", "m_bombsiteCenterA" ),
    m_bombsitecenterB = se.get_netvar( "DT_CSPlayerResource", "m_bombsiteCenterB" ),
    m_hownerentity = se.get_netvar( "DT_BaseEntity", "m_hOwnerEntity" ),
    m_flSimulationTime = se.get_netvar("DT_BaseEntity", "m_flSimulationTime"),
    m_flOldSimulationTime = se.get_netvar("DT_BaseEntity", "m_flSimulationTime") + 0x4,
}
convars = {
    cl_forwardspeed = se.get_convar('cl_forwardspeed'),
    cl_sidespeed = se.get_convar('cl_sidespeed'),
    sv_gravity = se.get_convar('sv_gravity'),
    molotov_throw_detonate_time = se.get_convar('molotov_throw_detonate_time'),
    maxspeed = se.get_convar('sv_maxspeed'),
    nospread = se.get_convar("weapon_accuracy_nospread"),
}
ui_find = {--cheat本体按键
pistols_hitchance = ui.get_slider_int("rage_pistols_hitchance"),
deagle_hitchance = ui.get_slider_int("rage_deagle_hitchance"),
revolver_hitchance = ui.get_slider_int("rage_revolver_hitchance"),
smg_hitchance = ui.get_slider_int("rage_smg_hitchance"),
rifle_hitchance = ui.get_slider_int("rage_rifle_hitchance"),
shotguns_hitchance = ui.get_slider_int("rage_shotguns_hitchance"),
scout_hitchance = ui.get_slider_int("rage_scout_hitchance"),
auto_hitchance = ui.get_slider_int("rage_auto_hitchance"),
awp_hitchance = ui.get_slider_int("rage_awp_hitchance"),
    hitchance = {
        pistols  = ui.get_slider_int("rage_pistols_hitchance"),
        deagle   = ui.get_slider_int("rage_deagle_hitchance"),
        revolver = ui.get_slider_int("rage_revolver_hitchance"),
        smg      = ui.get_slider_int("rage_smg_hitchance"),
        rifl     = ui.get_slider_int("rage_rifle_hitchance"),
        shotguns = ui.get_slider_int("rage_shotguns_hitchance"),
        scout    = ui.get_slider_int("rage_scout_hitchance"),
        auto     = ui.get_slider_int("rage_auto_hitchance"),
        awp      = ui.get_slider_int("rage_awp_hitchance"),
    },
    rage_enable = ui.get_check_box('rage_enable'),
    rage_enable_bind = ui.get_key_bind('rage_enable_bind'),
    dt = {
        box  = ui.get_check_box("rage_doubletap"),
        bind = ui.get_key_bind("rage_doubletap_bind"),
    },
    hs = {
        box  = ui.get_check_box("rage_hide_shots"),
        bind = ui.get_key_bind("rage_hide_shots_bind"),
    },
    yawset = ui.get_combo_box("antihit_antiaim_yaw"),
    pitchset = ui.get_combo_box("antihit_antiaim_pitch"),
    at_targets = ui.get_check_box("antihit_antiaim_at_targets"),
    jitterslider = ui.get_slider_int("antihit_antiaim_yaw_jitter"),
    desyncflip_bind = ui.get_key_bind("antihit_antiaim_flip_bind"),
    desyncslider = ui.get_slider_int("antihit_antiaim_desync_length"),
    desynctype = ui.get_combo_box("antihit_antiaim_desync_type"),
    desyncrollslider = ui.get_slider_int("antihit_antiaim_desync_roll"),
    desyncrollpitchslider = ui.get_slider_int("antihit_antiaim_desync_roll_pitch"),
    duck = {
        box  = ui.get_check_box("antihit_fakeduck"),
        bind = ui.get_key_bind("antihit_fakeduck_bind"),
    },
    autopeek = {
        box  = ui.get_check_box("antihit_autopeek"),
        bind = ui.get_key_bind("antihit_autopeek_bind"),
    },
    slowwalk = {
        box  = ui.get_check_box("antihit_accurate_walk"),
        bind = ui.get_key_bind("antihit_accurate_walk_bind"),
    },
    time_in_dormant = ui.get_slider_float("visuals_esp_enemy_dormant"),
    pistols_hitchance = ui.get_slider_int("rage_pistols_hitchance"),
    ping_spike = ui.get_slider_int("misc_ping_spike_amount"),
    legmovement = ui.get_combo_box("antihit_leg_movement"),
}
