#include(slide.inc)

% Because CD++ does not allow for Hexagonal topologies or loops it is not
% possible to follow the SCIDDICA S-3 Hex rules exactly.
% There are 2 differences
% 1. A square nearest neighbor neighborhood is used.
% 2. The Debris outflow calculation does not loop
%		That is the SCIDDICA rules for outflow are as follows:
%			1.  Calculate B[i] = Q[0] - Q[i]
%			2.  If B[i] > Pf add cell i to set A
%			3.  Average = P(altitude, debris) + Sum( Q[i] in A)/ #A
%			4.  For all Q[i] in A, if Q[i] < Pf remove i from A
%			5.  If there were any changes to A, go back to 3.
%			6.  For all cells in A  outflow[i] = Average - Q[i]
%			7.	All other cells, outflow[i] = 0
%
%		CD++ does not allow us to implement step 5.  Therefore,
%		we are not using steps 4 or 5.
%

[top]
components : landslide

[landslide]
type : cell
dim : (10,10,13)
delay : transport
defaultDelayTime : 100
border : nowrapped
initialValue : ?
initialCellsValue : peaks.val
%
% The nearest neighbor neighborhood is used with the
% following convention for cell names (within a 2D plane).
%
%  [ 3 ] [ 2 ] [ 1 ]
%  [ 4 ] [ 0 ] [ 8 ]
%  [ 5 ] [ 6 ] [ 7 ]
%
%
% Neighborhoods are defined relative to a given cell, therefore
% we have to include negative numbers, which do not exist for
% altitude (z = 0), in order to allow runup (z = 12) to access values
% beneath it.
%
neighbors : landslide(-1,1,-11) landslide(0,1,-11) landslide(1,1,-11)
neighbors : landslide(-1,0,-11) landslide(0,0,-11) landslide(1,0,-11)
neighbors : landslide(-1,-1,-11) landslide(0,-1,-11) landslide(1,-1,-11)
neighbors : landslide(-1,1,-10) landslide(0,1,-10) landslide(1,1,-10)
neighbors : landslide(-1,0,-10) landslide(0,0,-10) landslide(1,0,-10)
neighbors : landslide(-1,-1,-10) landslide(0,-1,-10) landslide(1,-1,-10)
neighbors : landslide(-1,1,-9) landslide(0,1,-9) landslide(1,1,-9)
neighbors : landslide(-1,0,-9) landslide(0,0,-9) landslide(1,0,-9)
neighbors : landslide(-1,-1,-9) landslide(0,-1,-9) landslide(1,-1,-9)
neighbors : landslide(-1,1,-8) landslide(0,1,-8) landslide(1,1,-8)
neighbors : landslide(-1,0,-8) landslide(0,0,-8) landslide(1,0,-8)
neighbors : landslide(-1,-1,-8) landslide(0,-1,-8) landslide(1,-1,-8)
neighbors : landslide(-1,1,-7) landslide(0,1,-7) landslide(1,1,-7)
neighbors : landslide(-1,0,-7) landslide(0,0,-7) landslide(1,0,-7)
neighbors : landslide(-1,-1,-7) landslide(0,-1,-7) landslide(1,-1,-7)
neighbors : landslide(-1,1,-6) landslide(0,1,-6) landslide(1,1,-6)
neighbors : landslide(-1,0,-6) landslide(0,0,-6) landslide(1,0,-6)
neighbors : landslide(-1,-1,-6) landslide(0,-1,-6) landslide(1,-1,-6)
neighbors : landslide(-1,1,-5) landslide(0,1,-5) landslide(1,1,-5)
neighbors : landslide(-1,0,-5) landslide(0,0,-5) landslide(1,0,-5)
neighbors : landslide(-1,-1,-5) landslide(0,-1,-5) landslide(1,-1,-5)
neighbors : landslide(-1,1,-4) landslide(0,1,-4) landslide(1,1,-4)
neighbors : landslide(-1,0,-4) landslide(0,0,-4) landslide(1,0,-4)
neighbors : landslide(-1,-1,-4) landslide(0,-1,-4) landslide(1,-1,-4)
neighbors : landslide(-1,1,-3) landslide(0,1,-3) landslide(1,1,-3)
neighbors : landslide(-1,0,-3) landslide(0,0,-3) landslide(1,0,-3)
neighbors : landslide(-1,-1,-3) landslide(0,-1,-3) landslide(1,-1,-3)
neighbors : landslide(-1,1,-2) landslide(0,1,-2) landslide(1,1,-2)
neighbors : landslide(-1,0,-2) landslide(0,0,-2) landslide(1,0,-2)
neighbors : landslide(-1,-1,-2) landslide(0,-1,-2) landslide(1,-1,-2)
neighbors : landslide(-1,1,-1) landslide(0,1,-1) landslide(1,1,-1)
neighbors : landslide(-1,0,-1) landslide(0,0,-1) landslide(1,0,-1)
neighbors : landslide(-1,-1,-1) landslide(0,-1,-1) landslide(1,-1,-1)
neighbors : landslide(-1,1,0) landslide(0,1,0) landslide(1,1,0)
neighbors : landslide(-1,0,0) landslide(0,0,0) landslide(1,0,0)
neighbors : landslide(-1,-1,0) landslide(0,-1,0) landslide(1,-1,0)
neighbors : landslide(-1,1,1) landslide(0,1,1) landslide(1,1,1)
neighbors : landslide(-1,0,1) landslide(0,0,1) landslide(1,0,1)
neighbors : landslide(-1,-1,1) landslide(0,-1,1) landslide(1,-1,1)
neighbors : landslide(-1,1,2) landslide(0,1,2) landslide(1,1,2)
neighbors : landslide(-1,0,2) landslide(0,0,2) landslide(1,0,2)
neighbors : landslide(-1,-1,2) landslide(0,-1,2) landslide(1,-1,2)
neighbors : landslide(-1,1,3) landslide(0,1,3) landslide(1,1,3)
neighbors : landslide(-1,0,3) landslide(0,0,3) landslide(1,0,3)
neighbors : landslide(-1,-1,3) landslide(0,-1,3) landslide(1,-1,3)
neighbors : landslide(-1,1,4) landslide(0,1,4) landslide(1,1,4)
neighbors : landslide(-1,0,4) landslide(0,0,4) landslide(1,0,4)
neighbors : landslide(-1,-1,4) landslide(0,-1,4) landslide(1,-1,4)
neighbors : landslide(-1,1,5) landslide(0,1,5) landslide(1,1,5)
neighbors : landslide(-1,0,5) landslide(0,0,5) landslide(1,0,5)
neighbors : landslide(-1,-1,5) landslide(0,-1,5) landslide(1,-1,5)
neighbors : landslide(-1,1,6) landslide(0,1,6) landslide(1,1,6)
neighbors : landslide(-1,0,6) landslide(0,0,6) landslide(1,0,6)
neighbors : landslide(-1,-1,6) landslide(0,-1,6) landslide(1,-1,6)
neighbors : landslide(-1,1,7) landslide(0,1,7) landslide(1,1,7)
neighbors : landslide(-1,0,7) landslide(0,0,7) landslide(1,0,7)
neighbors : landslide(-1,-1,7) landslide(0,-1,7) landslide(1,-1,7)
neighbors : landslide(-1,1,8) landslide(0,1,8) landslide(1,1,8)
neighbors : landslide(-1,0,8) landslide(0,0,8) landslide(1,0,8)
neighbors : landslide(-1,-1,8) landslide(0,-1,8) landslide(1,-1,8)
neighbors : landslide(-1,1,9) landslide(0,1,9) landslide(1,1,9)
neighbors : landslide(-1,0,9) landslide(0,0,9) landslide(1,0,9)
neighbors : landslide(-1,-1,9) landslide(0,-1,9) landslide(1,-1,9)
neighbors : landslide(-1,1,9) landslide(0,1,10) landslide(1,1,10)
neighbors : landslide(-1,0,9) landslide(0,0,10) landslide(1,0,10)
neighbors : landslide(-1,-1,9) landslide(0,-1,10) landslide(1,-1,10)
neighbors : landslide(-1,1,9) landslide(0,1,11) landslide(1,1,11)
neighbors : landslide(-1,0,9) landslide(0,0,11) landslide(1,0,11)
neighbors : landslide(-1,-1,9) landslide(0,-1,11) landslide(1,-1,11)
neighbors : landslide(-1,1,12) landslide(0,1,12) landslide(1,1,12)
neighbors : landslide(-1,0,12) landslide(0,0,12) landslide(1,0,12)
neighbors : landslide(-1,-1,12) landslide(0,-1,12) landslide(1,-1,12)

