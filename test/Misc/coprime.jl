@testset "Coprime" begin

@test Hecke.mul_into!(2, 3, 4) == 12

@test Hecke.mul_into!(ZZ(2), ZZ(3), ZZ(4)) == 12

@test Hecke.copy_into!([2,3], [4,5]) == [4,5]

@test Hecke.copy_into!(2, 3) == 3

@test Hecke.copy_into!(ZZ(2), ZZ(3)) == 3

@test Hecke.copy_into!(QQ(2), QQ(3)) == 3

Qx, x = polynomial_ring(QQ, "x");
K, a = number_field(x^2 + 1, "a");
L, b = number_field(x^2 - 2, "b");
@test Hecke.copy_into!(minpoly(a), minpoly(b)) == x^2 - 2

A = Hecke.ProdEnv{QQFieldElem}(3);
Hecke.Base.push!(A, QQ(3//2));
@test finish(A) == 3//2

A = Hecke.EvalEnv{QQFieldElem}(QQ(3//2), 10);
Base.push!(A, QQ(3//2));
@test finish(A) == 3//2

@test Hecke.ppgle(ZZ(100), ZZ(200)) == (100, 1, 100)

@test Hecke.pair_bernstein(ZZ(1000000), ZZ(2000000)) == [15625, 1, 1, 1, 1, 2]

@test Hecke._my_eval(2, 3) == 2

@test Hecke.my_eval([2, 3], 3) == 11

@test Hecke.pair_bach(2, 3) == [2, 3]

Qx, x = polynomial_ring(QQ, "x");
@test Hecke.pair_bach(x^2, x^2 + 1) == [x^2, x^2 + 1]

Qx, x = polynomial_ring(QQ, "x");
@test Hecke.coprime_base_bach([x^2, x^2 + 1]) == [x^2, x^2 + 1]

Qx, x = polynomial_ring(QQ, "x");
@test Hecke.ppgle(x^2, x^2 + 1) == (1, x^2, 1)

Qx, x = polynomial_ring(QQ, "x");
@test Hecke.pair_bernstein(x^2, x^2 + 1) == [x^2, x^2 + 1]

Qx, x = polynomial_ring(QQ, "x");
@test Hecke.split_bernstein(x, [x^2, x^2 + 1]) == [(x^2 + 1, 1), (x^2, x)]

@test Hecke.coprime_base_bernstein([QQ(3//2)]) == [QQ(3//2)]

@test Hecke.coprime_base_bernstein([ZZ(1000000), ZZ(2000000)]) == [15625, 2]

@test Hecke.merge_bernstein([ZZ(1000000), ZZ(2000000)], [ZZ(3000000), ZZ(4000000)]) == [3, 4, 15625, 2, 15625]

@test Hecke.augment_bernstein([ZZ(1000000), ZZ(2000000)], ZZ(2)) == [15625, 2, 15625, 2]

@test sort(Hecke.split_bernstein(ZZ(2), [ZZ(1000000), ZZ(2000000)])) == [(1000000, 2), (2000000, 2)]

@test Hecke.split_bernstein(ZZ(20000), [ZZ(20000), ZZ(30000)]) == [(ZZ(30000), ZZ(20000)), (ZZ(20000), ZZ(20000))]

@test Hecke.augment_bach([ZZ(20), ZZ(30)], ZZ(2)) == [5, 15, 2]

@test Hecke.coprime_base_bach([ZZ(2000000), ZZ(3000000)]) == [2, 15625, 3]


end
