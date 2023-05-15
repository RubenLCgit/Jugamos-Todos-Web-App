package com.svalero.models;

import lombok.*;

import java.time.LocalDate;

@Data
@AllArgsConstructor
@RequiredArgsConstructor
@NoArgsConstructor
@ToString
public class Jugador {
    private String id_jugador;
    @NonNull
    private String nomJugador;
    @NonNull
    private String apellidos;
    @NonNull
    private LocalDate fecha_nac;
    @NonNull
    private String telefono;
    @NonNull
    private String userName;
    @NonNull
    private String password;
}
