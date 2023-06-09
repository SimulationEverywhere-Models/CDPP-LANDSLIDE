%
%  Right now paramter values, and k, are entirely arbitrary.
%  For real results, change them (see supporting papers)
%
%
%  It doesn't matter what units you use, as long as you are consistent.
%
% ------ SCIDDICA parameters ------
%
% soil adhesion
%
#BeginMacro(p_adhesion)
2
#EndMacro
%
% CA step time
%
#BeginMacro(p_time)
1000
#EndMacro
%
% momentum transfer (how much momentum does the slide need to erode the soil)
%
#BeginMacro(p_mt)
0.3
#EndMacro
%
% erodability of the soil
%
#BeginMacro(p_erosion)
0.6
#EndMacro
%
% runup loss:  the loss of energy due to friction
%
#BeginMacro(p_runup_loss)
0.7
#EndMacro
%
% p_friction
%
#BeginMacro(p_friction)
5
#EndMacro
%
% k = 2/(rho*g*A)
%  Where g is gravitational acceleration
%        A is the area of the cell
%        rho is the density of the material in the column and can be considered a constant
%			for the purposes of this simulation
% k can be a real number or a mathematical expresion
#BeginMacro(k)
1
#EndMacro
%
%  Outflow calculation Macros
%-------------------------------------------------
%
% B[i] = (Qa + R) - (Qa[i]+Qth[i])
%--------------------
% B_1
#BeginMacro(B_1)
(((0,0,-4)+(0,0,8)) - ((1,1,-4)+(1,1,-1)))
#EndMacro
%B_2
#BeginMacro(B_2)
(((0,0,-5) + (0,0,7)) - ((0,1,-5) + (0,1,-2)))
#EndMacro
%B_3
#BeginMacro(B_3)
(((0,0,-6)+(0,0,6)) - ((-1,1,-6)+(-1,1,-3)))
#EndMacro
%B_4
#BeginMacro(B_4)
(((0,0,-7)+(0,0,5)) - ((-1,0,-7)+(-1,0,-4)))
#EndMacro
%B_5
#BeginMacro(B_5)
(((0,0,-8)+(0,0,4)) - ((-1,-1,-8)+(-1,-1,-5)))
#EndMacro
%B_6
#BeginMacro(B_6)
(((0,0,-9)+(0,0,3)) - ((0,-1,-9)+(0,-1,-6)))
#EndMacro
%B_7
#BeginMacro(B_7)
(((0,0,-10)+(0,0,2)) - ((1,-1,-10)+(1,-1,-7)))
#EndMacro
%B_8
#BeginMacro(B_8)
(((0,0,-11)+(0,0,1)) - ((1,0,-11)+(1,0,-8)))
#EndMacro
%
% Relative B values  (relative to cell i's position)
%  Relative to B[1]
%
#BeginMacro(B_1_2)
(((0,0,-4) + (0,0,8)) - ((0,1,-4)+(0,1,-1)))
#EndMacro
#BeginMacro(B_1_3)
(((0,0,-4) + (0,0,8)) - ((-1,1,-4)+(-1,1,-1)))
#EndMacro
#BeginMacro(B_1_4)
(((0,0,-4) + (0,0,8)) - ((-1,0,-4)+(-1,0,-1)))
#EndMacro
#BeginMacro(B_1_5)
(((0,0,-4) + (0,0,8)) - ((-1,-1,-4)+(-1,-1,-1)))
#EndMacro
#BeginMacro(B_1_6)
(((0,0,-4) + (0,0,8)) - ((0,-1,-4)+(0,-1,-1)))
#EndMacro
#BeginMacro(B_1_7)
(((0,0,-4) + (0,0,8)) - ((1,-1,-4)+(1,-1,-1)))
#EndMacro
#BeginMacro(B_1_8)
(((0,0,-4) + (0,0,8)) - ((1,0,-4)+(1,0,-1)))
#EndMacro
%  Relative to B[2]
#BeginMacro(B_2_1)
( ( (0,0,-5) + (0,0,7) ) - ( (1,1,-5) + (1,1,-2) ) )
#EndMacro
#BeginMacro(B_2_3)
(((0,0,-5)+(0,0,7)) - ((-1,1,-5)+(-1,1,-2)))
#EndMacro
#BeginMacro(B_2_4)
(((0,0,-5)+(0,0,7)) - ((-1,0,-5)+(-1,0,-2)))
#EndMacro
#BeginMacro(B_2_5)
(((0,0,-5)+(0,0,7)) - ((-1,-1,-5)+(-1,-1,-2)))
#EndMacro
#BeginMacro(B_2_6)
(((0,0,-5)+(0,0,7)) - ((0,-1,-5)+(0,-1,-2)))
#EndMacro
#BeginMacro(B_2_7)
(((0,0,-5)+(0,0,7)) - ((1,-1,-5)+(1,-1,-2)))
#EndMacro
#BeginMacro(B_2_8)
(((0,0,-5)+(0,0,7)) - ((1,0,-5)+(1,0,-2)))
#EndMacro
%  Relative to B[3]
#BeginMacro(B_3_1)
(((0,0,-6)+(0,0,6)) - ((1,1,-6) + (1,1,-3)))
#EndMacro
#BeginMacro(B_3_2)
(((0,0,-6)+(0,0,6)) - ((0,1,-6)+(0,1,-3)))
#EndMacro
#BeginMacro(B_3_4)
(((0,0,-6)+(0,0,6)) - ((-1,0,-6)+(-1,0,-3)))
#EndMacro
#BeginMacro(B_3_5)
(((0,0,-6)+(0,0,6)) - ((-1,-1,-6)+(-1,-1,-3)))
#EndMacro
#BeginMacro(B_3_6)
(((0,0,-6)+(0,0,6)) - ((0,-1,-6)+(0,-1,-3)))
#EndMacro
#BeginMacro(B_3_7)
(((0,0,-6)+(0,0,6)) - ((1,-1,-6)+(1,-1,-3)))
#EndMacro
#BeginMacro(B_3_8)
(((0,0,-6)+(0,0,6)) - ((1,0,-6)+(1,0,-3)))
#EndMacro
%  Relative to B[4]
#BeginMacro(B_4_1)
(((0,0,-7) + (0,0,5)) - ((1,1,-7) + (1,1,-4)))
#EndMacro
#BeginMacro(B_4_2)
(((0,0,-7)+(0,0,5)) - ((0,1,-7)+(0,1,-4)))
#EndMacro
#BeginMacro(B_4_3)
(((0,0,-7)+(0,0,5)) - ((-1,1,-7)+(-1,1,-4)))
#EndMacro
#BeginMacro(B_4_5)
(((0,0,-7)+(0,0,5)) - ((-1,-1,-7)+(-1,-1,-4)))
#EndMacro
#BeginMacro(B_4_6)
(((0,0,-7)+(0,0,5)) - ((0,-1,-7)+(0,-1,-4)))
#EndMacro
#BeginMacro(B_4_7)
(((0,0,-7)+(0,0,5)) - ((1,-1,-7)+(1,-1,-4)))
#EndMacro
#BeginMacro(B_4_8)
(((0,0,-7)+(0,0,5)) - ((1,0,-7)+(1,0,-4)))
#EndMacro
%  Relative to B[5]
#BeginMacro(B_5_1)
(((0,0,-8)+(0,0,4)) - ((1,1,-8)+(1,1,-5)))
#EndMacro
#BeginMacro(B_5_2)
(((0,0,-8)+(0,0,4)) - ((0,1,-8)+(0,1,-5)))
#EndMacro
#BeginMacro(B_5_3)
(((0,0,-8)+(0,0,4)) - ((-1,1,-8)+(-1,1,-5)))
#EndMacro
#BeginMacro(B_5_4)
(((0,0,-8)+(0,0,4)) - ((-1,0,-8)+(-1,0,-5)))
#EndMacro
#BeginMacro(B_5_6)
(((0,0,-8)+(0,0,4)) - ((0,-1,-8)+(0,-1,-5)))
#EndMacro
#BeginMacro(B_5_7)
(((0,0,-8)+(0,0,4)) - ((1,-1,-8)+(1,-1,-5)))
#EndMacro
#BeginMacro(B_5_8)
(((0,0,-8)+(0,0,4)) - ((1,0,-8)+(1,0,-5)))
#EndMacro
%  Relative to B[6]
#BeginMacro(B_6_1)
(((0,0,-9)+(0,0,3)) - ((1,1,-9)+(1,1,-6)))
#EndMacro
#BeginMacro(B_6_2))
(((0,0,-9)+(0,0,3)) - ((0,1,-9)+(0,1,-6)))
#EndMacro
#BeginMacro(B_6_3)
(((0,0,-9)+(0,0,3)) - ((-1,1,-9)+(-1,1,-6)))
#EndMacro
#BeginMacro(B_6_4)
(((0,0,-9)+(0,0,3)) - ((-1,0,-9)+(-1,0,-6)))
#EndMacro
#BeginMacro(B_6_5)
(((0,0,-9)+(0,0,3)) - ((-1,-1,-9)+(-1,-1,-6)))
#EndMacro
#BeginMacro(B_6_7)
(((0,0,-9)+(0,0,3)) - ((1,-1,-9)+(1,-1,-6)))
#EndMacro
#BeginMacro(B_6_8)
(((0,0,-9)+(0,0,3)) - ((1,0,-9)+(1,0,-6)))
#EndMacro
%  Relative to B[7]
#BeginMacro(B_7_1)
(((0,0,-10)+(0,0,2)) - ((1,1,-10)+(1,1,-7)))
#EndMacro
#BeginMacro(B_7_2)
(((0,0,-10)+(0,0,2)) - ((0,1,-10)+(0,1,-7)))
#EndMacro
#BeginMacro(B_7_3)
(((0,0,-10)+(0,0,2)) - ((-1,1,-10)+(-1,1,-7)))
#EndMacro
#BeginMacro(B_7_4)
(((0,0,-10)+(0,0,2)) - ((-1,0,-10)+(-1,0,-7)))
#EndMacro
#BeginMacro(B_7_5)
(((0,0,-10)+(0,0,2)) - ((-1,-1,-10)+(-1,-1,-7)))
#EndMacro
#BeginMacro(B_7_6)
(((0,0,-10)+(0,0,2)) - ((0,-1,-10)+(0,-1,-7)))
#EndMacro
#BeginMacro(B_7_8)
(((0,0,-10)+(0,0,2)) - ((1,0,-10)+(1,0,-7)))
#EndMacro
%  Relative to B[8]
#BeginMacro(B_8_1)
(((0,0,-11)+(0,0,1)) - ((1,1,-11)+(1,1,-8)))
#EndMacro
#BeginMacro(B_8_2)
(((0,0,-11)+(0,0,1)) - ((0,1,-11)+(0,1,-8)))
#EndMacro
#BeginMacro(B_8_3)
(((0,0,-11)+(0,0,1)) - ((-1,1,-11)+(-1,1,-8)))
#EndMacro
#BeginMacro(B_8_4)
(((0,0,-11)+(0,0,1)) - ((-1,0,-11)+(-1,0,-8)))
#EndMacro
#BeginMacro(B_8_5)
(((0,0,-11)+(0,0,1)) - ((-1,-1,-11)+(-1,-1,-8)))
#EndMacro
#BeginMacro(B_8_6)
(((0,0,-11)+(0,0,1)) - ((0,-1,-11)+(0,-1,-8)))
#EndMacro
#BeginMacro(B_8_7)
(((0,0,-11)+(0,0,1)) - ((1,-1,-11)+(1,-1,-8)))
#EndMacro

%Relative Qs (Qaltitude + Qthickness)
%
%  Relative to Cell 1
#BeginMacro(Q_1_1)
((1,1,-4)+(1,1,-1))
#EndMacro
#BeginMacro(Q_1_2)
((0,1,-4)+(0,1,-1))
#EndMacro
#BeginMacro(Q_1_3)
((-1,1,-4)+(-1,1,-1))
#EndMacro
#BeginMacro(Q_1_4)
((-1,0,-4)+(-1,0,-1))
#EndMacro
#BeginMacro(Q_1_5)
((-1,-1,-4)+(-1,-1,-1))
#EndMacro
#BeginMacro(Q_1_6)
((0,-1,-4)+(0,-1,-1))
#EndMacro
#BeginMacro(Q_1_7)
((1,-1,-4)+(1,-1,-1))
#EndMacro
#BeginMacro(Q_1_8)
((1,0,-4)+(1,0,-1))
#EndMacro
%
%  Relative to Cell 2
%
#BeginMacro(Q_2_1)
((1,1,-5) + (1,1,-2))
#EndMacro
#BeginMacro(Q_2_2)
((0,1,-5) + (0,1,-2))
#EndMacro
#BeginMacro(Q_2_3)
((-1,1,-5) + (-1,1,-2))
#EndMacro
#BeginMacro(Q_2_4)
((-1,0,-5) + (-1,0,-2))
#EndMacro
#BeginMacro(Q_2_5)
((-1,-1,-5) + (-1,-1,-2))
#EndMacro
#BeginMacro(Q_2_6)
((0,-1,-5) + (0,-1,-2))
#EndMacro
#BeginMacro(Q_2_7)
((1,-1,-5) + (1,-1,-2))
#EndMacro
#BeginMacro(Q_2_8)
((1,0,-5) + (1,0,-2))
#EndMacro
%
%  Relative to Cell 3
%
#BeginMacro(Q_3_1)
((1,1,-6) + (1,1,-3))
#EndMacro
#BeginMacro(Q_3_2)
((0,1,-6) + (0,1,-3))
#EndMacro
#BeginMacro(Q_3_3)
((-1,1,-6) + (-1,1,-3))
#EndMacro
#BeginMacro(Q_3_4)
((-1,0,-6) + (-1,0,-3))
#EndMacro
#BeginMacro(Q_3_5)
((-1,-1,-6) + (-1,-1,-3))
#EndMacro
#BeginMacro(Q_3_6)
((0,-1,-6) + (0,-1,-3))
#EndMacro
#BeginMacro(Q_3_7)
((1,-1,-6) + (1,-1,-3))
#EndMacro
#BeginMacro(Q_3_8)
((1,0,-6) + (1,0,-3))
#EndMacro
%
%  Relative to Cell 4
%
#BeginMacro(Q_4_1)
((1,1,-7) + (1,1,-4))
#EndMacro
#BeginMacro(Q_4_2)
((0,1,-7) + (0,1,-4))
#EndMacro
#BeginMacro(Q_4_3)
((-1,1,-7) + (-1,1,-4))
#EndMacro
#BeginMacro(Q_4_4)
((-1,0,-7) + (-1,0,-4))
#EndMacro
#BeginMacro(Q_4_5)
((-1,-1,-7) + (-1,-1,-4))
#EndMacro
#BeginMacro(Q_4_6)
((0,-1,-7) + (0,-1,-4))
#EndMacro
#BeginMacro(Q_4_7)
((1,-1,-7) + (1,-1,-4))
#EndMacro
#BeginMacro(Q_4_8)
((1,0,-7) + (1,0,-4))
#EndMacro
%
%  Relative to Cell 5
%
#BeginMacro(Q_5_1)
((1,1,-8) + (1,1,-5))
#EndMacro
#BeginMacro(Q_5_2)
((0,1,-8) + (0,1,-5))
#EndMacro
#BeginMacro(Q_5_3)
((-1,1,-8) + (-1,1,-5))
#EndMacro
#BeginMacro(Q_5_4)
((-1,0,-8) + (-1,0,-5))
#EndMacro
#BeginMacro(Q_5_5)
((-1,-1,-8) + (-1,-1,-5))
#EndMacro
#BeginMacro(Q_5_6)
((0,-1,-8) + (0,-1,-5))
#EndMacro
#BeginMacro(Q_5_7)
((1,-1,-8) + (1,-1,-5))
#EndMacro
#BeginMacro(Q_5_8)
((1,0,-8) + (1,0,-5))
#EndMacro
%
%  Relative to Cell 6
%
#BeginMacro(Q_6_1)
((1,1,-9)+(1,1,-6))
#EndMacro
#BeginMacro(Q_6_2)
((0,1,-9)+(0,1,-6))
#EndMacro
#BeginMacro(Q_6_3)
((-1,1,-9)+(-1,1,-6))
#EndMacro
#BeginMacro(Q_6_4)
((-1,0,-9)+(-1,0,-6))
#EndMacro
#BeginMacro(Q_6_5)
((-1,-1,-9)+(-1,-1,-6))
#EndMacro
#BeginMacro(Q_6_6)
((0,-1,-9)+(0,-1,-6))
#EndMacro
#BeginMacro(Q_6_7)
((1,-1,-9)+(1,-1,-6))
#EndMacro
#BeginMacro(Q_6_8)
((1,0,-9)+(1,0,-6))
#EndMacro
%
%  Relative to Cell 7
%
#BeginMacro(Q_7_1)
((1,1,-10)+(1,1,-7))
#EndMacro
#BeginMacro(Q_7_2)
((0,1,-10)+(0,1,-7))
#EndMacro
#BeginMacro(Q_7_3)
((-1,1,-10)+(-1,1,-7))
#EndMacro
#BeginMacro(Q_7_4)
((-1,0,-10)+(-1,0,-7))
#EndMacro
#BeginMacro(Q_7_5)
((-1,-1,-10)+(-1,-1,-7))
#EndMacro
#BeginMacro(Q_7_6)
((0,-1,-10)+(0,-1,-7))
#EndMacro
#BeginMacro(Q_7_7)
((1,-1,-10)+(1,-1,-7))
#EndMacro
#BeginMacro(Q_7_8)
((1,0,-10)+(1,0,-7))
#EndMacro
%
%  Relative to Cell 8
%
#BeginMacro(Q_8_1)
((1,1,-11)+(1,1,-8))
#EndMacro
#BeginMacro(Q_8_2)
((0,1,-11)+(0,1,-8))
#EndMacro
#BeginMacro(Q_8_3)
((-1,1,-11)+(-1,1,-8))
#EndMacro
#BeginMacro(Q_8_4)
((-1,0,-11)+(-1,0,-8))
#EndMacro
#BeginMacro(Q_8_5)
((-1,-1,-11)+(-1,-1,-8))
#EndMacro
#BeginMacro(Q_8_6)
((0,-1,-11)+(0,-1,-8))
#EndMacro
#BeginMacro(Q_8_7)
((1,-1,-11)+(1,-1,-8))
#EndMacro
#BeginMacro(Q_8_8)
((1,0,-11)+(1,0,-8))
#EndMacro