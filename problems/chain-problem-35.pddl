(define (problem chain-35)
(:domain chain-assembly)

(:objects 
initial_proccess proccess_1 proccess_2 proccess_3  - proccess
m1 m2 m3 - machine
)

(:init

	(= (num-pieces initial_proccess) 35)
	(= (num-pieces proccess_1) 0)
	(= (num-pieces proccess_2) 0)
	(= (num-pieces proccess_3) 0)


	(= (time-needed proccess_1 m1) 1)
	(= (time-needed proccess_1 m2) 2)
	(= (time-needed proccess_1 m3) 3)

	(= (time-needed proccess_2 m1) 2)
	(= (time-needed proccess_2 m2) 1)
	(= (time-needed proccess_2 m3) 3)

	(= (time-needed proccess_3 m1) 3)
	(= (time-needed proccess_3 m2) 2)
	(= (time-needed proccess_3 m3) 1)

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
		(= (num-pieces proccess_3) 35)

))

(:metric 
        minimize (total-time)
)

)
