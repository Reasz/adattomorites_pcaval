function [atlagok] = idomeres_szamol(kepek, kep_sorok, kep_oszlopok, minimum_dimenzio, maximum_dimenzio,idomeres_szam)
    
    set(0,'DefaultFigureVisible','off');

    tomb_hossz = maximum_dimenzio - minimum_dimenzio;

    idomeres_matrix = zeros(idomeres_szam, tomb_hossz + 1, 8);
    
    atlagok = zeros(8, tomb_hossz + 1);
    
    for x = 1 : idomeres_szam
        x
        
%         szurke
        centered = 'on';
        idomeres_matrix(x, :, 1) = abrak_szurke(kepek, kep_sorok, kep_oszlopok, minimum_dimenzio, maximum_dimenzio, 'svd', centered, 'im.png', 'im.png');

        centered = 'off';
        idomeres_matrix(x, :, 2) = abrak_szurke(kepek, kep_sorok, kep_oszlopok, minimum_dimenzio, maximum_dimenzio, 'svd', centered, 'im.png', 'im.png');

        centered = 'on';
        idomeres_matrix(x, :, 3) = abrak_szurke(kepek, kep_sorok, kep_oszlopok, minimum_dimenzio, maximum_dimenzio, 'eig', centered, 'im.png', 'im.png');

        centered = 'off';
        idomeres_matrix(x, :, 4) = abrak_szurke(kepek, kep_sorok, kep_oszlopok, minimum_dimenzio, maximum_dimenzio, 'eig', centered, 'im.png', 'im.png');

%         szines
        centered = 'on';
        idomeres_matrix(x, :, 5) = abrak_szines(kepek, kep_sorok, kep_oszlopok, minimum_dimenzio, maximum_dimenzio, 'svd', centered, 'im.png', 'im.png');

        centered = 'off';
        idomeres_matrix(x, :, 6) = abrak_szines(kepek, kep_sorok, kep_oszlopok, minimum_dimenzio, maximum_dimenzio, 'svd', centered, 'im.png', 'im.png');

        centered = 'on';
        idomeres_matrix(x, :, 7) = abrak_szines(kepek, kep_sorok, kep_oszlopok, minimum_dimenzio, maximum_dimenzio, 'eig', centered, 'im.png', 'im.png');

        centered = 'off';
        idomeres_matrix(x, :, 8) = abrak_szines(kepek, kep_sorok, kep_oszlopok, minimum_dimenzio, maximum_dimenzio, 'eig', centered, 'im.png', 'im.png'); 
    end
        
    for x = 1 : 8
        seged_matrix = idomeres_matrix(:, :, x);
        for y = 1 : tomb_hossz + 1
            atlagok(x, y) = mean ( seged_matrix(:, y) );
        end
    end
    
%     atlagok
%     idomeres_matrix
    
    set(0,'DefaultFigureVisible','on');
end