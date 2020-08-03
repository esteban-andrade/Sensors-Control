% Intrinsic and Extrinsic Camera Parameters
%
% This script file can be directly executed under Matlab to recover the camera intrinsic and extrinsic parameters.
% IMPORTANT: This file contains neither the structure of the calibration objects nor the image coordinates of the calibration points.
%            All those complementary variables are saved in the complete matlab data file Calib_Results.mat.
% For more information regarding the calibration model visit http://www.vision.caltech.edu/bouguetj/calib_doc/


%-- Focal length:
fc = [ 693.151252224649511 ; 690.663052392357599 ];

%-- Principal point:
cc = [ 285.679478319655459 ; 244.429546628506500 ];

%-- Skew coefficient:
alpha_c = 0.000000000000000;

%-- Distortion coefficients:
kc = [ 0.104657646817321 ; -0.244826421981936 ; -0.000021616388412 ; 0.000417196372909 ; 0.000000000000000 ];

%-- Focal length uncertainty:
fc_error = [ 1.958256788611695 ; 1.928489384525119 ];

%-- Principal point uncertainty:
cc_error = [ 3.383242755863356 ; 2.551856156316180 ];

%-- Skew coefficient uncertainty:
alpha_c_error = 0.000000000000000;

%-- Distortion coefficients uncertainty:
kc_error = [ 0.014330619096848 ; 0.075528861213975 ; 0.001534070885358 ; 0.002152715736215 ; 0.000000000000000 ];

%-- Image size:
nx = 640;
ny = 480;


%-- Various other variables (may be ignored if you do not use the Matlab Calibration Toolbox):
%-- Those variables are used to control which intrinsic parameters should be optimized

n_ima = 10;						% Number of calibration images
est_fc = [ 1 ; 1 ];					% Estimation indicator of the two focal variables
est_aspect_ratio = 1;				% Estimation indicator of the aspect ratio fc(2)/fc(1)
center_optim = 1;					% Estimation indicator of the principal point
est_alpha = 0;						% Estimation indicator of the skew coefficient
est_dist = [ 1 ; 1 ; 1 ; 1 ; 0 ];	% Estimation indicator of the distortion coefficients


%-- Extrinsic parameters:
%-- The rotation (omc_kk) and the translation (Tc_kk) vectors for every calibration image and their uncertainties

%-- Image #1:
omc_1 = [ 2.077094e+00 ; 2.167435e+00 ; -1.528617e-01 ];
Tc_1  = [ -7.152862e+01 ; -8.810671e+01 ; 3.905727e+02 ];
omc_error_1 = [ 3.125452e-03 ; 3.597921e-03 ; 7.162497e-03 ];
Tc_error_1  = [ 1.923206e+00 ; 1.439292e+00 ; 1.248085e+00 ];

%-- Image #2:
omc_2 = [ 2.175363e+00 ; 2.247392e+00 ; 1.755186e-01 ];
Tc_2  = [ -8.893183e+01 ; -5.594775e+01 ; 4.373708e+02 ];
omc_error_2 = [ 4.082990e-03 ; 3.565018e-03 ; 8.451928e-03 ];
Tc_error_2  = [ 2.150147e+00 ; 1.632746e+00 ; 1.474404e+00 ];

%-- Image #3:
omc_3 = [ -1.954831e+00 ; -2.134564e+00 ; 4.085141e-01 ];
Tc_3  = [ -6.403007e+01 ; -8.809572e+01 ; 4.338483e+02 ];
omc_error_3 = [ 3.561307e-03 ; 3.396254e-03 ; 6.570279e-03 ];
Tc_error_3  = [ 2.125677e+00 ; 1.593910e+00 ; 1.283674e+00 ];

%-- Image #4:
omc_4 = [ 1.854754e+00 ; 1.801714e+00 ; -6.182607e-01 ];
Tc_4  = [ -9.280862e+01 ; -4.413277e+01 ; 4.758655e+02 ];
omc_error_4 = [ 2.661663e-03 ; 3.853666e-03 ; 5.986793e-03 ];
Tc_error_4  = [ 2.321106e+00 ; 1.756974e+00 ; 1.371333e+00 ];

%-- Image #5:
omc_5 = [ 1.981013e+00 ; 1.701463e+00 ; 2.168164e-01 ];
Tc_5  = [ -5.528695e+01 ; -8.101050e+01 ; 4.261026e+02 ];
omc_error_5 = [ 3.669863e-03 ; 3.385771e-03 ; 6.082682e-03 ];
Tc_error_5  = [ 2.097885e+00 ; 1.566738e+00 ; 1.402496e+00 ];

%-- Image #6:
omc_6 = [ -1.842139e+00 ; -1.905756e+00 ; -4.672343e-01 ];
Tc_6  = [ -7.019877e+01 ; -8.572475e+01 ; 3.660958e+02 ];
omc_error_6 = [ 2.422457e-03 ; 3.898368e-03 ; 6.164274e-03 ];
Tc_error_6  = [ 1.814036e+00 ; 1.360607e+00 ; 1.275512e+00 ];

%-- Image #7:
omc_7 = [ 1.630982e+00 ; 1.511886e+00 ; -1.308481e-02 ];
Tc_7  = [ -1.077304e+02 ; -6.642747e+01 ; 4.691644e+02 ];
omc_error_7 = [ 3.165963e-03 ; 3.899306e-03 ; 5.010949e-03 ];
Tc_error_7  = [ 2.304282e+00 ; 1.742653e+00 ; 1.562949e+00 ];

%-- Image #8:
omc_8 = [ 1.778470e+00 ; 2.188539e+00 ; -1.194734e+00 ];
Tc_8  = [ -7.412426e+01 ; -8.995266e+01 ; 5.188070e+02 ];
omc_error_8 = [ 2.153815e-03 ; 4.613495e-03 ; 6.829145e-03 ];
Tc_error_8  = [ 2.554603e+00 ; 1.927444e+00 ; 1.354045e+00 ];

%-- Image #9:
omc_9 = [ -1.338243e+00 ; -1.817652e+00 ; 6.342848e-01 ];
Tc_9  = [ 1.171078e+01 ; -1.299010e+02 ; 4.972677e+02 ];
omc_error_9 = [ 3.480943e-03 ; 3.807479e-03 ; 4.852146e-03 ];
Tc_error_9  = [ 2.456786e+00 ; 1.832973e+00 ; 1.356305e+00 ];

%-- Image #10:
omc_10 = [ 1.849304e+00 ; 1.368420e+00 ; 6.711216e-01 ];
Tc_10  = [ -8.632554e+01 ; -5.857564e+01 ; 4.795454e+02 ];
omc_error_10 = [ 4.036413e-03 ; 3.321254e-03 ; 5.310138e-03 ];
Tc_error_10  = [ 2.369351e+00 ; 1.778749e+00 ; 1.708051e+00 ];

