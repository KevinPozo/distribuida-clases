package com.programacion.distribuida.web03;

import lombok.Builder;
import lombok.Data;

@Builder
@Data
public class Book {
    private String isbn;
    private String title;
}
