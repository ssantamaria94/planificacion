(define (problem chain-01)
(:domain chain-assembly)

(:objects 
initial_proccess proccess_1 proccess_2 proccess_3  - proccess
m1 m2 m3 - machine
p0 p1 - piece
)

(:init

	(= (time-needed proccess_1 m1) 10)
	(= (time-needed proccess_1 m2) 20)
	(= (time-needed proccess_1 m3) 30)

	(= (time-needed proccess_2 m1) 20)
	(= (time-needed proccess_2 m2) 10)
	(= (time-needed proccess_2 m3) 30)

	(= (time-needed proccess_3 m1) 30)
	(= (time-needed proccess_3 m2) 20)
	(= (time-needed proccess_3 m3) 10)

	(is-done initial_proccess p0)
	(is-done initial_proccess p1)

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

))

(:metric 
        minimize (total-time)
)

)
