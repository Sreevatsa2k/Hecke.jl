@testset "Integers" begin

    
    @test is_commutative(ZZ)

    @test modord(2,3) == 2

    @test modord(ZZ(2),ZZ(3)) == ZZ(2)

    @test sort(euler_phi_inv(ZZ(4))) == [ZZ(5), ZZ(8), ZZ(10), ZZ(12)]

    @test Hecke.is_prime_power(ZZ(8))

    @test Hecke.is_prime_power(8)

    @test sort(euler_phi_inv(2)) == [3,4,6]

    @test euler_phi(ZZ(5)) == ZZ(4)

    @test carmichael_lambda(ZZ(80)) == ZZ(4)
   
    @test sort(evaluate.(Hecke.euler_phi_inv_fac_elem(ZZ(4)))) == ZZ.([5, 8 ,10 ,12])
    
    @test carmichael_lambda(ZZ(1*2^3)) == ZZ(2)

    @test carmichael_lambda(80) == 4

    @test Hecke.squarefree_up_to(20) == [1, 2, 3, 5, 6, 7, 10, 11, 13, 14, 15, 17, 19]

    @test support(QQ(2)) == [2]

    @test sort(euler_phi_inv(2)) == ZZ.([3,4,6])

    @test radical(200) == ZZ(10)

    @test Hecke.ecm(ZZ(2)) == (0,2)

    @test carmichael_lambda(Hecke.factor(ZZ(80))) == 4

    @test euler_phi(factor(FacElem(factor(ZZ(2))))) == 1

    @test carmichael_lambda(factor(FacElem(factor(ZZ(80))))) == 4

    @test Hecke.ecm(ZZ(20), 3) == (-1, 4)

    @test Hecke.ecm(ZZ(1000), 3, 4, 5) == (-1, 8)

    @test euler_phi(FacElem(factor(ZZ(2)))) == 1

    @test carmichael_lambda(FacElem(factor(ZZ(80)))) == 4

    u, mu = sunit_group_fac_elem([ZZ(2)]);
    @test preimage(mu, 2) == u[2]

    u, mu = sunit_group_fac_elem([2]);
    @test preimage(mu, 2) == u[2]

    u, mu = sunit_group_fac_elem([2,3]);
    @test preimage(mu, 2//3) == u[2//3]

    u, mu = sunit_group([2]);
    @test preimage(mu, 2) == u[2]

    u, mu = sunit_group([ZZ(2)]);
    @test preimage(mu, 2) == u[2]

    @test evaluate(factor(FacElem(factor(ZZ(100))))) == ZZ(100)

    @test evaluate(FacElem(factor(ZZ(100)))) == ZZ(100)

end
