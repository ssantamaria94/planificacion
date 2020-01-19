(define (domain chain-assembly)

	(:requirements :typing :durative-actions :action-costs :numeric-fluents)

	(:types
	        proccess - object
	        machine - object
	        piece - object
	)

	(:functions
		(time-needed ?p - proccess ?m - machine) - number
	)

	(:predicates
	    (is-done ?p -proccess ?x - piece)
	    (is-avaible ?m - machine)
	    (is-first ?p1 ?p2 - proccess)
	    (support-procces ?m - machine ?p - proccess)
	)
	  
    (:durative-action apply
        :parameters 
            (?p1 ?p2 - proccess
             ?m - machine 
             ?p - piece)
        
        :duration 
            (= ?duration (time-needed ?p2 ?m))
        
        :condition
	        (and 
	            (at start (is-done ?p1 ?p)) 
	            (at start (is-first ?p1 ?p2)) 
	            (at start (is-avaible ?m)) 
	            (at start (support-procces ?m ?p2)))
	            
        :effect
	        (and 
		    (at start (not (is-avaible ?m)))
	            (at end (is-avaible ?m))
	            (at end (is-done ?p2 ?p)))
	)
)
