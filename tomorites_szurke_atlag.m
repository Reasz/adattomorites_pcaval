function [ssim_ertek_szurke_atlag, peaksnr_szurke_atlag, err_szurke_atlag, score_szurke_atlag, eltelt_ido] = tomorites_szurke_atlag(kepek, ...
    kep_sorok, kep_oszlopok, komponensek_szama, hasznalt_algoritmus, centered)
    
    kepek_szama = length(kepek);
    
    ssim_ertek_szurke = 0;
    peaksnr_szurke = 0;
    err_szurke = 0;
    score_szurke = 0;
    
    eltelt_ido = 0;

    for x = 1:kepek_szama
        kep_nev = kepek(x).name;
        eleresi_ut = strcat(kepek(x).folder, '/');

        szines_kep = imread([eleresi_ut kep_nev]);
        szines_kep = imresize(szines_kep,[kep_sorok kep_oszlopok]);
        szurke_kep = rgb2gray(szines_kep);

        %% tomorites szurke kep
        tic;
        szurke_tomoritett_kep = pca_szurke(szurke_kep, komponensek_szama, hasznalt_algoritmus, centered);
        ido = toc;
        eltelt_ido = eltelt_ido + ido;
                        
        %% PCA josaganak merese
        % SSIM | CSAK GRAYSCALE KEPEKRE
        ssim_ertek_szurke = ssim_ertek_szurke + ssim(szurke_tomoritett_kep, szurke_kep);

        % PSNR
        peaksnr_szurke = peaksnr_szurke + psnr(szurke_tomoritett_kep, szurke_kep);

        % mean-squared error
        err_szurke = err_szurke + immse(szurke_tomoritett_kep,szurke_kep);

        % MS-SSIM
        score_szurke = score_szurke + multissim(szurke_tomoritett_kep,szurke_kep);
        
    end
    
    ssim_ertek_szurke_atlag = ssim_ertek_szurke / kepek_szama;
    peaksnr_szurke_atlag = peaksnr_szurke / kepek_szama;
    err_szurke_atlag = err_szurke / kepek_szama;
    score_szurke_atlag = score_szurke / kepek_szama;
end