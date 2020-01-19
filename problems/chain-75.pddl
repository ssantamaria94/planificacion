(define (problem chain-01)
(:domain chain-assembly)

(:objects 
initial_proccess proccess_1 proccess_2 proccess_3  - proccess
m1 m2 m3 - machine
p0 p1 p2 p3 p4 p5 p6 p7 p8 p9 p10 p11 p12 p13 p14 p15 p16 p17 p18 p19 p20 p21 p22 p23 p24 p25 p26 p27 p28 p29 p30 p31 p32 p33 p34 p35 p36 p37 p38 p39 p40 p41 p42 p43 p44 p45 p46 p47 p48 p49 p50 p51 p52 p53 p54 p55 p56 p57 p58 p59 p60 p61 p62 p63 p64 p65 p66 p67 p68 p69 p70 p71 p72 p73 p74  - piece
)

(:init

	(= (time-needed proccess_1 m1) 1)
	(= (time-needed proccess_1 m2) 2)
	(= (time-needed proccess_1 m3) 3)

	(= (time-needed proccess_2 m1) 2)
	(= (time-needed proccess_2 m2) 1)
	(= (time-needed proccess_2 m3) 3)

	(= (time-needed proccess_3 m1) 3)
	(= (time-needed proccess_3 m2) 2)
	(= (time-needed proccess_3 m3) 1)

	(is-done initial_proccess p0)
	(is-done initial_proccess p1)
	(is-done initial_proccess p2)
	(is-done initial_proccess p3)
	(is-done initial_proccess p4)
	(is-done initial_proccess p5)
	(is-done initial_proccess p6)
	(is-done initial_proccess p7)
	(is-done initial_proccess p8)
	(is-done initial_proccess p9)
	(is-done initial_proccess p10)
	(is-done initial_proccess p11)
	(is-done initial_proccess p12)
	(is-done initial_proccess p13)
	(is-done initial_proccess p14)
	(is-done initial_proccess p15)
	(is-done initial_proccess p16)
	(is-done initial_proccess p17)
	(is-done initial_proccess p18)
	(is-done initial_proccess p19)
	(is-done initial_proccess p20)
	(is-done initial_proccess p21)
	(is-done initial_proccess p22)
	(is-done initial_proccess p23)
	(is-done initial_proccess p24)
	(is-done initial_proccess p25)
	(is-done initial_proccess p26)
	(is-done initial_proccess p27)
	(is-done initial_proccess p28)
	(is-done initial_proccess p29)
	(is-done initial_proccess p30)
	(is-done initial_proccess p31)
	(is-done initial_proccess p32)
	(is-done initial_proccess p33)
	(is-done initial_proccess p34)
	(is-done initial_proccess p35)
	(is-done initial_proccess p36)
	(is-done initial_proccess p37)
	(is-done initial_proccess p38)
	(is-done initial_proccess p39)
	(is-done initial_proccess p40)
	(is-done initial_proccess p41)
	(is-done initial_proccess p42)
	(is-done initial_proccess p43)
	(is-done initial_proccess p44)
	(is-done initial_proccess p45)
	(is-done initial_proccess p46)
	(is-done initial_proccess p47)
	(is-done initial_proccess p48)
	(is-done initial_proccess p49)
	(is-done initial_proccess p50)
	(is-done initial_proccess p51)
	(is-done initial_proccess p52)
	(is-done initial_proccess p53)
	(is-done initial_proccess p54)
	(is-done initial_proccess p55)
	(is-done initial_proccess p56)
	(is-done initial_proccess p57)
	(is-done initial_proccess p58)
	(is-done initial_proccess p59)
	(is-done initial_proccess p60)
	(is-done initial_proccess p61)
	(is-done initial_proccess p62)
	(is-done initial_proccess p63)
	(is-done initial_proccess p64)
	(is-done initial_proccess p65)
	(is-done initial_proccess p66)
	(is-done initial_proccess p67)
	(is-done initial_proccess p68)
	(is-done initial_proccess p69)
	(is-done initial_proccess p70)
	(is-done initial_proccess p71)
	(is-done initial_proccess p72)
	(is-done initial_proccess p73)
	(is-done initial_proccess p74)
	

	(is-avaible m1)
	(is-avaible m2)
	(is-avaible m3)

	(is-first initial_proccess proccess_1)
	(is-first proccess_1 proccess_2)
	(is-first proccess_2 proccess_3)

	(support-procces m1 proccess_1)
	(support-procces m1 proccess_2)
	(support-procces m1 proccess_3)

	(support-procces m2 proccess_1)
	(support-procces m2 proccess_2)
	(support-procces m2 proccess_3)

	(support-procces m3 proccess_1)
	(support-procces m3 proccess_2)
	(support-procces m3 proccess_3)

)

(:goal
	(and
		(is-done proccess_3 p0)
		(is-done proccess_3 p1)
		(is-done proccess_3 p2)
		(is-done proccess_3 p3)
		(is-done proccess_3 p4)
		(is-done proccess_3 p5)
		(is-done proccess_3 p6)
		(is-done proccess_3 p7)
		(is-done proccess_3 p8)
		(is-done proccess_3 p9)
		(is-done proccess_3 p10)
		(is-done proccess_3 p11)
		(is-done proccess_3 p12)
		(is-done proccess_3 p13)
		(is-done proccess_3 p14)
		(is-done proccess_3 p15)
		(is-done proccess_3 p16)
		(is-done proccess_3 p17)
		(is-done proccess_3 p18)
		(is-done proccess_3 p19)
		(is-done proccess_3 p20)
		(is-done proccess_3 p21)
		(is-done proccess_3 p22)
		(is-done proccess_3 p23)
		(is-done proccess_3 p24)
		(is-done proccess_3 p25)
		(is-done proccess_3 p26)
		(is-done proccess_3 p27)
		(is-done proccess_3 p28)
		(is-done proccess_3 p29)
		(is-done proccess_3 p30)
		(is-done proccess_3 p31)
		(is-done proccess_3 p32)
		(is-done proccess_3 p33)
		(is-done proccess_3 p34)
		(is-done proccess_3 p35)
		(is-done proccess_3 p36)
		(is-done proccess_3 p37)
		(is-done proccess_3 p38)
		(is-done proccess_3 p39)
		(is-done proccess_3 p40)
		(is-done proccess_3 p41)
		(is-done proccess_3 p42)
		(is-done proccess_3 p43)
		(is-done proccess_3 p44)
		(is-done proccess_3 p45)
		(is-done proccess_3 p46)
		(is-done proccess_3 p47)
		(is-done proccess_3 p48)
		(is-done proccess_3 p49)
		(is-done proccess_3 p50)
		(is-done proccess_3 p51)
		(is-done proccess_3 p52)
		(is-done proccess_3 p53)
		(is-done proccess_3 p54)
		(is-done proccess_3 p55)
		(is-done proccess_3 p56)
		(is-done proccess_3 p57)
		(is-done proccess_3 p58)
		(is-done proccess_3 p59)
		(is-done proccess_3 p60)
		(is-done proccess_3 p61)
		(is-done proccess_3 p62)
		(is-done proccess_3 p63)
		(is-done proccess_3 p64)
		(is-done proccess_3 p65)
		(is-done proccess_3 p66)
		(is-done proccess_3 p67)
		(is-done proccess_3 p68)
		(is-done proccess_3 p69)
		(is-done proccess_3 p70)
		(is-done proccess_3 p71)
		(is-done proccess_3 p72)
		(is-done proccess_3 p73)
		(is-done proccess_3 p74)
		

))

(:metric 
        minimize (total-time)
)

)