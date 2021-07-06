function [eltelt_ido] = abrak_szurke(kepek, kep_sorok, kep_oszlopok, minimum_dimenzio, maximum_dimenzio, hasznalt_algoritmus, centered, abranev, ido_abranev)
    tomb_hossz = maximum_dimenzio - minimum_dimenzio;

    ssim_ertek_szurke_atlagok = zeros(1,tomb_hossz);
    peaksnr_szurke_atlagok = zeros(1,tomb_hossz);
    err_szurke_atlagok = zeros(1,tomb_hossz);
    score_szurke_atlagok = zeros(1,tomb_hossz);
    i = 1;

    eltelt_ido = zeros(1,tomb_hossz);

    for x = minimum_dimenzio:maximum_dimenzio
        [ssim_ertek_szurke_atlagok(i), peaksnr_szurke_atlagok(i), ...
            err_szurke_atlagok(i), score_szurke_atlagok(i), eltelt_ido(i)] = tomorites_szurke_atlag(kepek,kep_sorok, kep_oszlopok, x, hasznalt_algoritmus, centered);

        i = i + 1;
    end

    x_tengely = [minimum_dimenzio:maximum_dimenzio];

    normalizalt_peaksnr_szurke_atlagok = zeros(1,tomb_hossz);
    normalizalt_err_szurke_atlagok = zeros(1,tomb_hossz);

    for x = 1:length(peaksnr_szurke_atlagok)
        normalizalt_peaksnr_szurke_atlagok(x) = atan(peaksnr_szurke_atlagok(x));
        normalizalt_err_szurke_atlagok(x) = 1 - atan(err_szurke_atlagok(x));
    end
    
    fig1 = figure(); hold on;
    plot(x_tengely, ssim_ertek_szurke_atlagok, 'Color', '#7E2F8E'); %lila
    plot(x_tengely, normalizalt_peaksnr_szurke_atlagok, 'Color', '#D95319'); %piros
    plot(x_tengely, normalizalt_err_szurke_atlagok, 'Color', '#EDB120'); %narancs
    plot(x_tengely, score_szurke_atlagok, 'Color', '#0072BD'); %kek
%     xlabel('komponensek száma')
%     ylabel('jóság')
%     legend({'SSIM','PSNR','MSE','MS-SSIM'},'Location','southwest')
    saveas(fig1,abranev)
    figure();
    fig2 = plot(x_tengely, eltelt_ido);
    saveas(fig2,ido_abranev)
    
%     ssim_ertek_szurke_atlagok
%     normalizalt_peaksnr_szurke_atlagok
%     normalizalt_err_szurke_atlagok
%     score_szurke_atlagok

% peaksnr_szurke_atlagok
% err_szurke_atlagok
end