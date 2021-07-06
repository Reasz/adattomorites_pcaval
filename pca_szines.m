function [visszaallitott_vegso] = pca_szines(szines_kep, komponensek_szama, hasznalt_algoritmus, centered)
    % piros szincsatorna
    piros_csatorna_pca = pca_szincsatorna(szines_kep, komponensek_szama, 1, hasznalt_algoritmus, centered);
    % zold szincsatorna
    zold_csatorna_pca = pca_szincsatorna(szines_kep, komponensek_szama, 2, hasznalt_algoritmus, centered);
    % kek szincsatorna
    kek_csatorna_pca = pca_szincsatorna(szines_kep, komponensek_szama, 3, hasznalt_algoritmus, centered);
    % szincsatornak osszevonasa
    visszaallitott_vegso = cat(3, piros_csatorna_pca, zold_csatorna_pca, kek_csatorna_pca);
end