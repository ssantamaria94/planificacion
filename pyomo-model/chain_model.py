#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Wed Jan 15 16:07:36 2020

@author: sergio
"""

from __future__ import division
from pyomo.environ import *
from pyomo.opt import SolverFactory
# _____________________________________________________________________________

model = AbstractModel()
data = DataPortal()
# _____________________________________________________________________________

model.tf = Param() # Periodos del horizonte de planificacion

# =============================================================================
# SETS
# =============================================================================

model.M = Set() # Maquinas del modelo
model.F = Set() # Procesos del modelo

model.T = RangeSet(1, model.tf) # Conjunto de periodos
model.TAux = RangeSet(1, model.tf - 1) # Conjunto de periodos 1..t-1

model.O = Set(domain = model.F * model.F) # Conjunto de predecesores de los procesos (f1,f2) -> f1 debe realizarse antes que f2
model.FF = Set(domain = model.F) # Conjunto de procesos finales
#model.FI = Set(domain = model.F) # Conjunto de procesos iniciales

# =============================================================================
# PARAMETERS
# =============================================================================


model.t_machine = Param(model.F, model.M, domain=NonNegativeIntegers, default = 0) # Tiempo en realizar el proceso f en la maquina m
model.d_process = Param(model.FF, domain=NonNegativeIntegers) # Demanda de piezas con un determinado proceso final
model.c = Param(model.F, model.M, domain=Binary) # Compatibilidad entre maquinas y procesos
#model.init_n = Param(model.F, domain=NonNegativeIntegers)
model.L = Param(domain = NonNegativeIntegers, initialize = 10000)


def GetSetAuxE5(model):
    l = list()
    for t in model.T:
        for m in model.M:
            for f in model.F:
                t1 = model.tf - t
                t_extra = min(t1, model.t_machine[f,m])
                l.append((t,m,f,t_extra))
    return l

model.SET_E5 = Set(dimen = 4, initialize=GetSetAuxE5)
# =============================================================================
# VARIABLES
# =============================================================================

model.alpha = Var(model.F, model.M, model.T, domain=Binary)
model.n = Var(model.T, model.F, domain = NonNegativeIntegers)
model.makespan = Var(domain=NonNegativeIntegers)


# =============================================================================
# CONSTRAINTS
# =============================================================================

### Define la relacion de orden entre los procesos a aplicar en una pieza

def ProccessOrder(model, m, f1, f2, t):
    sum1 = sum(model.alpha[f1,m2,t2] for m2 in model.M for t2 in range(1, value(t) - value(model.t_machine[f1, m2]) + 1))
    return model.alpha[f2,m,t] <= sum1

model.E1 = Constraint(model.M, model.O, model.T, rule = ProccessOrder)

def Demand(model, f):
    sum1 = sum(model.alpha[f,m,i] for m in model.M for i in range(1, value(model.tf) - value(model.t_machine[f,m]) + 1))
    return sum1 >= model.d_process[f]

### Establece la demanda que se debe producir de cada pieza
model.E2 = Constraint(model.FF, rule = Demand)

def Compatibility(model, f, m, t):
    return model.alpha[f,m,t] <= model.c[f,m]

### Define si un proceso se puede realizar en una determinada maquina
model.E3 = Constraint(model.F, model.M, model.T, rule = Compatibility)


def MachineConcurrency1(model, t, m, f, t_extra):
    if t_extra == 0:
        return Constraint.Skip
    else:
        sum1 = sum(model.alpha[f2, m, t + i] for f2 in model.F for i in range(1, value(t_extra)))
        return model.L * model.alpha[f, m, t] + sum1 <= model.L

### Impide que una misma maquina sea utilizada en paralelo
model.E4A = Constraint(model.SET_E5, rule = MachineConcurrency1)

def MachineConcurrency2(model, t, m):
    sum1 = sum(model.alpha[f2, m, t] for f2 in model.F)
    return sum1 <= 1

### Impide que una misma pieza se trate en paralelo
model.E4B = Constraint(model.T, model.M, rule = MachineConcurrency2)

def PieceInventory(model, t, f1, f2):
    n_old = 0
    
    index = [(m, model.t_machine[f1,m]) for m in model.M if (t - model.t_machine[f1,m]) > 0]
    sum1 = sum(model.alpha[f1, m, t - i] for (m,i) in index)
    sum2 = sum(model.alpha[f2, m, t] for m in model.M)
    if value(t) != 1:
        n_old = model.n[t-1, f1] 
        
    return model.n[t,f1] == n_old + sum1 - sum2
### Impide que una misma pieza se trate en paralelo
model.E5A = Constraint(model.T, model.O, rule = PieceInventory)

def PieceInventory2(model, t, f):
    n_old = 0
    index = [(m, model.t_machine[f,m]) for m in model.M if (t - model.t_machine[f,m]) > 0]
    
    sum1 = sum(model.alpha[f, m, t - i] for (m,i) in index)
    if t != 1:
        n_old = model.n[t-1, f] 
        
    return model.n[t,f] == n_old + sum1

### Impide que una misma pieza se trate en paralelo
model.E5B = Constraint(model.T, model.FF, rule = PieceInventory2)

def NumPeriods(model, t, m, f):
    sum1 = (model.alpha[f,m,t] * t) + model.t_machine[f,m]
    return model.makespan >= sum1

### Para contar el numero de periodos
model.E6 = Constraint(model.T, model.M, model.F, rule = NumPeriods)

# =============================================================================
# OBJECTIVE FUNCTION
# =============================================================================

def CountPeriods(model):
    return model.makespan

model.funObj = Objective(rule = CountPeriods, sense = minimize)