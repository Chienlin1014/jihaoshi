package com.meal.model;

import java.util.List;

public interface MealDAO {
    public void insert(MealVO meal);

//    static void insert(MealVO meal) throws SQLException;

    Integer update(MealVO meal);
    Integer launchOn(Integer mealNo);
    Integer launchOff(Integer mealNo);
    MealVO findBymealName(String mealName);
    MealVO findWithoutAllergen(String mealAllergen);
    List<MealVO> getAll();
}
