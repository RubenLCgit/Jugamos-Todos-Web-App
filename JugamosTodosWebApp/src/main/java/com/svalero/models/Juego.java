package com.svalero.models;

import lombok.*;

import java.util.List;

@Data
@AllArgsConstructor
@RequiredArgsConstructor
@NoArgsConstructor
@ToString
public class Juego {
    private String id;
    @NonNull
    private String nomJuego;
    @NonNull
    private int max_jug;
    @NonNull
    private String tipo;
    @NonNull
    private int duracion_max;
}
