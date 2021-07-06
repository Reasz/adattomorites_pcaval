function [ssim_ertek_szurke, peaksnr_szurke, err_szurke, score_szurke, kepek_szurke] = tomorites_szurke(kepek, kep_sorok, kep_oszlopok, komponensek_szama, hasznalt_algoritmus, centered)
    
    kepek_szama = length(kepek);
    
    ssim_ertek_szurke = zeros(1,kepek_szama);
    %ssim_map_szurke = zeros(1,kepek_szama);
    peaksnr_szurke = zeros(1,kepek_szama);
    err_szurke = zeros(1,kepek_szama);
    score_szurke = zeros(1,kepek_szama);
    
    i = 1;

    for x = 1:kepek_szama
        kep_nev = kepek(x).name;
        eleresi_ut = strcat(kepek(x).folder, '/');

        szines_kep = imread([eleresi_ut kep_nev]);
        %szines_kep = imresize(szines_kep,[kep_sorok kep_oszlopok]);
        szurke_kep = rgb2gray(szines_kep);

        %% tomorites szurke kep
        szurke_tomoritett_kep = pca_szurke(szurke_kep, komponensek_szama, hasznalt_algoritmus, centered);
        
        %% kepek
        kepek_szurke{i} = szurke_kep;
        i = i + 1;
        kepek_szurke{i} = szurke_tomoritett_kep;
        i = i + 1;

        %% PCA josaganak merese
        % SSIM | CSAK GRAYSCALE KEPEKRE
        %[ssim_ertek_szurke,ssim_map_szurke] = ssim(szurke_tomoritett_kep, szurke_kep);
        ssim_ertek_szurke(x) = ssim(szurke_tomoritett_kep, szurke_kep);

        %figure(); imshow(ssim_map_szurke,[])
        %title(['Local SSIM Map with Global SSIM Value: ',num2str(ssim_ertek_szurke)])

        % PSNR
        peaksnr_szurke(x) = psnr(szurke_tomoritett_kep, szurke_kep);

        % mean-squared error
        err_szurke(x) = immse(szurke_tomoritett_kep,szurke_kep);

        % MS-SSIM
        score_szurke(x) = multissim(szurke_tomoritett_kep,szurke_kep);
        
    end
end