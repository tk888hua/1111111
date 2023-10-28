ffi.cdef[[
    void keybd_event(unsigned char bVk, unsigned char bScan, int dwFlags, int dwExtraInfo);
    int MapVirtualKeyA(int uCode, int uMapType);//模拟键盘按键
    short GetAsyncKeyState(int vKey);//获取建码
    short GetKeyState(int nVirtKey);//是否大写

    typedef struct { int x, y; } POINT;
    void* GetDesktopWindow();
    int SetCursorPos(int x, int y);//设置鼠标位置
    int GetCursorPos(POINT* lpPoint);//获取鼠标位置
    int ShowCursor(int bShow);//隐藏鼠标箭头

    typedef unsigned int UINT;
    void* GetForegroundWindow(void);//获取当前窗口句柄
    int GetWindowTextA(void* hWnd, char* lpString, int nMaxCount);//获取窗口标题
    void* GetModuleHandleA(const char* lpModuleName);//获取当前窗口所属的模块句柄
    UINT GetModuleFileNameA(void* hModule, char* lpFilename, UINT nSize);//获取模块文件名
    int MessageBoxA(void* hWnd, const char* lpText, const char* lpCaption, UINT uType);
	//int MessageBoxA(void *w   , const char *txt, const char *cap, int type);

    void* GetDC(void*);//屏幕尺寸
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
    int PeekMessageA(LPMSG lpMsg, void* hWnd, unsigned int wMsgFilterMin, unsigned int wMsgFilterMax, unsigned int wRemoveMsg);//滚轮检测

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

    uintptr_t GetClipboardData(uint32_t uFormat);//获取copy
    int IsClipboardFormatAvailable(uint32_t format);
    bool OpenClipboard(void* hWndNewOwner);
    bool EmptyClipboard();
    bool CloseClipboard();
    uintptr_t GlobalAlloc(uint32_t uFlags, size_t dwBytes);
    void* GlobalLock(uintptr_t hMem);
    bool GlobalUnlock(uintptr_t hMem);
    void* lstrcpyA(void* lpString1, const char* lpString2);
    bool SetClipboardData(uint32_t uFormat, uintptr_t hMem);

    void* __stdcall ShellExecuteA(void* hwnd, const char* op, const char* file, const char* params, const char* dir, int show_cmd);//hwid
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
    //typedef uint64_t SteamAPICall_t;
    //struct SteamAPI_callback_base_vtbl {
    //    void(__thiscall *run1)(struct SteamAPI_callback_base *, void *, bool, uint64_t);
    //    void(__thiscall *run2)(struct SteamAPI_callback_base *, void *);
    //    int(__thiscall *get_size)(struct SteamAPI_callback_base *);
    //};
    //struct SteamAPI_callback_base {
    //    struct SteamAPI_callback_base_vtbl *vtbl;
    //    uint8_t flags;
    //    int id;
    //    uint64_t api_call_handle;
    //    struct SteamAPI_callback_base_vtbl vtbl_storage[1];
    //};

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
function getScreenSize()
    local desktopWindow = ffi.C.GetDesktopWindow()
    local dc = ffi.C.GetDC(desktopWindow)
    local screenSize = vec2_t.new(ffi.C.GetDeviceCaps(dc, 8), ffi.C.GetDeviceCaps(dc, 10))
    ffi.C.ReleaseDC(desktopWindow, dc)
    return screenSize
end
msg = ffi.new("MSG")--获取鼠标滚轮
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
client.lib = {
    "1.0",
    136828
}
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
egine_hitchance = {}
for name, value in pairs(ui_find.hitchance) do
    egine_hitchance[name] = egine_hitchance[name] or value:get_value()
end
color_t.fade_color = function(f, s, a)
    local r = math_lerp(f.red * 255, s.red * 255, a)
    local g = math_lerp(f.green * 255, s.green * 255, a)
    local b = math_lerp(f.blue * 255, s.blue * 255, a)
    local a = math_lerp(f.alpha * 255, s.alpha * 255, a)
    return color_t.new(r, g, b, a)
end
color_t.tostring = function(r,g,b,a)
    if type(r) == "userdata" then
        return ("%s, %s, %s, %s"):format(r.red*255, r.green*255, r.blue*255, r.alpha*255)
    else
        return ("%s, %s, %s, %s"):format(r, g, b, a)
    end
end
render = {}
render.better_text = function(mode, text, font, pos, size, color, speed, another_color)
    if mode == "normal" then
        renderer.text(text, font, pos, size, color)
    elseif mode == "fading" then
        local color_2 = color_t.fade_color(color, another_color, math.abs(math.sin((globalvars.get_real_time() - 0.08) * speed)))
        renderer.text(text, font, pos, size, color_2)
    elseif mode == "enchanted" then
        local chars_x = 0
        for i = 1, #text do
            local text_sub = string.sub(text, i, i)
            local text_size = renderer.get_text_size(font, size, text_sub .. "")
            local color_2 = color_t.fade_color(color, another_color, math.abs(math.sin((globalvars.get_real_time() - (i * 0.08)) * speed)))
            renderer.text(text_sub, font, vec2_t.new(pos.x + chars_x, pos.y), size, color_2)
            chars_x = chars_x + text_size.x
        end
    elseif mode == "rainbow" then
        renderer.text(text, font, pos, size, hsv2rgb(globalvars.get_real_time() / 4, 0.9, 1, 1))
    end
end
render.text = function(text, font, pos, size, col)
    loced = {x=pos.x ,y=pos.y, text=text, size=size, col=col}
    renderer.text(text, font, pos, size, col)
    return loced
end
render.texture = function(texture, pos, col)
    loced = {x=pos.x ,y=pos.y, z=pos.z, w=pos.w, col=col}
    renderer.texture(texture, vec2_t.new(pos.x, pos.y), vec2_t.new(pos.z, pos.w), col)
    return loced
end
render.line = function(pos, col)
    loced = {x=pos.x ,y=pos.y, z=pos.z, w=pos.w, col=col}
    renderer.line(vec2_t.new(pos.x, pos.y), vec2_t.new(pos.z, pos.w), col)
    return loced
end
render.rect = function(typed, pos, col)
    loced = {x=pos.x ,y=pos.y, z=pos.z, w=pos.w, col=col}
    if typed == 0 then
        if type(col) == "table" then color = col[1] else color = col end
        renderer.rect(vec2_t.new(pos.x, pos.y), vec2_t.new(pos.z, pos.w), color)
    elseif typed == 1 then
        if type(col) == "table" then color = col[1] else color = col end
        renderer.rect_filled(vec2_t.new(pos.x, pos.y), vec2_t.new(pos.z, pos.w), color)
    elseif typed == 2 then
        if type(col) == "table" and #col == 4 then
            color = col[1] color2 = col[2] color3 = col[3] color4 = col[4]
            renderer.rect_filled_fade(vec2_t.new(pos.x, pos.y), vec2_t.new(pos.z, pos.w), color, color2, color3, color4)
        end
    end
    return loced
end
render.circle = function(typed, pos, radius, segments, filled, col)
    loced = {x=pos.x ,y=pos.y, radius=radius, segments=segments, filled=filled, col=col}
    if typed == 0 then
        if type(col) == "table" then color = col[1] else color = col end
        renderer.circle(vec2_t.new(pos.x, pos.y), radius, segments, filled , color)
    elseif typed == 1 then
        if type(col) == "table" and #col == 2 then
            color = col[1] color2 = col[2]
            renderer.circle_fade(vec2_t.new(pos.x, pos.y), radius, color, color2)
        end
    end
    return loced
end
render.filled_polygon = function(points, col)
    loced = {points, col=col}
    renderer.filled_polygon(points, col)--points = vec2_t*3
    return loced
end
render.arc1 = function(pos, inner_radius, outer_radius, start_angle, arc_angle, col)
    loced = {pos=pos, col=col}
    local current_angle = start_angle
    while current_angle < start_angle + arc_angle do
        current_angle = current_angle + 1
        local angle_in_radians = current_angle * math.pi / 180
        renderer.line(vec2_t.new(pos.x + math.cos(angle_in_radians) * inner_radius, pos.y + math.sin(angle_in_radians) * inner_radius), vec2_t.new(pos.x + math.cos(angle_in_radians) * outer_radius, pos.y + math.sin(angle_in_radians) * outer_radius), col)
    end
    return loced
end
render.arc2 = function(pos, start_angle, end_angle, segments, radius, width, col)
    loced = {pos=pos, col=col}
    start_angle, end_angle = start_angle * (math.pi / 180), end_angle * (math.pi / 180)
    local rotation = start_angle
    local step = 0.1 + (2 * math.pi) / segments
    while rotation < end_angle - 0.01 do
        local rotation_sin, rotation_cos = math.sin(rotation), math.cos(rotation)
        local next_rotation_sin, next_rotation_cos = math.sin(rotation + step), math.cos(rotation + step)
        local position = vec2_t.new(radius * rotation_cos + pos.x, radius * rotation_sin + pos.y)
        local next_position = vec2_t.new(radius * next_rotation_cos + pos.x, radius * next_rotation_sin + pos.y)
        local width_position = vec2_t.new((radius + width) * rotation_cos + pos.x, (radius + width) * rotation_sin + pos.y)
        local width_next_position = vec2_t.new((radius + width) * next_rotation_cos + pos.x, (radius + width) * next_rotation_sin + pos.y)
        if position.x ~= nil then
            renderer.filled_polygon({position, width_position, width_next_position, next_position}, col)
        end
        rotation = rotation + (step - 0.1)
    end
    return loced
end
render.polygon_outline = function(pts, col, closed, smoothing)
    if closed then renderer.line(pts[#pts], pts[1], col) end
    for i = 1, #pts do
        if i % 2 == 1 or not smoothing then
            if pts[i-1] and smoothing then renderer.line(pts[i], pts[i-1], col) end
            if pts[i+1] then renderer.line(pts[i], pts[i+1], col) end
        end
    end
end
render.arc3 = function(pos, radius, rot, deg, filled, points, col, smooth)
    loced = {pos=pos, col=col}
    local pts = {}
    local a = math.rad(rot)
    local step = math.rad(deg) / (points - 1)
    for i = 0, points - 1 do
        local x = radius * math.cos(a)
        local y = radius * math.sin(a)
        table.insert(pts, vec2_t.new(x, y) + pos)
        a = a + step
    end
    if filled then
        renderer.filled_polygon(pts, col)
    else
        render.polygon_outline(pts, col, false, smooth)
    end
    return loced
end
render.rect_arc = function(big, pos, col, filled, Rounded)
    local loced = {
        x=pos.x-big ,y=pos.y-big ,z=pos.z+big ,w=pos.w+big,col=col,
        init = {x=pos.x ,y=pos.y ,z=pos.z ,w=pos.w,col=col}
    }
    theclr =((col.alpha*255)/255)- 0.4
    if Rounded[1] then render.arc3(vec2_t.new(pos.z-theclr, pos.w), big, 360, 90, filled, 30, col, false) end
    if Rounded[2] then render.arc3(vec2_t.new(pos.x+theclr, pos.w), big, 90,  90, filled, 30, col, false) end
    if Rounded[3] then render.arc3(vec2_t.new(pos.z-theclr, pos.y), big, 270, 90, filled, 30, col, false) end
    if Rounded[4] then render.arc3(vec2_t.new(pos.x+theclr, pos.y), big, 180, 90, filled, 30, col, false) end
    if filled and Rounded[1] then
        renderer.filled_polygon({ vec2_t.new(pos.z+big,pos.w), vec2_t.new(pos.z,pos.w+big), vec2_t.new(pos.z,pos.w) }, col)
    elseif filled then
        renderer.rect_filled(vec2_t.new(pos.z,pos.w), vec2_t.new(pos.z+big,pos.w+big), col)
    elseif not filled and not Rounded[1] then
        renderer.line(vec2_t.new(pos.z,pos.w+big), vec2_t.new(pos.z+big,pos.w+big), col)
        renderer.line(vec2_t.new(pos.z+big,pos.w), vec2_t.new(pos.z+big,pos.w+big), col)
    end
    if filled and Rounded[2] then
        renderer.filled_polygon({ vec2_t.new(pos.x, pos.w), vec2_t.new(pos.x, pos.w+big), vec2_t.new(pos.x-big,pos.w) }, col)
    elseif filled then
        renderer.rect_filled(vec2_t.new(pos.x-big,pos.w), vec2_t.new(pos.x,pos.w+big), col)
    elseif not filled and not Rounded[2] then
        renderer.line(vec2_t.new(pos.x-big,pos.w+big), vec2_t.new(pos.x,pos.w+big), col)
        renderer.line(vec2_t.new(pos.x-big,pos.w), vec2_t.new(pos.x-big,pos.w+big), col)
    end
    if filled and Rounded[3] then
        renderer.filled_polygon({ vec2_t.new(pos.z,pos.y), vec2_t.new(pos.z,pos.y-big), vec2_t.new(pos.z+big,pos.y) }, col)
    elseif filled then
        renderer.rect_filled(vec2_t.new(pos.z,pos.y-big), vec2_t.new(pos.z+big,pos.y), col)
    elseif not filled and not Rounded[3] then
        renderer.line(vec2_t.new(pos.z,pos.y-big), vec2_t.new(pos.z+big,pos.y-big), col)
        renderer.line(vec2_t.new(pos.z+big,pos.y-big), vec2_t.new(pos.z+big,pos.y), col)
    end
    if filled and Rounded[4] then
        renderer.filled_polygon({vec2_t.new(pos.x,pos.y-big) , vec2_t.new(pos.x,pos.y), vec2_t.new(pos.x-big,pos.y) }, col)
    elseif filled then
        renderer.rect_filled(vec2_t.new(pos.x-big,pos.y-big), vec2_t.new(pos.x,pos.y), col)
    elseif not filled and not Rounded[4] then
        renderer.line(vec2_t.new(pos.x-big,pos.y-big), vec2_t.new(pos.x,pos.y-big), col)
        renderer.line(vec2_t.new(pos.x-big,pos.y-big), vec2_t.new(pos.x-big,pos.y), col)
    end
    if filled then
        renderer.rect_filled(vec2_t.new(pos.z,pos.y-big), vec2_t.new(pos.x,pos.y), col)
        renderer.rect_filled(vec2_t.new(pos.z,pos.w), vec2_t.new(pos.x,pos.w+big), col)
        renderer.rect_filled(vec2_t.new(pos.z,pos.y), vec2_t.new(pos.z+big,pos.w), col)
        renderer.rect_filled(vec2_t.new(pos.x-big,pos.y), vec2_t.new(pos.x,pos.w), col)
        renderer.rect_filled(vec2_t.new(pos.z,pos.y), vec2_t.new(pos.x,pos.w), col)
    else
        renderer.line(vec2_t.new(pos.z,pos.y-big), vec2_t.new(pos.x,pos.y-big), col)
        renderer.line(vec2_t.new(pos.z,pos.w+big), vec2_t.new(pos.x,pos.w+big), col)
        renderer.line(vec2_t.new(pos.z+big,pos.y), vec2_t.new(pos.z+big,pos.w), col)
        renderer.line(vec2_t.new(pos.x-big,pos.y), vec2_t.new(pos.x-big,pos.w), col)
    end
    return loced
end
render.Draw3DCircle = function( pos, points, radius, filled_clr, otline_clr )
    local step = math.pi * 2 / points
    local vec_points = { }
    local z = pos.z
    for i = 0.0, math.pi * 2.0, step do
        local pos_world = vec3_t.new( radius * math.cos( i ) + pos.x, radius * math.sin( i ) + pos.y, z )
        local pos_screen = se.world_to_screen( pos_world )
        if pos_screen then table.insert( vec_points, pos_screen ) end
    end
    if filled_clr ~= nil then
        renderer.filled_polygon( vec_points, filled_clr )
    end
    if otline_clr ~= nil then
        for i = 1, #vec_points do
            local point = vec_points[i]
            local next_point = vec_points[i + 1] and vec_points[i + 1] or vec_points[1]
            renderer.line( point, next_point, otline_clr )
        end
	end
end
calc_count = function(string, search)
    local count = 0
    for i = 1, #string do
        if string:sub(i, i) == search then
            count = count + 1
        end
    end
    return count
end
render.bettertext = function(_string, font, vector, size, alpha, shadow)
    local texted = ""
    local new_string = ""
    local string = _string
    local old_text_size = 0
    for i = 1, calc_count(string, "{") do
        local start_prefix = string:find('{')
        local end_prefix = string:find('}')
        local string_color = string:sub(start_prefix, end_prefix)
        local load_color = loadstring('return ' .. string_color)()
        local next_string = string:sub(end_prefix + 1)
        local next_prefix_start = next_string:find('{')
        local new_string = next_prefix_start and next_string:sub(1, next_prefix_start - 1) or next_string
        texted = texted..new_string
        string = next_string
        local color = color_t.new(unpack(load_color))
        color.alpha = alpha
        if shadow then
            renderer.text(new_string, font, vec2_t.new(vector.x + old_text_size, vector.y), size, color_t.new(0, 0, 0, alpha))
            renderer.text(new_string, font, vec2_t.new(vector.x + old_text_size + 1, vector.y + 1), size, color)
        else
            renderer.text(new_string, font, vec2_t.new(vector.x + old_text_size, vector.y), size, color)
        end
        old_text_size = old_text_size + renderer.get_text_size(font, size, new_string).x
    end
    return texted
end
render_clamp = function(val, min, max)
    if val > max then return max end
    if min > val then return min end
    return val
end
render_animation = function(add, value, animclamp, min, max, lerping, animlerp)
    if add then
        return math_lerp(render_clamp(value + animclamp * globalvars.get_frame_time(), min, max), lerping, animlerp * globalvars.get_frame_time())
    else
        return math_lerp(render_clamp(value - animclamp * globalvars.get_frame_time(), min, max), lerping, animlerp * globalvars.get_frame_time())
    end
end
-- function extract_random(text)
--     local numbers = {}
--     for segment in text:gmatch("([^|]+)") do
--         table.insert(numbers, tonumber(string.match(segment, "(%d+)")))
--     end
--     return numbers[math.random(1, #numbers)] or 0
-- end
-- function getScriptFilePath()
--     local info = debug.getinfo(2, "S")
--     print(tostring(info.linedefined))
--     print(tostring(info.lastlinedefined))
--     print(tostring(info.source))
--     print(tostring(info.what))
-- end
-- getScriptFilePath()
function modifyString(inputString)
    local modifiedString = inputString:gsub("([%%%(%)%[%]])", "%%%1")
    return modifiedString
end
create = {}
function trigger_single(lable, globalvars_table, seconds)
    create[lable] = create[lable] or {time = globalvars_table}
    if globalvars_table - create[lable].time > seconds then
        create[lable].time = globalvars_table
        return true
    end
    return false
end
function DelayedStatus(lable, globalvars_table, seconds)
    create[lable] = create[lable] or {time = globalvars_table, torf=true}
    if globalvars_table - create[lable].time > seconds then
        create[lable].torf = not create[lable].torf
        create[lable].time = globalvars_table
    end
    return create[lable].torf
end
function interval_random(label, min, max, interval)
    create[label] = create[label] or { number = 0 }
    if interval > math.abs(min - max) then
        error("间隔值大于最大值和最小值的差")
        return 0
    elseif interval == 0 then
        create[label].number = math.random(min, max)
    else
        local randomNumber
        repeat
            randomNumber = math.random(min, max)
        until math.abs(randomNumber - create[label].number) > interval
        create[label].number = randomNumber
    end
    return create[label].number
end
function track_Change(label, value, fn)
    create[label] = create[label] or 0
    if create[label] ~= value then
        pcall(fn, create[label])
        create[label] = value
    end
end
function manageInstance(label, value, fn)
    create[label] = create[label] or false
    if value then
        if not create[label] then
            pcall(fn, value)
            create[label] = true
        end
    else
        if create[label] then
            pcall(fn, value)
            create[label] = false
        end
    end
end

function hasbit(x, p) return x % (p + p) >= p end
function setbit(x, p) return hasbit(x, p) and x or x + p end
function round(n) return n % 1 >= 0.5 and math.ceil(n) or math.floor(n) end
function server_time() return (entitylist.get_local_player():get_prop_int(netvars.m_ntickbase) * globalvars.get_interval_per_tick()) end
function calcDist(pos1, pos2)
    local pos = pos1-pos2
    return math.sqrt(pos.x^2 + pos.y^2 + pos.z^2);
end
function time_to_ticks( dt ) return round( ( 0.5 + dt / globalvars.get_interval_per_tick( ) ) ) end
function vector_angles(angles)
    local tmp, yaw, pitch
    if allValuesMatch(0, {angles.x, angles.y}) then
        yaw = 0
        if angles.z > 0 then
            pitch = 270
        else
            pitch = 90
        end
    else
        yaw = math.deg(math.atan2(angles.y, angles.x))
        if yaw < 0 then
            yaw = yaw + 360
        end
        tmp = math.sqrt(angles.x * angles.x + angles.y * angles.y)
        pitch = math.deg(math.atan2(-angles.z, tmp))
        if pitch < 0 then
            pitch = pitch + 360
        end
    end
    return vec3_t.new(pitch, yaw, 0)
end
function get_weapon(entity)
    local weapon = entitylist.get_entity_from_handle(entity:get_prop_int(netvars.m_hactiveweapon))
    if weapon then
        local index = weapon:get_prop_int(netvars.m_iitemdefinitionindex) do
            if index >= 589824 then
                index = index - 589824
            elseif index >= 262144 then
                index = index - 262144
            end
        end
        local data = weapon_data(weapon)
        local ammo = weapon:get_prop_int(netvars.m_iclip1)
        -- in_recharge = ffi.cast("uint32_t*", (client.find_pattern("client.dll", "C6 87 ? ? ? ? ? 8B 06 8B CE FF 90") + 2))
        -- is_recharging = ffi.cast("bool*", weapon:get_address() + in_recharge[0])[0]
        return {weapon  = weapon, index = index, data = data, ammo = ammo}
    end
    return nil
end

ffi_interface = function(module, name)
    local ptr = se.create_interface(module .. ".dll", name) or error("failed to get " .. name .. " interface")
    return ffi.cast("void***", ptr)
end
ffp = {
    engine_cvar = ffi_interface("vstdlib", "VEngineCvar007"),
    entity_list = ffi_interface("client", "VClientEntityList003"),
}
ffp.color_print = ffi.cast("void(__cdecl*)(void*, const struct c_color&, const char*, ...)", ffp.engine_cvar[0][25])
function print_color(t, col)
    local c = ffi.new("struct c_color")
    c.clr[0], c.clr[1], c.clr[2], c.clr[3] = col.red*255, col.green*255, col.blue*255, col.alpha*255
    ffp.color_print(ffp.engine_cvar, c, tostring(t))
end
this = ffi.cast("unsigned long**", client.find_pattern("client.dll", "B9 ? ? ? ? E8 ? ? ? ? 8B 5D 08") + 1)[0]
find_hud_element = ffi.cast("unsigned long(__thiscall*)(void*, const char*)", client.find_pattern("client.dll", "55 8B EC 53 8B 5D 08 56 57 8B F9 33 F6 39 77 28"))
function get_vfunc(ptr, typedef, index)
    return ffi.cast(typedef, ffi.cast("void***", ptr)[0][index])
end
hud_chat = find_hud_element(this, "CHudChat")
chat_print = get_vfunc(hud_chat, "void(__cdecl*)(int, int, int, const char*, ...)", 27)
function chat_hud(iplayerindex, ifilter, text)
    chat_print(hud_chat, iplayerindex, ifilter, text)
end
GetClientEntity = ffi.cast("void*(__thiscall*)(void*, int)", ffp.entity_list[0][3])
function entity_t:get_address()
    data = GetClientEntity(ffp.entity_list, self:get_index())
	return tonumber(string.sub(tostring(data), 16, -1))
end
weapon_data_call = ffi.cast("int*(__thiscall*)(void*)", client.find_pattern("client.dll", "55 8B EC 81 EC 0C 01 ? ? 53 8B D9 56 57 8D 8B"));
function weapon_data(weapon)
    if weapon and weapon:get_address() then
        return ffi.cast("struct WeaponInfo_t*", weapon_data_call(ffi.cast("void*", weapon:get_address())));
    end
end
player_vtable = ffi.cast("int*", client.find_pattern("client.dll", "55 8B EC 83 E4 F8 83 EC 18 56 57 8B F9 89 7C 24 0C") + 0x47)[0]
get_abs_origin = ffi.cast("float*(__thiscall*)(int)", ffi.cast("int*", player_vtable + 0x28)[0])
function check_if_hittable(entity_id, pos)
    local local_player = entitylist.get_local_player()
    local abs_origin = get_abs_origin(local_player:get_address())
    local view_offset = local_player:get_prop_vector(netvars.m_vecviewoffset)
    local trace_start = vec3_t.new(abs_origin[0] + view_offset.x, abs_origin[1] + view_offset.y, abs_origin[2] + view_offset.z)
    local trace_out = trace.line(engine.get_local_player(), 0x46004003, trace_start, pos)
    if trace_out.hit_entity_index == entity_id then
        return true
    else
        return false
    end
end