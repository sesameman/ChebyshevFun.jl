"""
# chebyshevfun

普通递归给出第一类切比雪夫函数的表达式
```math
T_n(x)=2xT_{n-1}(x)-T_{n-2}(x)
```
"""
function chebyshevT(n::Int64,x)
    if n==0
        return 1
    elseif n==1
        return x
    elseif n>=2
        return 2*x*chebyshevT(n-1,x)-chebyshevT(n-2,x)
    end
end

"""
# chebyshevfun
~~通过元编程递归，给出表达式~~
普通递归给出第一类切比雪夫函数的表达式
```math
U_n(x)=2xU_{n-1}(x)-U_{n-2}(x)
```
"""
function chebyshevU(n::Int64,x)
    if n==0
        return 1
    elseif n==1
        return 2*x
    elseif n>=2
        return 2*x*chebyshevU(n-1,x)-chebyshevU(n-2,x)
    end
end

"""
# chebyshevexpand
切比雪夫展开函数
输入一个函数，返回在指定点处切比雪夫展开后的版本
"""