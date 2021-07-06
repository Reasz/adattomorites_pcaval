function [peaksnr_szines_atlag, err_szines_atlag, eltelt_ido] = tomorites_szines_atlag(kepek, ...
    kep_sorok, kep_oszlopok, komponensek_szama, hasznalt_algoritmus, centered)
    
    kepek_szama = length(kepek);
    
    peaksnr_szines = 0;
    err_szines = 0;
    
    eltelt_ido = 0;

    for x = 1:kepek_szama
        kep_nev = kepek(x).name;
        eleresi_ut = strcat(kepek(x).folder, '/');

        szines_kep = imread([eleresi_ut kep_nev]);
        szines_kep = imresize(szines_kep,[kep_sorok kep_oszlopok]);

        %% tomorites szines kep
        tic;
        szines_tomoritett_kep = pca_szines(szines_kep, komponensek_szama, hasznalt_algoritmus, centered);
        ido = toc;
        eltelt_ido = eltelt_ido + ido;
                        
        %% PCA josaganak merese
        
        % PSNR
        peaksnr_szines = peaksnr_szines + psnr(szines_tomoritett_kep, szines_kep);

        % mean-squared error
        err_szines = err_szines + immse(szines_tomoritett_kep, szines_kep);
        
    end
    
    peaksnr_szines_atlag = peaksnr_szines / kepek_szama;
    err_szines_atlag = err_szines / kepek_szama;
end