(define (domain chain-assembly)

	(:requirements :typing :durative-actions :action-costs :numeric-fluents)

	(:types
	        proccess - object
	        machine - object
	)

	(:functions
		(time-needed ?p - proccess ?m - machine) - number
		(num-pieces ?p - proccess) - number
	)

	(:predicates
	    (is-avaible ?m - machine)
	    (is-first ?p1 ?p2 - proccess)
	    (support-procces ?m - machine ?p - proccess)
	)
	  
    (:durative-action apply
        :parameters 
            (?p1 ?p2 - proccess
             ?m - machine)
        
        :duration 
            (= ?duration (time-needed ?p2 ?m))
        
        :condition
	        (and 
	            (at start (is-first ?p1 ?p2)) 
	            (at start (is-avaible ?m)) 
	            (at start (support-procces ?m ?p2))
		    (at start (>= (num-pieces ?p1) 1))
		)
	            
        :effect
	        (and 
		    (at start (not (is-avaible ?m)))
		    (at start (decrease (num-pieces ?p1) 1))
	            (at end (is-avaible ?m))
		    (at end (increase (num-pieces ?p2) 1))
		)
	)
)


