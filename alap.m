close all; clc; clear all;

%% kep beolvasasa
kepek = dir(fullfile('kepek', '*.jpg'));

%% inic
kep_sorok = 500;
kep_oszlopok = 400;

komponensek = [1 4 200];
komponensek_hossz = length(komponensek);

kepek_szama = length(kepek);

minimum_dimenzio = 3;
maximum_dimenzio = 8;

%% kulonfele abrak szurke
centered = 'on';
abrak_szurke(kepek, kep_sorok, kep_oszlopok, minimum_dimenzio, maximum_dimenzio, 'svd', centered, 'szurke_38_cton_svd.png', 'szurke_38_cton_svd_ido.png');

centered = 'off';
abrak_szurke(kepek, kep_sorok, kep_oszlopok, minimum_dimenzio, maximum_dimenzio, 'svd', centered, 'szurke_38_ctoff_svd.png', 'szurke_38_ctoff_svd_ido.png');

centered = 'on';
abrak_szurke(kepek, kep_sorok, kep_oszlopok, minimum_dimenzio, maximum_dimenzio, 'eig', centered, 'szurke_38_cton_eig.png', 'szurke_38_cton_eig_ido.png');

centered = 'off';
abrak_szurke(kepek, kep_sorok, kep_oszlopok, minimum_dimenzio, maximum_dimenzio, 'eig', centered, 'szurke_38_ctoff_eig.png', 'szurke_38_ctoff_eig_ido.png');

%% kulonfele abrak szines
centered = 'on';
abrak_szines(kepek, kep_sorok, kep_oszlopok, minimum_dimenzio, maximum_dimenzio, 'svd', centered, 'szines_38_cton_svd.png', 'szines_38_cton_svd_ido.png');

centered = 'off';
abrak_szines(kepek, kep_sorok, kep_oszlopok, minimum_dimenzio, maximum_dimenzio, 'svd', centered, 'szines_38_ctoff_svd.png', 'szines_38_ctoff_svd_ido.png');

centered = 'on';
abrak_szines(kepek, kep_sorok, kep_oszlopok, minimum_dimenzio, maximum_dimenzio, 'eig', centered, 'szines_38_cton_eig.png', 'szines_38_cton_eig_ido.png');

centered = 'off';
abrak_szines(kepek, kep_sorok, kep_oszlopok, minimum_dimenzio, maximum_dimenzio, 'eig', centered, 'szines_38_ctoff_eig.png', 'szines_38_ctoff_eig_ido.png'); 

%% ido merese

idomeres_szam = 10;

 atlagok = idomeres_szamol(kepek, kep_sorok, kep_oszlopok, minimum_dimenzio, maximum_dimenzio,idomeres_szam);
 atlagok

%% adatok & abrak szurke
% komponensek = [1 4 170];
% for x = 1:komponensek_hossz
%     [ssim_ertek_szurke, peaksnr_szurke, err_szurke, score_szurke, ...
%         kepek_szurke{x}] = tomorites_szurke(kepek,kep_sorok, kep_oszlopok, komponensek(x), 'svd', 'on');
%     
%     figure(1); subplot(komponensek_hossz,1,x);
%     bar(ssim_ertek_szurke); ylim([0 1]);
%     title(['SSIM, komponensek szama: ', num2str(komponensek(x))]);
%         
%     figure(2); subplot(komponensek_hossz,1,x);
%     bar(peaksnr_szurke); ylim([0 100]);
%     title(['peaksnr szurke, komponensek szama: ', num2str(komponensek(x))]);
%     
%     figure(3); subplot(komponensek_hossz,1,x);
%     bar(err_szurke); ylim([0 4000]);
%     title(['err szurke, komponensek szama: ', num2str(komponensek(x))]);
%     
%     figure(4); subplot(komponensek_hossz,1,x);
%     bar(score_szurke); ylim([0 1]);
%     title(['score szurke, komponensek szama: ', num2str(komponensek(x))]);
% end

%% adatok & abrak szines

% komponensek = [1 4 170];
% for x = 1:komponensek_hossz
%     [peaksnr_szines, err_szines, ...
%         kepek_szines{x}] = tomorites_szines(kepek,kep_sorok, kep_oszlopok, komponensek(x), 'svd', 'on');
%     
%     figure(5); subplot(komponensek_hossz,1,x);
%     bar(peaksnr_szines); ylim([0 100]);
%     title(['peaksnr szines, komponensek szama: ', num2str(komponensek(x))]);
% 
%     figure(6); subplot(komponensek_hossz,1,x);
%     bar(err_szines); ylim([0 4000]);
%     title(['err szines, komponensek szama: ', num2str(komponensek(x))]);
% 
% end