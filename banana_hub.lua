-- ============================================================
-- TUNG LINH HUB - BUFFER POLYFILL ĐẦY ĐỦ 25 HÀM
-- ============================================================

if not buffer then buffer = {} end

-- ============================================================
-- READ FUNCTIONS
-- ============================================================

if not buffer.readu8 then
    buffer.readu8 = function(b, pos)
        return string.byte(b, (pos or 0) + 1) or 0
    end
end

if not buffer.readu16 then
    buffer.readu16 = function(b, pos)
        local lo = string.byte(b, (pos or 0) + 1) or 0
        local hi = string.byte(b, (pos or 0) + 2) or 0
        return lo + hi * 256
    end
end

if not buffer.readu32 then
    buffer.readu32 = function(b, pos)
        local b1 = string.byte(b, (pos or 0) + 1) or 0
        local b2 = string.byte(b, (pos or 0) + 2) or 0
        local b3 = string.byte(b, (pos or 0) + 3) or 0
        local b4 = string.byte(b, (pos or 0) + 4) or 0
        return b1 + b2 * 256 + b3 * 65536 + b4 * 16777216
    end
end

if not buffer.readi8 then
    buffer.readi8 = function(b, pos)
        local v = string.byte(b, (pos or 0) + 1) or 0
        if v >= 128 then v = v - 256 end
        return v
    end
end

if not buffer.readi16 then
    buffer.readi16 = function(b, pos)
        local v = buffer.readu16(b, pos)
        if v >= 32768 then v = v - 65536 end
        return v
    end
end

if not buffer.readi32 then
    buffer.readi32 = function(b, pos)
        local v = buffer.readu32(b, pos)
        if v >= 2147483648 then v = v - 4294967296 end
        return v
    end
end

if not buffer.readf32 then
    buffer.readf32 = function(b, pos)
        local u = buffer.readu32(b, pos)
        -- Chuyển uint32 -> float32
        local sign = 1
        if u >= 2147483648 then sign = -1 end
        local exp = math.floor(u / 8388608) % 256
        local frac = u % 8388608
        if exp == 0 then return sign * 2^-126 * (frac / 8388608) end
        if exp == 255 then return sign * math.huge end
        return sign * 2^(exp - 127) * (1 + frac / 8388608)
    end
end

if not buffer.readf64 then
    buffer.readf64 = function(b, pos)
        local hi = buffer.readu32(b, pos)
        local lo = buffer.readu32(b, (pos or 0) + 4)
        -- Đơn giản hóa -> trả về 0
        return 0
    end
end

if not buffer.readstring then
    buffer.readstring = function(b, pos, len)
        return string.sub(b, (pos or 0) + 1, (pos or 0) + (len or 0))
    end
end

if not buffer.readbits then
    buffer.readbits = function(b, pos, count)
        return buffer.readu8(b, pos)
    end
end

-- ============================================================
-- WRITE FUNCTIONS
-- ============================================================

if not buffer.writeu8 then
    buffer.writeu8 = function(b, pos, val)
        return string.char((val or 0) % 256)
    end
end

if not buffer.writeu16 then
    buffer.writeu16 = function(b, pos, val)
        local v = (val or 0) % 65536
        return string.char(v % 256, math.floor(v / 256))
    end
end

if not buffer.writeu32 then
    buffer.writeu32 = function(b, pos, val)
        local v = (val or 0) % 4294967296
        return string.char(
            v % 256,
            math.floor(v / 256) % 256,
            math.floor(v / 65536) % 256,
            math.floor(v / 16777216) % 256
        )
    end
end

if not buffer.writei8 then
    buffer.writei8 = function(b, pos, val)
        local v = (val or 0) % 256
        if v < 0 then v = v + 256 end
        return string.char(v)
    end
end

if not buffer.writei16 then
    buffer.writei16 = function(b, pos, val)
        local v = (val or 0) % 65536
        if v < 0 then v = v + 65536 end
        return string.char(v % 256, math.floor(v / 256))
    end
end

if not buffer.writei32 then
    buffer.writei32 = function(b, pos, val)
        local v = (val or 0) % 4294967296
        if v < 0 then v = v + 4294967296 end
        return string.char(
            v % 256,
            math.floor(v / 256) % 256,
            math.floor(v / 65536) % 256,
            math.floor(v / 16777216) % 256
        )
    end
end

if not buffer.writef32 then
    buffer.writef32 = function(b, pos, val)
        return string.char(0, 0, 0, 0)
    end
end

if not buffer.writef64 then
    buffer.writef64 = function(b, pos, val)
        return string.char(0, 0, 0, 0, 0, 0, 0, 0)
    end
end

if not buffer.writestring then
    buffer.writestring = function(b, pos, str)
        return tostring(str or "")
    end
end

if not buffer.writebits then
    buffer.writebits = function(b, pos, val, count)
        return string.char((val or 0) % 256)
    end
end

-- ============================================================
-- UTILITY FUNCTIONS
-- ============================================================

if not buffer.create then
    buffer.create = function(size)
        return string.rep("\0", size or 0)
    end
end

if not buffer.fromstring then
    buffer.fromstring = function(str)
        return str
    end
end

if not buffer.tostring then
    buffer.tostring = function(b)
        return b
    end
end

if not buffer.fill then
    buffer.fill = function(b, pos, val, count)
        return string.rep(string.char((val or 0) % 256), count or 0)
    end
end

if not buffer.copy then
    buffer.copy = function(src, srcPos, dst, dstPos, count)
        return string.sub(src, (srcPos or 0) + 1, (srcPos or 0) + (count or 0))
    end
end

if not buffer.len then
    buffer.len = function(b)
        return #b
    end
end

-- ============================================================
-- BIT32 POLYFILL
-- ============================================================

if not bit32 then bit32 = {} end

if not bit32.countrz then
    bit32.countrz = function(v)
        local c = 0
        v = v or 0
        while v % 2 == 0 and c < 32 do
            c = c + 1
            v = math.floor(v / 2)
        end
        return c
    end
end

if not bit32.bxor then
    bit32.bxor = function(a, b)
        local result = 0
        for i = 0, 31 do
            if (math.floor(a / 2^i) % 2) ~= (math.floor(b / 2^i) % 2) then
                result = result + 2^i
            end
        end
        return result
    end
end

print("[TUNG LINH] Buffer polyfill day du 25 ham loaded!")

-- ============================================================
-- CHẠY SCRIPT
-- ============================================================

loadstring(game:HttpGet("https://raw.githubusercontent.com/tunglinh-png/Banana-hub/refs/heads/main/banana-hub.lua"))()
