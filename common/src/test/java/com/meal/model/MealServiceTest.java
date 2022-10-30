package com.meal.model;

import static org.junit.jupiter.api.Assertions.assertEquals;

import java.util.List;

import org.junit.jupiter.api.Test;

import com.cart.model.CartProdVO;

class MealServiceTest {

    @Test
    void should_calculate_price_if_there_is_only_one_product_in_the_cart() {
        // Given
        var mealService = new MealService();
        var cart = new CartProdVO();
        cart.setPrice(100);
        cart.setAmount(1);
        cart.setQuantity(1.0);
        var cartProds = List.of(cart);

        // When
        var price = mealService.calculatePrice(cartProds);

        // Then
        assertEquals(100, price);
    }

    @Test
    void should_calculate_price_with_amount() {
        // Given
        var mealService = new MealService();
        var cart = new CartProdVO();
        cart.setPrice(100);
        cart.setAmount(2);
        cart.setQuantity(1.0);
        var cartProds = List.of(cart);

        // When
        var price = mealService.calculatePrice(cartProds);

        // Then
        assertEquals(200, price);
    }

    @Test
    void should_calculate_price_with_quantity() {
        // Given
        var mealService = new MealService();
        var cart = new CartProdVO();
        cart.setPrice(100);
        cart.setAmount(1);
        cart.setQuantity(1.5);
        var cartProds = List.of(cart);

        // When
        var price = mealService.calculatePrice(cartProds);

        // Then
        assertEquals(150, price);
    }

    @Test
    void should_calculate_price_from_cart() {
        // Given
        var mealService = new MealService();
        var cart1 = new CartProdVO();
        cart1.setPrice(100);
        cart1.setAmount(1);
        cart1.setQuantity(1.0);
        var cart2 = new CartProdVO();
        cart2.setPrice(200);
        cart2.setAmount(1);
        cart2.setQuantity(1.0);
        var cartProds = List.of(cart1, cart2);

        // When
        var price = mealService.calculatePrice(cartProds);

        // Then
        assertEquals(300, price);
    }
}
