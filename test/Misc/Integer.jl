@testset "Integers" begin

    
    @test is_commutative(ZZ)

    @test modord(2,3) == 2

    @test modord(ZZ(2),ZZ(3)) == ZZ(2)

    @test sort(euler_phi_inv(ZZ(4))) == [ZZ(5), ZZ(8), ZZ(10), ZZ(12)]

    @test Hecke.is_prime_power(ZZ(8))

    @test Hecke.is_prime_power(8)

    @test sort(euler_phi_inv(4)) == [5,8,10,12]

    @test sort(euler_phi_inv(200)) == [275,303,375,404,500,550,606,750]

    @test euler_phi(ZZ(5)) == ZZ(4)

    @test carmichael_lambda(ZZ(80)) == ZZ(4)
   
    @test sort(evaluate.(Hecke.euler_phi_inv_fac_elem(ZZ(4)))) == ZZ.([5, 8 ,10 ,12])
    
    @test carmichael_lambda(ZZ(1*2^3)) == ZZ(2)

    @test carmichael_lambda(80) == 4

    @test Hecke.squarefree_up_to(21) == [1, 2, 3, 5, 6, 7, 10, 11, 13, 14, 15, 17, 19, 21]

    @test support(QQ(2)) == [2]

    @test sort(support(QQ(200//3))) == [2, 3, 5]

    @test sort(euler_phi_inv(2)) == ZZ.([3,4,6])

    @test radical(200) == ZZ(10)

    @test collect(factor(ZZ, QQ(200//3))) == [5 => 2, 2 => 3, 3 => -1]

    @test Hecke.ecm(ZZ(2)) == (0,2)

    @test carmichael_lambda(factor(ZZ(80))) == 4

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
    @test preimage(mu, 2//3) == u[2] - u[3]

    u, mu = sunit_group([2]);
    @test preimage(mu, 2) == u[2]

    u, mu = sunit_group([ZZ(2)]);
    @test preimage(mu, 2) == u[2]

    @test evaluate(factor(FacElem(factor(ZZ(100))))) == ZZ(100)

    @test evaluate(FacElem(factor(ZZ(100)))) == ZZ(100)

    @test sort(collect(Divisors(FacElem(factor(ZZ(20)))))) == ZZ.([1, 2, 4, 5, 10, 20])

    @test sort(collect(Divisors(factor(ZZ(20))))) == ZZ.([1, 2, 4, 5, 10, 20])

    Qx, x = polynomial_ring(QQ, "x");
    K, a = number_field(x^2 + 1, "a");
    A = ideal(EquationOrder(K), ZZ(23));
    C = ideal(EquationOrder(K), ZZ(1));
    @test collect(Divisors(A)) == [C, A]
    
    Qx, x = polynomial_ring(QQ, "x");
    K, a = number_field(x^2 + 1, "a");
    A = ideal(EquationOrder(K), ZZ(23));
    C = ideal(EquationOrder(K), ZZ(1));
    factorization = factor(A);
    Dict1 = Dict{AbsNumFieldOrderIdeal{AbsSimpleNumField, AbsSimpleNumFieldElem}, ZZRingElem}();
    for (factor, exp) in factorization
        Dict1[factor] = exp
    end
    converted_A = sum([factor^exp for (factor, exp) in factorization]);
    result = collect(Divisors(converted_A));
    expected = [C,A];
    @test expected == result


end
