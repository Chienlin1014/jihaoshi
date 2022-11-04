package com.cart.model;

import java.util.List;

import com.meal.model.MealVO;

public class CartService {

    public CartProdVO getCartProds(Double quantity, Integer amount, MealVO meal, CartProdVO prod, List<CartProdVO> cartProds) {
        for (int i = 0; i < cartProds.size(); i++) { // 尋找是否有同編號同份量商品
            prod = cartProds.get(i);
            if (prod.getMeal().getMealNo().equals(meal.getMealNo()) && prod.getQuantity().equals(quantity)) {
                prod.setAmount(prod.getAmount() + amount); // 找到就改變數量跟價格
                prod.setPrice((int) (meal.getMealPrice() * quantity * amount));
                prod.setCal((int) (meal.getMealCal() * quantity));
                return prod;
            }
        }
        // 查無同編號同份量商品時
        prod = new CartProdVO();
        prod.setMeal(meal);
        prod.setQuantity(quantity);
        prod.setAmount(amount);
        prod.setPrice((int) (meal.getMealPrice() * quantity * amount));
        prod.setCal((int) (meal.getMealCal() * quantity));
        return prod;
    }

    public Integer setTotalPrice(List<CartProdVO> cartProds) {
        Integer totalPrice = 0;
        for (CartProdVO CartProd : cartProds) {
            totalPrice += CartProd.getPrice();
        }
        return totalPrice;
    }

}
