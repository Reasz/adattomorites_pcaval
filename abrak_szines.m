function [eltelt_ido] = abrak_szines(kepek, kep_sorok, kep_oszlopok, minimum_dimenzio, maximum_dimenzio, hasznalt_algoritmus, centered, abranev, ido_abranev)
    tomb_hossz = maximum_dimenzio - minimum_dimenzio;

    peaksnr_szines_atlagok = zeros(1,tomb_hossz);
    err_szines_atlagok = zeros(1,tomb_hossz);
    i = 1;

    eltelt_ido = zeros(1,tomb_hossz);

    for x = minimum_dimenzio:maximum_dimenzio
        [peaksnr_szines_atlagok(i), err_szines_atlagok(i), ...
            eltelt_ido(i)] = tomorites_szines_atlag(kepek,kep_sorok, kep_oszlopok, x, hasznalt_algoritmus, centered);

        i = i + 1;
    end

    x_tengely = [minimum_dimenzio:maximum_dimenzio];

    normalizalt_peaksnr_szines_atlagok = zeros(1,tomb_hossz);
    normalizalt_err_szines_atlagok = zeros(1,tomb_hossz);

    for x = 1:length(peaksnr_szines_atlagok)
        normalizalt_peaksnr_szines_atlagok(x) = atan(peaksnr_szines_atlagok(x));
        normalizalt_err_szines_atlagok(x) = 1 - atan(err_szines_atlagok(x));
    end
    
    fig1 = figure(); hold on;
    plot(x_tengely, normalizalt_peaksnr_szines_atlagok, 'b');
    plot(x_tengely, normalizalt_err_szines_atlagok, 'r');
%     xlabel('komponensek száma')
%     ylabel('jóság')
%     legend({'PSNR','MSE'},'Location','southwest')
    saveas(fig1, abranev)
    fig2 = figure();
    plot(x_tengely, eltelt_ido);
    saveas(fig2,ido_abranev)
    
%     normalizalt_peaksnr_szines_atlagok
%     normalizalt_err_szines_atlagok
% peaksnr_szines_atlagok
% err_szines_atlagok
end