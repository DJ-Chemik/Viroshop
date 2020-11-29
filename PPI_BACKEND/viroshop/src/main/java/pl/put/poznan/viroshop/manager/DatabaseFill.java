package pl.put.poznan.viroshop.manager;

import pl.put.poznan.viroshop.dao.Unit;
import pl.put.poznan.viroshop.dao.entities.ProductEntity;
import pl.put.poznan.viroshop.dao.entities.ShopEntity;
import pl.put.poznan.viroshop.dao.entities.StoreEntity;
import pl.put.poznan.viroshop.dao.entities.UserEntity;

import java.time.LocalDate;

public class DatabaseFill {
    static ProductEntity[] productsEntities = new ProductEntity[]{
            new ProductEntity(1L, "111222333444", "Makaron", "Makaron", Unit.PACKAGE),
            new ProductEntity(2L, "222333444101", "Jajka", "Jajka 10 sztuk", Unit.PACKAGE),
            new ProductEntity(3L, "222333444121", "Jajka", "Jajka 12 sztuk", Unit.PACKAGE),
            new ProductEntity(4L, "333444555666", "Szynka", "Szynka", Unit.PACKAGE),
            new ProductEntity(5L, "111222333555", "Tofu", "Tofu", Unit.PACKAGE),
            new ProductEntity(6L, "112233445566", "Jabłko", "Jabłko", Unit.KILOGRAMS)
    };

    static ShopEntity[] shopEntities = new ShopEntity[]{
            new ShopEntity(1L, "Poznan", "Dworcowa", 15, "Biedronka"),
            new ShopEntity(2L, "Gdansk", "Warszawska", 1, "Auchan")
    };

    static StoreEntity[] storeEntities = new StoreEntity[]{
            new StoreEntity(1L, 50.0f, 23.20f, shopEntities[0], productsEntities[1]),
            new StoreEntity(2L, 5.0f, 15.99f, shopEntities[1], productsEntities[2]),
            new StoreEntity(3L, 1.0f, 2.50f, shopEntities[1], productsEntities[3]),
            new StoreEntity(5L, 20.0f, 3.00f, shopEntities[0], productsEntities[2]),
            new StoreEntity(4L, 12.0f, 5.00f, shopEntities[1], productsEntities[4]),
    };

    static UserEntity[] userEntities = new UserEntity[]{
            new UserEntity(1L, "lennon123", "lenon@lemon.pl", "ouiya11", LocalDate.of(1995, 1, 1)),
            new UserEntity(2L, "maQWE77", "jubikom@gmail.com", "Zazdro99", LocalDate.of(1990, 2, 22))
    };


}