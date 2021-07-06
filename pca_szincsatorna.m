function [visszaallitott_vegso] = pca_szincsatorna(szines_kep, komponensek_szama, szincsatorna, hasznalt_algoritmus, centered)
    szincsatorna_kep_double = double(szines_kep(:,:,szincsatorna));
    szincsatorna_kep_double_atlag = mean(szincsatorna_kep_double);
    szincsatorna_kep_pcahoz = szincsatorna_kep_double - szincsatorna_kep_double_atlag;
    [coeff, score] = pca(szincsatorna_kep_pcahoz, 'algorithm', hasznalt_algoritmus, 'NumComponents',komponensek_szama, 'Centered',centered);
    visszaallitott = score(:,1:komponensek_szama) * coeff(:,1:komponensek_szama)';
    visszaallitott_vegso = visszaallitott + szincsatorna_kep_double_atlag;
    visszaallitott_vegso = uint8(visszaallitott_vegso);
end