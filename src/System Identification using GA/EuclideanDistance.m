function F = EuclideanDistance(x)
% EuclideanDistance computes the residual vector for GA optimization
%
% Input:
%   x - vector of parameters [a11, a12, a13, a31, a33, ain]
%
% Output:
%   F - 11x1 vector of normalized residuals
%
% Description:
%   Each element of F corresponds to the residual between a symbolic 
%   equation derived from the transfer functions of the system and its target value, obtained from System Identification. 
%   Denominators correspond to system characteristic equations; 
%   numerators correspond to transfer function coefficients (s^0, s^1, s^2, ...).

%% -------------------- Initialize Residual Vector --------------------
F = zeros(11, 1);

%% -------------------- Denominator Symbolic Equations --------------------
F(1) = ((-2*x(1)^3 + 2*x(1)^2*x(5)) / x(1)^2 - 3002) / 1e3;
F(2) = ((x(1)^4 - 4*x(1)^3*x(5) - x(1)^2*x(2)^2 + 2*x(1)^2*x(3)*x(4) + x(1)^2*x(5)^2) ...
        / x(1)^2 - 2.298e06) / 1e6;
F(3) = ((2*x(1)^4*x(5) - 2*x(1)^3*x(3)*x(4) - 2*x(1)^3*x(5) ...
        - 2*x(1)^2*x(2)^2*x(5) + 2*x(1)^2*x(3)*x(4)*x(5) ...
        + 2*x(1)*x(2)^2*x(3)*x(4)) / x(1)^2 - 6.745e07) / 1e7;
F(4) = ((x(1)^4 * x(5)^2 - 2*x(1)^3*x(3)*x(4)*x(5) ...
        - x(1)^2*x(2)^2*x(5)^2 + x(1)^2*x(3)^2*x(4)^2 ...
        + 2*x(1)*x(2)^2*x(3)*x(4)*x(5) - x(2)^4*x(3)^2*x(4)^2) ...
        / x(1)^2 - 4.804e08) / 1e8;
%% -------------------- Numerator Symbolic Equations --------------------
% F(5): Coefficient of s^1 in transfer function (wr - vr)
F(5)  = ((x(6)*x(3)*(-x(1)^3 + x(5)*x(1)^2 + x(1)*x(2)^2)) / x(1)^2 - 1.052e08) / 1e8;

% F(6): Coefficient of s^2 in transfer function (wr - vr)
F(6)  = ((x(6)*x(1)^2*x(3)) / x(1)^2 - 7.008e04) / 1e4;

% F(7): Coefficient of s^0 in transfer function (ir - Vr)
F(7)  = ((x(6)*(x(1)^2 - x(2)^2)*(x(5)*x(1)^2 - x(3)*x(4)*x(1))) / x(1)^2 - 6.468e06) / 1e6;

% F(8): Coefficient of s^0 in transfer function (wr - vr)
F(8)  = ((x(6)*(x(1)^2 - x(2)^2)*(x(4)*x(3)^2 - x(5)*x(1)*x(3))) / x(1)^2 - 1.498e09) / 1e9;

% F(9): Coefficient of s^3 in transfer function (ir - Vr)
F(9)  = ((x(6)*x(1)^2) / x(1)^2 - 333.3) / 1e2;

% F(10): Coefficient of s^2 in transfer function (ir - Vr)
F(10) = ((x(6)*(-2*x(1)^3 + x(5)*x(1)^2)) / x(1)^2 - 5.006e05) / 1e5;

% F(11): Coefficient of s^1 in transfer function (ir - Vr)
F(11) = ((x(6)*(x(1)^4 - 2*x(5)*x(1)^3 - x(1)^2*x(2)^2 + x(3)*x(4)*x(1)^2)) ...
         / x(1)^2 - 7.944e06) / 1e6;
end
