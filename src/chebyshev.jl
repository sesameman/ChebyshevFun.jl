"""
# chebyshevfun
普通递归给出第一类切比雪夫函数的表达式
```math
T_n(x)=2xT_{n-1}(x)-T_{n-2}(x)
```
"""
function chebyshevT(n::Int64,x)
    if n<0
        error("chebyshev(n,x), n>=0 is violated")
    elseif n==0
        return 1
    elseif n==1
        return x
    elseif n==2
        return 2*x^2-1
    elseif n==3
        return 4*x^3-3*x
    elseif n==4
        return 8*x^4-8*x^2+1
    elseif n==5
        return 16*x^5-20*x^3+5*x
    elseif n==6
        return 16*x^5-20*x^3+5*x
    else
        return 2*x*chebyshevT(n-1,x)-chebyshevT(n-2,x)
    end
end

"""
# chebyshevfun
普通递归给出第一类切比雪夫函数的表达式
```math
U_n(x)=2xU_{n-1}(x)-U_{n-2}(x)
```
"""
function chebyshevU(n::Int64,x)
    if n<0
        error("chebyshev(n,x), n>=0 is violated")
    elseif n==0
        return 1
    elseif n==1
        return 2*x
    elseif n==2
        return -1 + 4*x^2
    elseif n==3
        return -4*x + 8*x^3
    elseif n==4
        return 1 - 12*x^2 + 16*x^4
    elseif n==5
        return 6*x - 32*x^3 + 32*x^5
    elseif n==6
        return -1 + 24*x^2 - 80*x^4 + 64*x^6
    else
        return 2*x*chebyshevU(n-1,x)-chebyshevU(n-2,x)
    end
end

# """
# # chebyshevexpand
# 切比雪夫展开函数
# 输入一个函数，返回在指定点处切比雪夫展开后的版本
# """
"""
为切比雪夫T而写的宏
"""
macro chebyT(n,x)
    return esc(:(2*$x*chebyshevT($n-1,$x)-chebyshevT($n-2,$x)))
end

"""
# chebyshevTmeta
为切比雪夫展开的多项式
用元编程进行操作
"""
function chebyshevTmeta(n::Int64,x)
    if n==0
        return 1
    elseif n==1
        return x
    elseif n>=2
        return @chebyT(n,x)
    end
end

# """
# 为切比雪夫U而写的宏
# """
# macro chebyU(n,x)
#     return esc(:(2*x*chebyshevT($n-1,$x)-chebyshevT($n-2,$x)))
# end

# """
# # chebyshevTmeta
# 为切比雪夫展开的多项式
# 用元编程进行操作
# """
# function chebyshevUmeta(n::Int64,x)
#     if n==0
#         return 1
#     elseif n==1
#         return 2*x
#     elseif n>=2
#         return @chebyU(n,x)
#     end
# end