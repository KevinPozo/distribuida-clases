package com.programacion.distribuida.web03;

import io.helidon.config.Config;
import io.helidon.dbclient.DbClient;
import io.helidon.webserver.WebServer;
import io.helidon.webserver.http.ServerRequest;
import io.helidon.webserver.http.ServerResponse;
import jakarta.json.Json;
import jakarta.json.JsonBuilderFactory;
import jakarta.json.JsonObject;

import java.util.Map;

public class Web03Main {
    private static DbClient dbClient;

    public static void handleBooks(ServerRequest req, ServerResponse res) {
      var books =  dbClient.execute()
                .createQuery("select * from books")
                .execute()
                .map(row->Book.builder()
                        .title("El Sikario de wallstreat")
                        .isbn("1231231-3413-656563-24467")
                        .build()
                        )
                .toList();
        res.send(books);
        //JSONP
//        JsonBuilderFactory factory = Json.createBuilderFactory(Map.of());
//        JsonObject book = factory.createObjectBuilder()
//                .add("title","El QUijote")
//                .add("isbn","2123-12312-5452-2123")
//                .build();
//
//        res.send(book);
        //JSONB
//        var book1 = Book.builder()
//                .title("El Sikario de wallstreat")
//                .isbn("1231231-3413-656563-24467")
//                .build();
//        res.send(book1);

    }

    public static void main(String[] args) {
        Config config = Config.create();

        var confighttp = config.get("server");
        var configdb = config.get("db");

        // Corregido: asignación directa al campo estático 'dbClient'
        dbClient = DbClient.builder()
                .config(configdb)
                .build();

        WebServer.builder()
                .config(confighttp)
                .routing(router -> router
                        .get("/books", Web03Main::handleBooks) // Ruta registrada correctamente
                )
                .build()
                .start();

        System.out.println("Servidor Web03 iniciado...");
    }
}