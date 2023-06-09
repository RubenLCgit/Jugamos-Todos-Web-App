package com.svalero.models;

import lombok.*;

@Data
@AllArgsConstructor
@RequiredArgsConstructor
@NoArgsConstructor
@ToString
public class Club {
    private String id;
    @NonNull
    private String nom_club;
    @NonNull
    private String nom_calle;
    @NonNull
    private String num_calle;
    @NonNull
    private String cp;
    @NonNull
    private String hor_apert;
    @NonNull
    private String hor_cierre;
}
