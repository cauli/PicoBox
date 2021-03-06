sqrt0 = sqrt
function sqrt(n)
  if (n <= 0) then return 0 end
  if (n >= 32761) then return 181.0 end
  return sqrt0(n)
end

-- http://gamedev.stackexchange.com/questions/25579/how-to-detect-what-portion-of-a-rectangle-a-point-is-in
function get_quadrant(x,y)
    -- top view of block
    --0,0..........1,0
    -- ..         ..
    -- .  .  a  .  .
    -- .   b . d   .
    -- .  .  c  .  .
    -- ..         ..
    --0,1...........1,1

    local min = {}
    local max = {}

    min.x = 0
    min.y = 0
    max.x = 1
    max.y = 1

    if (x < min.x or x > max.x or y < min.y or y > max.y)then
        return nil
    else
        local ab = (y - min.y) * (max.x - min.x) > (max.y-min.y) * (x - min.x);
        local ad = (y - min.y) * (max.x - min.x) > (max.y-min.y) * (max.x - x);
        
        if(ab and ad) then
        return "a"
        elseif(ab and not ad) then
        return "b"
        elseif(not ab and not ad) then 
        return "c"
        else
        return "d"
        end
    end

    return nil
end

function min3(a,b,c)
    local mab = min(a,b)
    return min(mab,c)
end

function max3(a,b,c)
    local mab = max(a,b)
    return max(mab,c)
end

function orient2d(a, b, c)
    return (b.x-a.x)*(c.y-a.y) - (b.y-a.y)*(c.x-a.x);
end

function clip(v)
    return max(-1,min(128,v))
end

function lerp(a,b,alpha)
    return a*(1.0-alpha)+b*alpha
end

function px_to_grid(x,y)
    local current_grid = {}
    current_grid.x = flr((x / (tw/2) + y / (th/2)) /2);
    current_grid.y = flr((y / (th/2) -(x/ (tw/2))) /2);
    return current_grid
end

function px_to_grid_float(x,y)
    local current_grid = {}
    current_grid.x = (x / (tw/2) + y / (th/2)) /2;
    current_grid.y = (y / (th/2) -(x/ (tw/2))) /2;
    return current_grid
end
