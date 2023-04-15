package com.svalero.models;

import lombok.*;

import java.time.LocalDate;

@Data
@AllArgsConstructor
@RequiredArgsConstructor
@NoArgsConstructor
@ToString
public class Torneo {
    private String id_torneo;
    private String id_club;
    private String id_juego;

    private LocalDate fecha;
    @NonNull
    private String hora_init;
    @NonNull
    private int num_plazas;
}
