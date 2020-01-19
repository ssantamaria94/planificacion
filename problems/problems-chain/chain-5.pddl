(define (problem chain-01)
(:domain chain-assembly)

(:objects 
initial_proccess proccess_1 proccess_2 proccess_3  - proccess
m1 m2 m3 - machine
p0 p1 p2 p3 p4  - piece
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
		

))

(:metric 
        minimize (total-time)
)

)
