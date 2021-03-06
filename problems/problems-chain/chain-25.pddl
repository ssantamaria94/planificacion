(define (problem chain-01)
(:domain chain-assembly)

(:objects 
initial_proccess proccess_1 proccess_2 proccess_3  - proccess
m1 m2 m3 - machine
p0 p1 p2 p3 p4 p5 p6 p7 p8 p9 p10 p11 p12 p13 p14 p15 p16 p17 p18 p19 p20 p21 p22 p23 p24  - piece
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
		

))

(:metric 
        minimize (total-time)
)

)
