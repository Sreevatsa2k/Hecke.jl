@testset "Coprime" begin

@test Hecke.mul_into!(2, 3, 4) == 12

@test Hecke.mul_into!(ZZ(2), ZZ(3), ZZ(4)) == 12

@test Hecke.copy_into!(2, 3) == 3

@test Hecke.copy_into!(ZZ(2), ZZ(3)) == 3

@test Hecke.copy_into!(QQ(2), QQ(3)) == 3

@test Hecke.ppgle(ZZ(100), ZZ(200)) == (100, 1, 100)

@test Hecke.pair_bernstein(ZZ(1000000), ZZ(2000000)) == [15625, 1, 1, 1, 1, 2]

@test Hecke._my_eval(2, 3) == 2

@test Hecke.pair_bach(2, 3) == [2, 3]

end
