function [peaksnr_szines, err_szines, kepek_szines] = tomorites_szines(kepek, kep_sorok, kep_oszlopok, komponensek_szama, hasznalt_algoritmus, centered)
    
    kepek_szama = length(kepek);

    peaksnr_szines = zeros(1,kepek_szama);   
    err_szines = zeros(1,kepek_szama);
    score_szines = zeros(3,kepek_szama);
    
    i = 1;

    for x = 1:kepek_szama
        kep_nev = kepek(x).name;
        eleresi_ut = strcat(kepek(x).folder, '/');

        szines_kep = imread([eleresi_ut kep_nev]);
        szines_kep = imresize(szines_kep,[kep_sorok kep_oszlopok]);

        %% tomorites szines kep
        szines_tomoritett_kep = pca_szines(szines_kep, komponensek_szama, hasznalt_algoritmus, centered);
        
        %% kepek
        kepek_szines{i} = szines_kep;
        i = i + 1;
        kepek_szines{i} = szines_tomoritett_kep;
        i = i + 1;

        %% PCA josaganak merese
        % PSNR
        peaksnr_szines(x) = psnr(szines_tomoritett_kep, szines_kep);

        % mean-squared error
        err_szines(x) = immse(szines_tomoritett_kep,szines_kep);

        % MS-SSIM
        score_szines_id = multissim(szines_tomoritett_kep,szines_kep);

        score_szines(1,x) = score_szines_id(1);
        score_szines(2,x) = score_szines_id(2);
        score_szines(3,x) = score_szines_id(3);
    end
end