localTransition : DefaultTransition

zone : altitude { (0,0,0)..(9,9,0) }
zone : erodable_soil_depth { (0,0,1)..(9,9,1) }
zone : landslide_energy { (0,0,2)..(9,9,2) }
zone : debris_thickness { (0,0,3)..(9,9,3) }
zone : debris_outflow_to_1 { (0,0,4)..(9,9,4) }
zone : debris_outflow_to_2 { (0,0,5)..(9,9,5) }
zone : debris_outflow_to_3 { (0,0,6)..(9,9,6) }
zone : debris_outflow_to_4 { (0,0,7)..(9,9,7) }
zone : debris_outflow_to_5 { (0,0,8)..(9,9,8) }
zone : debris_outflow_to_6 { (0,0,9)..(9,9,9) }
zone : debris_outflow_to_7 { (0,0,10)..(9,9,10) }
zone : debris_outflow_to_8 { (0,0,11)..(9,9,11) }
zone : runup { (0,0,12)..(9,9,12) }

[altitude]
rule : { (0,0,0) - if( (((0,0,2) - #Macro(p_mt))*#Macro(p_erosion)) < (0,0,1), ((0,0,2) - #Macro(p_mt))*#Macro(p_erosion), (0,0,1) )  } #Macro(p_time) { ((0,0,1) != 0)AND((0,0,2) > #Macro(p_mt)) }
rule : { (0,0,0) } #Macro(p_time) { t }

[erodable_soil_depth]
rule : { (0,0,0) - if( (((0,0,1) - #Macro(p_mt))*#Macro(p_erosion)) < (0,0,0), ((0,0,1) - #Macro(p_mt))*#Macro(p_erosion),(0,0,0) ) } #Macro(p_time) { ((0,0,0) != 0)AND((0,0,1) > #Macro(p_mt)) }
rule : { (0,0,0) } #Macro(p_time) { t }

[landslide_energy]
% new energy = ((old_thickness - outflows) * old_energy/old_thickness)
%              + sum(1..6)(inflow_from_cell(i) * ((energy_cell(i)/thickness_cell(i)))
% also new energy += pe gained from increased debris
% also new energry -= energy used to erode the soil
rule : { (0,0,0) } #Macro(p_time) { (0,0,0) = 0 AND ((1,1,6) = 0 OR (1,1,6) = ?) AND ((0,1,7) = 0 OR (0,1,7) = ?) AND ((-1,1,8) = 0 OR (-1,1,8) = ?) AND ((-1,0,9) = 0 OR (-1,0,9) = ?) AND ((-1,-1,2) = 0 OR (-1,-1,2) = ?) AND ((0,-1,3) = 0 OR (0,-1,3) = ?) AND ((1,-1,4) = 0 OR (1,-1,4) = ?) AND ((1,0,5) = 0 OR (1,0,5) = ?) }
rule : 0 #Macro(p_time) { (0,0,1) = 0 }
rule : { (0,0,0) + ( if((1,1,1)   != 0 AND (1,1,0)   != ?, (1,1,6)*((1,1,0)/(1,1,1)),0 )       +
            if((0,1,0)   != ? AND (0,1,1)   != 0, (0,1,7)*((0,1,0)/(0,1,1)),0 )       +
            if((-1,1,0)  != ? AND (-1,1,1)  != 0, (-1,1,8)*((-1,1,0)/(-1,1,1)),0 )    +
            if((-1,0,0)  != ? AND (-1,0,1)  != 0, (-1,0,9)*((-1,0,0)/(-1,0,1)),0 )    +
            if((-1,-1,0) != ? AND (-1,-1,1) != 0, (-1,-1,2)*((-1,-1,0)/(-1,-1,1)),0 ) +
            if((0,-1,0)  != ? AND (0,-1,1)  != 0, (0,-1,3)*((0,-1,0)/(0,-1,1)),0 )    +
            if((1,-1,0)  != ? AND (1,-1,1)  != 0, (1,-1,4)*((1,-1,0)/(1,-1,1)),0 )    +
            if((1,0,0)   != ? AND (1,0,1)   != 0, (1,0,5)*((1,0,0)/(1,0,1)),0 )       ) } #Macro(p_time) { (0,0,-1) = 0 AND (0,0,2) = 0 AND (0,0,3) = 0 AND (0,0,4) = 0 AND (0,0,5) = 0 AND (0,0,6) = 0 AND (0,0,7) = 0 AND (0,0,8) = 0 AND (0,0,9) = 0 }
rule : { if( ( ((0,0,1) - ((0,0,2) + (0,0,3) + (0,0,4) + (0,0,5) + (0,0,6) + (0,0,7) + (0,0,8) + (0,0,9))) * ( if((0,0,1) != 0,(0,0,0)/(0,0,1),0) ) ) +
          ( if((1,1,1)   != 0 AND (1,1,0)   != ?, (1,1,6)*((1,1,0)/(1,1,1)),0 )       +
            if((0,1,0)   != ? AND (0,1,1)   != 0, (0,1,7)*((0,1,0)/(0,1,1)),0 )       +
            if((-1,1,0)  != ? AND (-1,1,1)  != 0, (-1,1,8)*((-1,1,0)/(-1,1,1)),0 )    +
            if((-1,0,0)  != ? AND (-1,0,1)  != 0, (-1,0,9)*((-1,0,0)/(-1,0,1)),0 )    +
            if((-1,-1,0) != ? AND (-1,-1,1) != 0, (-1,-1,2)*((-1,-1,0)/(-1,-1,1)),0 ) +
            if((0,-1,0)  != ? AND (0,-1,1)  != 0, (0,-1,3)*((0,-1,0)/(0,-1,1)),0 )    +
            if((1,-1,0)  != ? AND (1,-1,1)  != 0, (1,-1,4)*((1,-1,0)/(1,-1,1)),0 )    +
            if((1,0,0)   != ? AND (1,0,1)   != 0, (1,0,5)*((1,0,0)/(1,0,1)),0 )       ) +
            ((0,0,0) + ( (0,0,0)*( if( (0,0,1) != 0, if( (((0,0,0) - #Macro(p_mt)) * #Macro(p_erosion) ) < (0,0,-1),((0,0,0) - #Macro(p_mt)) * #Macro(p_erosion) , (0,0,-1)) /(0,0,1),0))) +
            (#Macro(k)*( (0,0,1)*(if( (((0,0,0) - #Macro(p_mt)) * #Macro(p_erosion) )< (0,0,-1),((0,0,0) - #Macro(p_mt)) * #Macro(p_erosion) , (0,0,-1))) +
            (if( (((0,0,0) - #Macro(p_mt)) * #Macro(p_erosion) ) < (0,0,-1), ((0,0,0) - #Macro(p_mt)) * #Macro(p_erosion) , (0,0,-1))*
            (if( ((0,0,0) - #Macro(p_mt)) * #Macro(p_erosion) < (0,0,-1),((0,0,0) - #Macro(p_mt)) * #Macro(p_erosion) , (0,0,-1)))) )) ) -
            ( #Macro(k) * if( (0,0,1) != 0 AND (( #Macro(k) * ((0,0,0)/(0,0,1))  ) - (0,0,1) ) < (0,0,1),((#Macro(k) * ((0,0,0)/(0,0,1)) ) - (0,0,1)),#Macro(p_runup_loss) * (0,0,1))) > 0, ( ((0,0,1) - ((0,0,2) + (0,0,3) + (0,0,4) + (0,0,5) + (0,0,6) + (0,0,7) + (0,0,8) + (0,0,9))) * ( if((0,0,1) != 0,(0,0,0)/(0,0,1),0) ) ) +
          ( if((1,1,1)   != 0 AND (1,1,0)   != ?, (1,1,6)*((1,1,0)/(1,1,1)),0 )       +
            if((0,1,0)   != ? AND (0,1,1)   != 0, (0,1,7)*((0,1,0)/(0,1,1)),0 )       +
            if((-1,1,0)  != ? AND (-1,1,1)  != 0, (-1,1,8)*((-1,1,0)/(-1,1,1)),0 )    +
            if((-1,0,0)  != ? AND (-1,0,1)  != 0, (-1,0,9)*((-1,0,0)/(-1,0,1)),0 )    +
            if((-1,-1,0) != ? AND (-1,-1,1) != 0, (-1,-1,2)*((-1,-1,0)/(-1,-1,1)),0 ) +
            if((0,-1,0)  != ? AND (0,-1,1)  != 0, (0,-1,3)*((0,-1,0)/(0,-1,1)),0 )    +
            if((1,-1,0)  != ? AND (1,-1,1)  != 0, (1,-1,4)*((1,-1,0)/(1,-1,1)),0 )    +
            if((1,0,0)   != ? AND (1,0,1)   != 0, (1,0,5)*((1,0,0)/(1,0,1)),0 )       ) +
            ((0,0,0) + ( (0,0,0)*( if( (0,0,1) != 0, if( (((0,0,0) - #Macro(p_mt)) * #Macro(p_erosion) ) < (0,0,-1),((0,0,0) - #Macro(p_mt)) * #Macro(p_erosion) , (0,0,-1)) /(0,0,1),0))) +
            (#Macro(k)*( (0,0,1)*(if( (((0,0,0) - #Macro(p_mt)) * #Macro(p_erosion) )< (0,0,-1),((0,0,0) - #Macro(p_mt)) * #Macro(p_erosion) , (0,0,-1))) +
            (if( (((0,0,0) - #Macro(p_mt)) * #Macro(p_erosion) ) < (0,0,-1), ((0,0,0) - #Macro(p_mt)) * #Macro(p_erosion) , (0,0,-1))*
            (if( ((0,0,0) - #Macro(p_mt)) * #Macro(p_erosion) < (0,0,-1),((0,0,0) - #Macro(p_mt)) * #Macro(p_erosion) , (0,0,-1)))) )) ) -
            ( #Macro(k) * if( (0,0,1) != 0 AND (( #Macro(k) * ((0,0,0)/(0,0,1))  ) - (0,0,1) ) < (0,0,1),((#Macro(k) * ((0,0,0)/(0,0,1)) ) - (0,0,1)),#Macro(p_runup_loss) * (0,0,1))) ,0) }
            #Macro(p_time) {t}

[debris_thickness]
% subtract the outflows from the inflows and add to the previous
% thickness to get the new debris thickness
% then add in the freshly eroded soil

rule : {if( (0,0,0) + ( if((1,1,0)   != ?,(1,1,5) - (0,0,1),0)   +
                        if((0,1,0)   != ?,(0,1,6) - (0,0,2),0)   +
                        if((-1,1,0)  != ?,(-1,1,7) - (0,0,3),0)  +
                        if((-1,0,0)  != ?,(-1,0,8) - (0,0,4),0)  +
                        if((-1,-1,0) != ?,(-1,-1,1) - (0,0,5),0) +
                        if((0,-1,0 ) != ?,(0,-1,2) - (0,0,6),0)  +
                        if((1,-1,0)  != ?,(1,-1,3) - (0,0,7),0)  +
                        if((1,0,0)   != ?,(1,0,4) - (0,0,8),0)   ) +
            if( ((0,0,-1) - #Macro(p_mt)) * #Macro(p_erosion) > 0, if( (((0,0,-1) - #Macro(p_mt)) * #Macro(p_erosion)) < (0,0,-2),((0,0,-1) - #Macro(p_mt)) * #Macro(p_erosion) ,(0,0,-2) ),0) > 0,(0,0,0) + ( if((1,1,0)   != ?,(1,1,5) - (0,0,1),0)   +
                        if((0,1,0)   != ?,(0,1,6) - (0,0,2),0)   +
                        if((-1,1,0)  != ?,(-1,1,7) - (0,0,3),0)  +
                        if((-1,0,0)  != ?,(-1,0,8) - (0,0,4),0)  +
                        if((-1,-1,0) != ?,(-1,-1,1) - (0,0,5),0) +
                        if((0,-1,0 ) != ?,(0,-1,2) - (0,0,6),0)  +
                        if((1,-1,0)  != ?,(1,-1,3) - (0,0,7),0)  +
                        if((1,0,0)   != ?,(1,0,4) - (0,0,8),0)   ) +
		            if( ((0,0,-1) - #Macro(p_mt)) * #Macro(p_erosion) > 0, if( (((0,0,-1) - #Macro(p_mt)) * #Macro(p_erosion)) < (0,0,-2),((0,0,-1) - #Macro(p_mt)) * #Macro(p_erosion) ,(0,0,-2) ),0) ,0) }
            #Macro(p_time) {t}

[debris_outflow_to_1]
rule :  { if( #Macro(B_1) > #Macro(p_friction),
			if( ((#Macro(k)*(0,0,-2)/(0,0,-1)) - #Macro(p_adhesion)) +
                (( #Macro(Q_1_1) +
                if( (0,1,0)   != ?,if( #Macro(B_1_2) > #Macro(p_friction),#Macro(Q_1_2),0),0) +
                if( (-1,1,0)  != ?,if( #Macro(B_1_3) > #Macro(p_friction),#Macro(Q_1_3),0),0) +
                if( (-1,0,0)  != ?,if( #Macro(B_1_4) > #Macro(p_friction),#Macro(Q_1_4),0),0) +
                if( (-1,-1,0) != ?,if( #Macro(B_1_5) > #Macro(p_friction),#Macro(Q_1_5),0),0) +
                if( (0,-1,0)  != ?,if( #Macro(B_1_6) > #Macro(p_friction),#Macro(Q_1_6),0),0) +
                if( (1,-1,0)  != ?,if( #Macro(B_1_7) > #Macro(p_friction),#Macro(Q_1_7),0),0) +
                if( (1,0,0)   != ?,if( #Macro(B_1_8) > #Macro(p_friction),#Macro(Q_1_8),0),0) ) /
                ( 1 +
                if( (0,1,0)   != ?,if( #Macro(B_1_2) > #Macro(p_friction),1,0),0) +
                if( (-1,1,0)  != ?,if( #Macro(B_1_3) > #Macro(p_friction),1,0),0) +
                if( (-1,0,0)  != ?,if( #Macro(B_1_4) > #Macro(p_friction),1,0),0) +
                if( (-1,-1,0) != ?,if( #Macro(B_1_5) > #Macro(p_friction),1,0),0) +
                if( (0,-1,0)  != ?,if( #Macro(B_1_6) > #Macro(p_friction),1,0),0) +
                if( (1,-1,0)  != ?,if( #Macro(B_1_7) > #Macro(p_friction),1,0),0) +
                if( (1,0,0)   != ?,if( #Macro(B_1_8) > #Macro(p_friction),1,0),0) )) > #Macro(Q_1_1),
                		((#Macro(k)*(0,0,-2)/(0,0,-1)) - #Macro(p_adhesion)) +
		                (( #Macro(Q_1_1) +
		                if( (0,1,0)   != ?,if( #Macro(B_1_2) > #Macro(p_friction),#Macro(Q_1_2),0),0) +
        		        if( (-1,1,0)  != ?,if( #Macro(B_1_3) > #Macro(p_friction),#Macro(Q_1_3),0),0) +
		                if( (-1,0,0)  != ?,if( #Macro(B_1_4) > #Macro(p_friction),#Macro(Q_1_4),0),0) +
		                if( (-1,-1,0) != ?,if( #Macro(B_1_5) > #Macro(p_friction),#Macro(Q_1_5),0),0) +
		                if( (0,-1,0)  != ?,if( #Macro(B_1_6) > #Macro(p_friction),#Macro(Q_1_6),0),0) +
		                if( (1,-1,0)  != ?,if( #Macro(B_1_7) > #Macro(p_friction),#Macro(Q_1_7),0),0) +
		                if( (1,0,0)   != ?,if( #Macro(B_1_8) > #Macro(p_friction),#Macro(Q_1_8),0),0) ) /
		                ( 1 +
		                if( (0,1,0)   != ?,if( #Macro(B_1_2) > #Macro(p_friction),1,0),0) +
		                if( (-1,1,0)  != ?,if( #Macro(B_1_3) > #Macro(p_friction),1,0),0) +
		                if( (-1,0,0)  != ?,if( #Macro(B_1_4) > #Macro(p_friction),1,0),0) +
		                if( (-1,-1,0) != ?,if( #Macro(B_1_5) > #Macro(p_friction),1,0),0) +
		                if( (0,-1,0)  != ?,if( #Macro(B_1_6) > #Macro(p_friction),1,0),0) +
		                if( (1,-1,0)  != ?,if( #Macro(B_1_7) > #Macro(p_friction),1,0),0) +
		                if( (1,0,0)   != ?,if( #Macro(B_1_8) > #Macro(p_friction),1,0),0) ) - #Macro(Q_1_1)),0),0) } #Macro(p_time) {(1,1,0) != ? AND (0,0,-1) != 0}
rule : 0 #Macro(p_time) {t}

[debris_outflow_to_2]
rule :  { if( #Macro(B_2) > #Macro(p_friction),
			if(((#Macro(k)*(0,0,-3)/(0,0,-2)) - #Macro(p_adhesion)) +
				((#Macro(Q_2_2) +
    			  if( (1,1,0)   != ?,if( #Macro(B_2_1) > #Macro(p_friction),#Macro(Q_2_1),0),0) +
			      if( (-1,1,0)  != ?,if( #Macro(B_2_3) > #Macro(p_friction),#Macro(Q_2_3),0),0) +
			      if( (-1,0,0)  != ?,if( #Macro(B_2_4) > #Macro(p_friction),#Macro(Q_2_4),0),0) +
			      if( (-1,-1,0) != ?,if( #Macro(B_2_5) > #Macro(p_friction),#Macro(Q_2_5),0),0) +
    			  if( (0,-1,0)  != ?,if( #Macro(B_2_6) > #Macro(p_friction),#Macro(Q_2_6),0),0) +
    			  if( (1,-1,0)  != ?,if( #Macro(B_2_7) > #Macro(p_friction),#Macro(Q_2_7),0),0) +
    			  if( (1,0,0)   != ?,if( #Macro(B_2_8) > #Macro(p_friction),#Macro(Q_2_8),0),0) ) /
			    ( 1 +
			      if( (1,1,0)   != ?,if( #Macro(B_2_1) > #Macro(p_friction),1,0),0) +
		 	      if( (-1,1,0)  != ?,if( #Macro(B_2_3) > #Macro(p_friction),1,0),0) +
			      if( (-1,0,0)  != ?,if( #Macro(B_2_4) > #Macro(p_friction),1,0),0) +
			      if( (-1,-1,0) != ?,if( #Macro(B_2_5) > #Macro(p_friction),1,0),0) +
			      if( (0,-1,0)  != ?,if( #Macro(B_2_6) > #Macro(p_friction),1,0),0) +
			      if( (1,-1,0)  != ?,if( #Macro(B_2_7) > #Macro(p_friction),1,0),0) +
			      if( (1,0,0)   != ?,if( #Macro(B_2_8) > #Macro(p_friction),1,0),0) )) > #Macro(Q_2_2), ((#Macro(k)*(0,0,-3)/(0,0,-2)) - #Macro(p_adhesion)) +
				((#Macro(Q_2_2) +
    			  if( (1,1,0)   != ?,if( #Macro(B_2_1) > #Macro(p_friction),#Macro(Q_2_1),0),0) +
			      if( (-1,1,0)  != ?,if( #Macro(B_2_3) > #Macro(p_friction),#Macro(Q_2_3),0),0) +
			      if( (-1,0,0)  != ?,if( #Macro(B_2_4) > #Macro(p_friction),#Macro(Q_2_4),0),0) +
			      if( (-1,-1,0) != ?,if( #Macro(B_2_5) > #Macro(p_friction),#Macro(Q_2_5),0),0) +
    			  if( (0,-1,0)  != ?,if( #Macro(B_2_6) > #Macro(p_friction),#Macro(Q_2_6),0),0) +
    			  if( (1,-1,0)  != ?,if( #Macro(B_2_7) > #Macro(p_friction),#Macro(Q_2_7),0),0) +
    			  if( (1,0,0)   != ?,if( #Macro(B_2_8) > #Macro(p_friction),#Macro(Q_2_8),0),0) ) /
			    ( 1 +
			      if( (1,1,0)   != ?,if( #Macro(B_2_1) > #Macro(p_friction),1,0),0) +
		 	      if( (-1,1,0)  != ?,if( #Macro(B_2_3) > #Macro(p_friction),1,0),0) +
			      if( (-1,0,0)  != ?,if( #Macro(B_2_4) > #Macro(p_friction),1,0),0) +
			      if( (-1,-1,0) != ?,if( #Macro(B_2_5) > #Macro(p_friction),1,0),0) +
			      if( (0,-1,0)  != ?,if( #Macro(B_2_6) > #Macro(p_friction),1,0),0) +
			      if( (1,-1,0)  != ?,if( #Macro(B_2_7) > #Macro(p_friction),1,0),0) +
			      if( (1,0,0)   != ?,if( #Macro(B_2_8) > #Macro(p_friction),1,0),0) )) - #Macro(Q_2_2),0),0) } #Macro(p_time) {(0,1,0) != ? AND (0,0,-2) != 0}
rule : 0 #Macro(p_time) {t}

[debris_outflow_to_3]
rule :  { if( #Macro(B_3) > #Macro(p_friction),
			if( ((#Macro(k)*(0,0,-4)/(0,0,-3)) - #Macro(p_adhesion)) +
				((#Macro(Q_3_3)   +
			      if( (1,1,0)   != ?,if( #Macro(B_3_1) > #Macro(p_friction),#Macro(Q_3_1),0),0) +
			      if( (0,1,0)   != ?,if( #Macro(B_3_2) > #Macro(p_friction),#Macro(Q_3_2),0),0) +
			      if( (-1,0,0)  != ?,if( #Macro(B_3_4) > #Macro(p_friction),#Macro(Q_3_4),0),0) +
			      if( (-1,-1,0) != ?,if( #Macro(B_3_5) > #Macro(p_friction),#Macro(Q_3_5),0),0) +
			      if( (0,-1,0)  != ?,if( #Macro(B_3_6) > #Macro(p_friction),#Macro(Q_3_6),0),0) +
			      if( (1,-1,0)  != ?,if( #Macro(B_3_7) > #Macro(p_friction),#Macro(Q_3_7),0),0) +
			      if( (1,0,0)   != ?,if( #Macro(B_3_8) > #Macro(p_friction),#Macro(Q_3_8),0),0) ) /
			    ( 1 +
			      if( (1,1,0)   != ?,if( #Macro(B_3_1) > #Macro(p_friction),1,0),0) +
			      if( (0,1,0)   != ?,if( #Macro(B_3_2) > #Macro(p_friction),1,0),0) +
			      if( (-1,0,0)  != ?,if( #Macro(B_3_4) > #Macro(p_friction),1,0),0) +
			      if( (-1,-1,0) != ?,if( #Macro(B_3_5) > #Macro(p_friction),1,0),0) +
			      if( (0,-1,0)  != ?,if( #Macro(B_3_6) > #Macro(p_friction),1,0),0) +
			      if( (1,-1,0)  != ?,if( #Macro(B_3_7) > #Macro(p_friction),1,0),0) +
			      if( (1,0,0)   != ?,if( #Macro(B_3_8) > #Macro(p_friction),1,0),0) )) > #Macro(Q_3_3), ((#Macro(k)*(0,0,-4)/(0,0,-3)) - #Macro(p_adhesion)) +
				((#Macro(Q_3_3)   +
			      if( (1,1,0)   != ?,if( #Macro(B_3_1) > #Macro(p_friction),#Macro(Q_3_1),0),0) +
			      if( (0,1,0)   != ?,if( #Macro(B_3_2) > #Macro(p_friction),#Macro(Q_3_2),0),0) +
			      if( (-1,0,0)  != ?,if( #Macro(B_3_4) > #Macro(p_friction),#Macro(Q_3_4),0),0) +
			      if( (-1,-1,0) != ?,if( #Macro(B_3_5) > #Macro(p_friction),#Macro(Q_3_5),0),0) +
			      if( (0,-1,0)  != ?,if( #Macro(B_3_6) > #Macro(p_friction),#Macro(Q_3_6),0),0) +
			      if( (1,-1,0)  != ?,if( #Macro(B_3_7) > #Macro(p_friction),#Macro(Q_3_7),0),0) +
			      if( (1,0,0)   != ?,if( #Macro(B_3_8) > #Macro(p_friction),#Macro(Q_3_8),0),0) ) /
			    ( 1 +
			      if( (1,1,0)   != ?,if( #Macro(B_3_1) > #Macro(p_friction),1,0),0) +
			      if( (0,1,0)   != ?,if( #Macro(B_3_2) > #Macro(p_friction),1,0),0) +
			      if( (-1,0,0)  != ?,if( #Macro(B_3_4) > #Macro(p_friction),1,0),0) +
			      if( (-1,-1,0) != ?,if( #Macro(B_3_5) > #Macro(p_friction),1,0),0) +
			      if( (0,-1,0)  != ?,if( #Macro(B_3_6) > #Macro(p_friction),1,0),0) +
			      if( (1,-1,0)  != ?,if( #Macro(B_3_7) > #Macro(p_friction),1,0),0) +
			      if( (1,0,0)   != ?,if( #Macro(B_3_8) > #Macro(p_friction),1,0),0) )) - #Macro(Q_3_3),0),0) } #Macro(p_time) {(-1,1,0) != ? AND (0,0,-3) != 0}
rule : 0 #Macro(p_time) {t}

[debris_outflow_to_4]
rule :  { if( #Macro(B_4) > #Macro(p_friction),
			if( ((#Macro(k)*(0,0,-5)/(0,0,-4)) - #Macro(p_adhesion)) +
				((#Macro(Q_4_4) +
			      if( (1,1,0)   != ?,if( #Macro(B_4_1) > #Macro(p_friction),#Macro(Q_4_1),0),0) +
			      if( (0,1,0)   != ?,if( #Macro(B_4_2) > #Macro(p_friction),#Macro(Q_4_2),0),0) +
			      if( (-1,1,0)  != ?,if( #Macro(B_4_3) > #Macro(p_friction),#Macro(Q_4_3),0),0) +
			      if( (-1,-1,0) != ?,if( #Macro(B_4_5) > #Macro(p_friction),#Macro(Q_4_5),0),0) +
			      if( (0,-1,0)  != ?,if( #Macro(B_4_6) > #Macro(p_friction),#Macro(Q_4_6),0),0) +
			      if( (1,-1,0)  != ?,if( #Macro(B_4_7) > #Macro(p_friction),#Macro(Q_4_7),0),0) +
			      if( (1,0,0)   != ?,if( #Macro(B_4_8) > #Macro(p_friction),#Macro(Q_4_8),0),0) ) /
				( 1 +
			      if( (1,1,0)   != ?,if( #Macro(B_4_1) > #Macro(p_friction),1,0),0) +
			      if( (0,1,0)   != ?,if( #Macro(B_4_2) > #Macro(p_friction),1,0),0) +
			      if( (-1,1,0)  != ?,if( #Macro(B_4_3) > #Macro(p_friction),1,0),0) +
			      if( (-1,-1,0) != ?,if( #Macro(B_4_5) > #Macro(p_friction),1,0),0) +
			      if( (0,-1,0)  != ?,if( #Macro(B_4_6) > #Macro(p_friction),1,0),0) +
			      if( (1,-1,0)  != ?,if( #Macro(B_4_7) > #Macro(p_friction),1,0),0) +
			      if( (1,0,0)   != ?,if( #Macro(B_4_8) > #Macro(p_friction),1,0),0) )) > #Macro(Q_4_4), ((#Macro(k)*(0,0,-5)/(0,0,-4)) - #Macro(p_adhesion)) +
				((#Macro(Q_4_4) +
			      if( (1,1,0)   != ?,if( #Macro(B_4_1) > #Macro(p_friction),#Macro(Q_4_1),0),0) +
			      if( (0,1,0)   != ?,if( #Macro(B_4_2) > #Macro(p_friction),#Macro(Q_4_2),0),0) +
			      if( (-1,1,0)  != ?,if( #Macro(B_4_3) > #Macro(p_friction),#Macro(Q_4_3),0),0) +
			      if( (-1,-1,0) != ?,if( #Macro(B_4_5) > #Macro(p_friction),#Macro(Q_4_5),0),0) +
			      if( (0,-1,0)  != ?,if( #Macro(B_4_6) > #Macro(p_friction),#Macro(Q_4_6),0),0) +
			      if( (1,-1,0)  != ?,if( #Macro(B_4_7) > #Macro(p_friction),#Macro(Q_4_7),0),0) +
			      if( (1,0,0)   != ?,if( #Macro(B_4_8) > #Macro(p_friction),#Macro(Q_4_8),0),0) ) /
				( 1 +
			      if( (1,1,0)   != ?,if( #Macro(B_4_1) > #Macro(p_friction),1,0),0) +
			      if( (0,1,0)   != ?,if( #Macro(B_4_2) > #Macro(p_friction),1,0),0) +
			      if( (-1,1,0)  != ?,if( #Macro(B_4_3) > #Macro(p_friction),1,0),0) +
			      if( (-1,-1,0) != ?,if( #Macro(B_4_5) > #Macro(p_friction),1,0),0) +
			      if( (0,-1,0)  != ?,if( #Macro(B_4_6) > #Macro(p_friction),1,0),0) +
			      if( (1,-1,0)  != ?,if( #Macro(B_4_7) > #Macro(p_friction),1,0),0) +
			      if( (1,0,0)   != ?,if( #Macro(B_4_8) > #Macro(p_friction),1,0),0) )) - #Macro(Q_4_4),0),0) } #Macro(p_time) {(-1,0,0) != ? AND (0,0,-4) != 0}
rule : 0 #Macro(p_time) {t}

[debris_outflow_to_5]
rule :  { if( #Macro(B_5) > #Macro(p_friction),
			if( ((#Macro(k)*(0,0,-6)/(0,0,-5)) - #Macro(p_adhesion)) +
				((#Macro(Q_5_5) +
			      if( (1,1,0)   != ?,if( #Macro(B_5_1) > #Macro(p_friction),#Macro(Q_5_1),0),0) +
			      if( (0,1,0)   != ?,if( #Macro(B_5_2) > #Macro(p_friction),#Macro(Q_5_2),0),0) +
			      if( (-1,1,0)  != ?,if( #Macro(B_5_3) > #Macro(p_friction),#Macro(Q_5_3),0),0) +
			      if( (-1,0,0)  != ?,if( #Macro(B_5_4) > #Macro(p_friction),#Macro(Q_5_4),0),0) +
			      if( (0,-1,0)  != ?,if( #Macro(B_5_6) > #Macro(p_friction),#Macro(Q_5_6),0),0) +
			      if( (1,-1,0)  != ?,if( #Macro(B_5_7) > #Macro(p_friction),#Macro(Q_5_7),0),0) +
			      if( (1,0,0)   != ?,if( #Macro(B_5_8) > #Macro(p_friction),#Macro(Q_5_8),0),0) ) /
				( 1 +
			      if( (1,1,0)   != ?,if( #Macro(B_5_1) > #Macro(p_friction),1,0),0) +
			      if( (0,1,0)   != ?,if( #Macro(B_5_2) > #Macro(p_friction),1,0),0) +
			      if( (-1,1,0)  != ?,if( #Macro(B_5_3) > #Macro(p_friction),1,0),0) +
			      if( (-1,0,0)  != ?,if( #Macro(B_5_4) > #Macro(p_friction),1,0),0) +
			      if( (0,-1,0)  != ?,if( #Macro(B_5_6) > #Macro(p_friction),1,0),0) +
			      if( (1,-1,0)  != ?,if( #Macro(B_5_7) > #Macro(p_friction),1,0),0) +
			      if( (1,1,0)   != ?,if( #Macro(B_5_8) > #Macro(p_friction),1,0),0) )) > #Macro(Q_5_5), ((#Macro(k)*(0,0,-6)/(0,0,-5)) - #Macro(p_adhesion)) +
				((#Macro(Q_5_5) +
			      if( (1,1,0)   != ?,if( #Macro(B_5_1) > #Macro(p_friction),#Macro(Q_5_1),0),0) +
			      if( (0,1,0)   != ?,if( #Macro(B_5_2) > #Macro(p_friction),#Macro(Q_5_2),0),0) +
			      if( (-1,1,0)  != ?,if( #Macro(B_5_3) > #Macro(p_friction),#Macro(Q_5_3),0),0) +
			      if( (-1,0,0)  != ?,if( #Macro(B_5_4) > #Macro(p_friction),#Macro(Q_5_4),0),0) +
			      if( (0,-1,0)  != ?,if( #Macro(B_5_6) > #Macro(p_friction),#Macro(Q_5_6),0),0) +
			      if( (1,-1,0)  != ?,if( #Macro(B_5_7) > #Macro(p_friction),#Macro(Q_5_7),0),0) +
			      if( (1,0,0)   != ?,if( #Macro(B_5_8) > #Macro(p_friction),#Macro(Q_5_8),0),0) ) /
				( 1 +
			      if( (1,1,0)   != ?,if( #Macro(B_5_1) > #Macro(p_friction),1,0),0) +
			      if( (0,1,0)   != ?,if( #Macro(B_5_2) > #Macro(p_friction),1,0),0) +
			      if( (-1,1,0)  != ?,if( #Macro(B_5_3) > #Macro(p_friction),1,0),0) +
			      if( (-1,0,0)  != ?,if( #Macro(B_5_4) > #Macro(p_friction),1,0),0) +
			      if( (0,-1,0)  != ?,if( #Macro(B_5_6) > #Macro(p_friction),1,0),0) +
			      if( (1,-1,0)  != ?,if( #Macro(B_5_7) > #Macro(p_friction),1,0),0) +
			      if( (1,1,0)   != ?,if( #Macro(B_5_8) > #Macro(p_friction),1,0),0) )) - #Macro(Q_5_5),0),0) } #Macro(p_time) {(-1,-1,0) != ? AND (0,0,-5) != 0}
rule : 0 #Macro(p_time) {t}

[debris_outflow_to_6]
rule :  { if( #Macro(B_6) > #Macro(p_friction),
			if( ((#Macro(k)*(0,0,-7)/(0,0,-6)) - #Macro(p_adhesion)) +
				((#Macro(Q_6_6) +
			      if( (1,1,0)   != ?,if( #Macro(B_6_1) > #Macro(p_friction),#Macro(Q_6_1),0),0) +
			      if( (0,1,0)   != ?,if( #Macro(B_6_2) > #Macro(p_friction),#Macro(Q_6_2),0),0) +
			      if( (-1,1,0)  != ?,if( #Macro(B_6_3) > #Macro(p_friction),#Macro(Q_6_3),0),0) +
			      if( (-1,0,0)  != ?,if( #Macro(B_6_4) > #Macro(p_friction),#Macro(Q_6_4),0),0) +
			      if( (-1,-1,0) != ?,if( #Macro(B_6_5) > #Macro(p_friction),#Macro(Q_6_5),0),0) +
			      if( (1,-1,0)  != ?,if( #Macro(B_6_7) > #Macro(p_friction),#Macro(Q_6_7),0),0) +
			      if( (1,0,0)   != ?,if( #Macro(B_6_8) > #Macro(p_friction),#Macro(Q_6_8),0),0) ) /
			    ( 1 +
			      if( (1,1,0)   != ?,if( #Macro(B_6_1) > #Macro(p_friction),1,0),0) +
			      if( (0,1,0)   != ?,if( #Macro(B_6_2) > #Macro(p_friction),1,0),0) +
			      if( (-1,1,0)  != ?,if( #Macro(B_6_3) > #Macro(p_friction),1,0),0) +
			      if( (-1,0,0)  != ?,if( #Macro(B_6_4) > #Macro(p_friction),1,0),0) +
			      if( (-1,-1,0) != ?,if( #Macro(B_6_5) > #Macro(p_friction),1,0),0) +
			      if( (1,-1,0)  != ?,if( #Macro(B_6_7) > #Macro(p_friction),1,0),0) +
			      if( (1,0,0)   != ?,if( #Macro(B_6_8) > #Macro(p_friction),1,0),0) )) > #Macro(Q_6_6), ((#Macro(k)*(0,0,-7)/(0,0,-6)) - #Macro(p_adhesion)) +
				((#Macro(Q_6_6) +
			      if( (1,1,0)   != ?,if( #Macro(B_6_1) > #Macro(p_friction),#Macro(Q_6_1),0),0) +
			      if( (0,1,0)   != ?,if( #Macro(B_6_2) > #Macro(p_friction),#Macro(Q_6_2),0),0) +
			      if( (-1,1,0)  != ?,if( #Macro(B_6_3) > #Macro(p_friction),#Macro(Q_6_3),0),0) +
			      if( (-1,0,0)  != ?,if( #Macro(B_6_4) > #Macro(p_friction),#Macro(Q_6_4),0),0) +
			      if( (-1,-1,0) != ?,if( #Macro(B_6_5) > #Macro(p_friction),#Macro(Q_6_5),0),0) +
			      if( (1,-1,0)  != ?,if( #Macro(B_6_7) > #Macro(p_friction),#Macro(Q_6_7),0),0) +
			      if( (1,0,0)   != ?,if( #Macro(B_6_8) > #Macro(p_friction),#Macro(Q_6_8),0),0) ) /
			    ( 1 +
			      if( (1,1,0)   != ?,if( #Macro(B_6_1) > #Macro(p_friction),1,0),0) +
			      if( (0,1,0)   != ?,if( #Macro(B_6_2) > #Macro(p_friction),1,0),0) +
			      if( (-1,1,0)  != ?,if( #Macro(B_6_3) > #Macro(p_friction),1,0),0) +
			      if( (-1,0,0)  != ?,if( #Macro(B_6_4) > #Macro(p_friction),1,0),0) +
			      if( (-1,-1,0) != ?,if( #Macro(B_6_5) > #Macro(p_friction),1,0),0) +
			      if( (1,-1,0)  != ?,if( #Macro(B_6_7) > #Macro(p_friction),1,0),0) +
			      if( (1,0,0)   != ?,if( #Macro(B_6_8) > #Macro(p_friction),1,0),0) )) - #Macro(Q_6_6),0),0) } #Macro(p_time) {(0,-1,0) != ? AND (0,0,-6) != 0}
rule : 0 #Macro(p_time) {t}

[debris_outflow_to_7]
rule :  { if( #Macro(B_7) > #Macro(p_friction),
			if( ((#Macro(k)*(0,0,-8)/(0,0,-7)) - #Macro(p_adhesion)) +
				((#Macro(Q_7_7) +
			      if( (1,1,0)   != ?,if( #Macro(B_7_1) > #Macro(p_friction),#Macro(Q_7_1),0),0) +
			      if( (0,1,0)   != ?,if( #Macro(B_7_2) > #Macro(p_friction),#Macro(Q_7_2),0),0) +
				  if( (-1,1,0)  != ?,if( #Macro(B_7_3) > #Macro(p_friction),#Macro(Q_7_3),0),0) +
			      if( (-1,0,0)  != ?,if( #Macro(B_7_4) > #Macro(p_friction),#Macro(Q_7_4),0),0) +
			      if( (-1,-1,0) != ?,if( #Macro(B_7_5) > #Macro(p_friction),#Macro(Q_7_5),0),0) +
			      if( (0,-1,0)  != ?,if( #Macro(B_7_6) > #Macro(p_friction),#Macro(Q_7_6),0),0) +
			      if( (1,0,0)   != ?,if( #Macro(B_7_8) > #Macro(p_friction),#Macro(Q_7_8),0),0) ) /
			    ( 1 +
			      if( (1,1,0)   != ?,if( #Macro(B_7_1) > #Macro(p_friction),1,0),0) +
			      if( (0,1,0)   != ?,if( #Macro(B_7_2) > #Macro(p_friction),1,0),0) +
			      if( (-1,1,0)  != ?,if( #Macro(B_7_3) > #Macro(p_friction),1,0),0) +
			      if( (-1,0,0)  != ?,if( #Macro(B_7_4) > #Macro(p_friction),1,0),0) +
			      if( (-1,-1,0) != ?,if( #Macro(B_7_5) > #Macro(p_friction),1,0),0) +
			      if( (0,-1,0)  != ?,if( #Macro(B_7_6) > #Macro(p_friction),1,0),0) +
			      if( (1,0,0)   != ?,if( #Macro(B_7_8) > #Macro(p_friction),1,0),0) )) > #Macro(Q_7_7), ((#Macro(k)*(0,0,-8)/(0,0,-7)) - #Macro(p_adhesion)) +
				((#Macro(Q_7_7) +
			      if( (1,1,0)   != ?,if( #Macro(B_7_1) > #Macro(p_friction),#Macro(Q_7_1),0),0) +
			      if( (0,1,0)   != ?,if( #Macro(B_7_2) > #Macro(p_friction),#Macro(Q_7_2),0),0) +
				  if( (-1,1,0)  != ?,if( #Macro(B_7_3) > #Macro(p_friction),#Macro(Q_7_3),0),0) +
			      if( (-1,0,0)  != ?,if( #Macro(B_7_4) > #Macro(p_friction),#Macro(Q_7_4),0),0) +
			      if( (-1,-1,0) != ?,if( #Macro(B_7_5) > #Macro(p_friction),#Macro(Q_7_5),0),0) +
			      if( (0,-1,0)  != ?,if( #Macro(B_7_6) > #Macro(p_friction),#Macro(Q_7_6),0),0) +
			      if( (1,0,0)   != ?,if( #Macro(B_7_8) > #Macro(p_friction),#Macro(Q_7_8),0),0) ) /
			    ( 1 +
			      if( (1,1,0)   != ?,if( #Macro(B_7_1) > #Macro(p_friction),1,0),0) +
			      if( (0,1,0)   != ?,if( #Macro(B_7_2) > #Macro(p_friction),1,0),0) +
			      if( (-1,1,0)  != ?,if( #Macro(B_7_3) > #Macro(p_friction),1,0),0) +
			      if( (-1,0,0)  != ?,if( #Macro(B_7_4) > #Macro(p_friction),1,0),0) +
			      if( (-1,-1,0) != ?,if( #Macro(B_7_5) > #Macro(p_friction),1,0),0) +
			      if( (0,-1,0)  != ?,if( #Macro(B_7_6) > #Macro(p_friction),1,0),0) +
			      if( (1,0,0)   != ?,if( #Macro(B_7_8) > #Macro(p_friction),1,0),0) )) - #Macro(Q_7_7),0),0) } #Macro(p_time) {(1,-1,0) != ? AND (0,0,-7) != 0}
rule : 0 #Macro(p_time) {t}

[debris_outflow_to_8]
rule :  { if( #Macro(B_8) > #Macro(p_friction),
			if( ((#Macro(k)*(0,0,-9)/(0,0,-8)) - #Macro(p_adhesion)) +
				((#Macro(Q_8_8) +
			        if( (1,1,0)   != ?,if( #Macro(B_8_1) > #Macro(p_friction),#Macro(Q_8_1),0),0) +
			        if( (0,1,0)   != ?,if( #Macro(B_8_2) > #Macro(p_friction),#Macro(Q_8_2),0),0) +
		            if( (-1,1,0)  != ?,if( #Macro(B_8_3) > #Macro(p_friction),#Macro(Q_8_3),0),0) +
			        if( (-1,0,0)  != ?,if( #Macro(B_8_4) > #Macro(p_friction),#Macro(Q_8_4),0),0) +
			        if( (-1,-1,0) != ?,if( #Macro(B_8_5) > #Macro(p_friction),#Macro(Q_8_5),0),0) +
			        if( (0,-1,0)  != ?,if( #Macro(B_8_6) > #Macro(p_friction),#Macro(Q_8_6),0),0) +
			        if( (1,-1,0)  != ?,if( #Macro(B_8_7) > #Macro(p_friction),#Macro(Q_8_7),0),0) ) /
			    ( 1 +
			      if( (1,1,0)   != ?,if( #Macro(B_8_1) > #Macro(p_friction),1,0),0) +
			      if( (0,1,0)   != ?,if( #Macro(B_8_2) > #Macro(p_friction),1,0),0) +
			      if( (-1,1,0)  != ?,if( #Macro(B_8_3) > #Macro(p_friction),1,0),0) +
			      if( (-1,0,0)  != ?,if( #Macro(B_8_4) > #Macro(p_friction),1,0),0) +
			      if( (-1,-1,0) != ?,if( #Macro(B_8_5) > #Macro(p_friction),1,0),0) +
			      if( (0,-1,0)  != ?,if( #Macro(B_8_6) > #Macro(p_friction),1,0),0) +
			      if( (1,-1,0)  != ?,if( #Macro(B_8_7) > #Macro(p_friction),1,0),0) )) > #Macro(Q_8_8), ((#Macro(k)*(0,0,-9)/(0,0,-8)) - #Macro(p_adhesion)) +
				((#Macro(Q_8_8) +
			        if( (1,1,0)   != ?,if( #Macro(B_8_1) > #Macro(p_friction),#Macro(Q_8_1),0),0) +
			        if( (0,1,0)   != ?,if( #Macro(B_8_2) > #Macro(p_friction),#Macro(Q_8_2),0),0) +
		            if( (-1,1,0)  != ?,if( #Macro(B_8_3) > #Macro(p_friction),#Macro(Q_8_3),0),0) +
			        if( (-1,0,0)  != ?,if( #Macro(B_8_4) > #Macro(p_friction),#Macro(Q_8_4),0),0) +
			        if( (-1,-1,0) != ?,if( #Macro(B_8_5) > #Macro(p_friction),#Macro(Q_8_5),0),0) +
			        if( (0,-1,0)  != ?,if( #Macro(B_8_6) > #Macro(p_friction),#Macro(Q_8_6),0),0) +
			        if( (1,-1,0)  != ?,if( #Macro(B_8_7) > #Macro(p_friction),#Macro(Q_8_7),0),0) ) /
			    ( 1 +
			      if( (1,1,0)   != ?,if( #Macro(B_8_1) > #Macro(p_friction),1,0),0) +
			      if( (0,1,0)   != ?,if( #Macro(B_8_2) > #Macro(p_friction),1,0),0) +
			      if( (-1,1,0)  != ?,if( #Macro(B_8_3) > #Macro(p_friction),1,0),0) +
			      if( (-1,0,0)  != ?,if( #Macro(B_8_4) > #Macro(p_friction),1,0),0) +
			      if( (-1,-1,0) != ?,if( #Macro(B_8_5) > #Macro(p_friction),1,0),0) +
			      if( (0,-1,0)  != ?,if( #Macro(B_8_6) > #Macro(p_friction),1,0),0) +
			      if( (1,-1,0)  != ?,if( #Macro(B_8_7) > #Macro(p_friction),1,0),0) )) - #Macro(Q_8_8),0),0) } #Macro(p_time) {(1,0,0) != ? AND (0,0,-8) != 0}
rule : 0 #Macro(p_time) {t}

[runup]
rule : { (0,0,0) +
       if( ((0,0,-10) - #Macro(p_mt)) * #Macro(p_erosion) > 0, if( ((0,0,-10) - #Macro(p_mt)) * #Macro(p_erosion) < (0,0,-11) ,((0,0,-10) - #Macro(p_mt)) * #Macro(p_erosion),(0,0,-11)),0) }
       #Macro(p_time) {t}

[DefaultTransition]
rule : { (0,0,0) } #Macro(p_time) { t }