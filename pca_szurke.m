function [visszaallitott_vegso] = pca_szurke(szurke_kep, komponensek_szama, hasznalt_algoritmus, centered)
    szurke_kep_double = double(szurke_kep);
    szurke_kep_double_atlag = mean(szurke_kep_double);
    kep_pcahoz = szurke_kep_double - szurke_kep_double_atlag;
    %[coeff, score,latent,tsquared,explained] = pca(kep_pcahoz,'algorithm', hasznalt_algoritmus, 'NumComponents',komponensek_szama, 'Centered',centered);
    [coeff, score] = pca(kep_pcahoz,'algorithm', hasznalt_algoritmus, 'NumComponents',komponensek_szama, 'Centered',centered);
    visszaallitott = score(:,1:komponensek_szama) * coeff(:,1:komponensek_szama)';
    visszaallitott_vegso = visszaallitott + szurke_kep_double_atlag;
    visszaallitott_vegso = uint8(visszaallitott_vegso);
end