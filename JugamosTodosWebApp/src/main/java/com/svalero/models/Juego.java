package com.svalero.models;

import lombok.*;

import java.util.List;

@Data
@AllArgsConstructor
@RequiredArgsConstructor
@NoArgsConstructor
@ToString
public class Juego {
    private String id_jue_pk;
    @NonNull
    private String nombre;
    @NonNull
    private int max_jug;
    @NonNull
    private String tipo;
    @NonNull
    private int duracion_max;

    private List<Club> clubs;
}
