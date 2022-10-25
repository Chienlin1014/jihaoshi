package com.meal.model;

import java.io.BufferedInputStream;
import java.util.List;

public interface MealDAO {
    MealVO insert(MealVO meal);
    void update(MealVO meal);
    Integer launchOn(Integer mealNo);
    Integer launchOff(Integer mealNo);
    MealVO findByMealName(String mealName);
    MealVO findWithoutAllergen(String mealAllergen);

    BufferedInputStream showMealphoto(Integer mealNo);
    MealVO findByMealNo(Integer mealNo);
    List<MealVO> getAll();
}
