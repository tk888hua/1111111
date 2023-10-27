local g_print = print
_G.print = function(...)
    local args = {...}
    local msg = #args == 0 and "nil" or ""
    for _, v in ipairs(args) do
        msg = #msg > 0 and msg.."  "..tostring(v) or msg..tostring(v)
    end
    g_print(msg)
end
function vec2_t:__tostring()return string.format("vec2_t(%.2f, %.2f)", self.x, self.y)end
function vec3_t:__tostring()return string.format("vec3_t(%.2f, %.2f, %.2f)", self.x, self.y, self.z)end
function color_t:__tostring()return string.format("color_t(%.2f, %.2f, %.2f, %.2f)", self.red, self.green, self.blue, self.alpha)end
function color_t:__tostring() return string.format("color_t(%d, %d, %d, %d)", self.red*255, self.green*255, self.blue*255, self.alpha*255) end
function entity_t:__tostring()return "entity_t"end
print(vec3_t.new(1, 1, 1), vec2_t.new(1, 1), color_t.new(255, 255, 255, 255), entitylist.get_local_player())              -- vec3_t(1.00, 1.00, 1.00)  vec2_t(1.00, 1.00)  color_t(1.00, 1.00, 1.00, 1.00)  entity_t
client.register_callback("paint", function()
    print("stfu")
end)
print("stfu")
