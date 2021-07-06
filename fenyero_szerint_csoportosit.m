close all; clc; clear all;

%% kep beolvasasa
mappa_nev = 'kepek';
kepek = dir(fullfile(mappa_nev, '*.jpg'));

%% inic
kep_sorok = 500;
kep_oszlopok = 400;

komponensek = [1 4 200];
komponensek_hossz = length(komponensek);

kepek_szama = length(kepek);

minimum_dimenzio = 3;
maximum_dimenzio = 8;

%% fenyero szintek kiszamitasa

fenyero_szintek = zeros(1, kepek_szama);

for x = 1:kepek_szama
    kep_nev = kepek(x).name;
    eleresi_ut = strcat(kepek(x).folder, '/');

    kep = imread([eleresi_ut kep_nev]);
    fenyero_szintek(x) = mean2(kep);
end

%% atlag fenyero szamitasa

atlag_fenyero_szint = mean(fenyero_szintek);
alacsony_fenyerju_kepek = [];
magas_fenyerju_kepek = [];
tmp = [];

%% adatok szetosztasa az atlag fenyero szerint

for x = 1:kepek_szama
    if fenyero_szintek(x) > atlag_fenyero_szint
        magas_fenyerju_kepek = [magas_fenyerju_kepek, kepek(x)];
    else
        alacsony_fenyerju_kepek = [alacsony_fenyerju_kepek, kepek(x)];
    end
end

% for x = 1:kepek_szama
%     if fenyero_szintek(x) > 100
%         magas_fenyerju_kepek = [magas_fenyerju_kepek, kepek(x)];
%     else if fenyero_szintek(x) < 50
%         alacsony_fenyerju_kepek = [alacsony_fenyerju_kepek, kepek(x)];
%         else
%             tmp = [tmp, kepek(x)];
%         end
%     end
% end

% alacsony_fenyerju_kepek
% magas_fenyerju_kepek

%% alacsony fenyereju kepekre szamitasok

%% kulonfele abrak szurke
centered = 'on';
abrak_szurke(alacsony_fenyerju_kepek, kep_sorok, kep_oszlopok, minimum_dimenzio, maximum_dimenzio, 'svd', centered, 'szurke_af_38_cton_svd.png', 'szurke_af_38_cton_svd_ido.png');

centered = 'off';
abrak_szurke(alacsony_fenyerju_kepek, kep_sorok, kep_oszlopok, minimum_dimenzio, maximum_dimenzio, 'svd', centered, 'szurke_af_38_ctoff_svd.png', 'szurke_af_38_ctoff_svd_ido.png');

centered = 'on';
abrak_szurke(alacsony_fenyerju_kepek, kep_sorok, kep_oszlopok, minimum_dimenzio, maximum_dimenzio, 'eig', centered, 'szurke_af_38_cton_eig.png', 'szurke_af_38_cton_eig_ido.png');

centered = 'off';
abrak_szurke(alacsony_fenyerju_kepek, kep_sorok, kep_oszlopok, minimum_dimenzio, maximum_dimenzio, 'eig', centered, 'szurke_af_38_ctoff_eig.png', 'szurke_af_38_ctoff_eig_ido.png');

%% kulonfele abrak szines
centered = 'on';
abrak_szines(alacsony_fenyerju_kepek, kep_sorok, kep_oszlopok, minimum_dimenzio, maximum_dimenzio, 'svd', centered, 'szines_af_38_cton_svd.png', 'szines_af_38_cton_svd_ido.png');

centered = 'off';
abrak_szines(alacsony_fenyerju_kepek, kep_sorok, kep_oszlopok, minimum_dimenzio, maximum_dimenzio, 'svd', centered, 'szines_af_38_ctoff_svd.png', 'szines_af_38_ctoff_svd_ido.png');

centered = 'on';
abrak_szines(alacsony_fenyerju_kepek, kep_sorok, kep_oszlopok, minimum_dimenzio, maximum_dimenzio, 'eig', centered, 'szines_af_38_cton_eig.png', 'szines_af_38_cton_eig_ido.png');

centered = 'off';
abrak_szines(alacsony_fenyerju_kepek, kep_sorok, kep_oszlopok, minimum_dimenzio, maximum_dimenzio, 'eig', centered, 'szines_af_38_ctoff_eig.png', 'szines_af_38_ctoff_eig_ido.png'); 


%% magas fenyereju kepekre szamitasok

%% kulonfele abrak szurke
centered = 'on';
abrak_szurke(magas_fenyerju_kepek, kep_sorok, kep_oszlopok, minimum_dimenzio, maximum_dimenzio, 'svd', centered, 'szurke_mf_38_cton_svd.png', 'szurke_mf_38_cton_svd_ido.png');

centered = 'off';
abrak_szurke(magas_fenyerju_kepek, kep_sorok, kep_oszlopok, minimum_dimenzio, maximum_dimenzio, 'svd', centered, 'szurke_mf_38_ctoff_svd.png', 'szurke_mf_38_ctoff_svd_ido.png');

centered = 'on';
abrak_szurke(magas_fenyerju_kepek, kep_sorok, kep_oszlopok, minimum_dimenzio, maximum_dimenzio, 'eig', centered, 'szurke_mf_38_cton_eig.png', 'szurke_mf_38_cton_eig_ido.png');

centered = 'off';
abrak_szurke(magas_fenyerju_kepek, kep_sorok, kep_oszlopok, minimum_dimenzio, maximum_dimenzio, 'eig', centered, 'szurke_mf_38_ctoff_eig.png', 'szurke_mf_38_ctoff_eig_ido.png');

%% kulonfele abrak szines
centered = 'on';
abrak_szines(magas_fenyerju_kepek, kep_sorok, kep_oszlopok, minimum_dimenzio, maximum_dimenzio, 'svd', centered, 'szines_mf_38_cton_svd.png', 'szines_mf_38_cton_svd_ido.png');

centered = 'off';
abrak_szines(magas_fenyerju_kepek, kep_sorok, kep_oszlopok, minimum_dimenzio, maximum_dimenzio, 'svd', centered, 'szines_mf_38_ctoff_svd.png', 'szine_mfs_38_ctoff_svd_ido.png');

centered = 'on';
abrak_szines(magas_fenyerju_kepek, kep_sorok, kep_oszlopok, minimum_dimenzio, maximum_dimenzio, 'eig', centered, 'szines_mf_38_cton_eig.png', 'szines_mf_38_cton_eig_ido.png');

centered = 'off';
abrak_szines(magas_fenyerju_kepek, kep_sorok, kep_oszlopok, minimum_dimenzio, maximum_dimenzio, 'eig', centered, 'szines_mf_38_ctoff_eig.png', 'szines_mf_38_ctoff_eig_ido.png'); 


%% ido merese alacsony fényeroju kepekre
% idomeres_szam = 10;
% 
%  atlagok = idomeres_szamol(alacsony_fenyerju_kepek, kep_sorok, kep_oszlopok, minimum_dimenzio, maximum_dimenzio,idomeres_szam);
%  atlagok

%% ido merese magas fényeroju kepekre
% idomeres_szam = 10;
% 
%  atlagok = idomeres_szamol(magas_fenyerju_kepek, kep_sorok, kep_oszlopok, minimum_dimenzio, maximum_dimenzio,idomeres_szam);
%  atlagok
