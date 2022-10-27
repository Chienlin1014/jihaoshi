package com.meal.model;

import java.util.List;

public interface MealDAO {
    MealVO insert(MealVO meal);
    void update(MealVO meal);
    void updateWithoutPhoto(MealVO meal);
    Integer launchOn(Integer mealNo);
    Integer launchOff(Integer mealNo);
    MealVO findByMealName(String mealName);
    MealVO findWithoutAllergen(String mealAllergen);

    MealVO findByMealNo(Integer mealNo);
    List<MealVO> getAll();
}
