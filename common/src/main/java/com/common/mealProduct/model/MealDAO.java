package com.common.mealProduct.model;

import java.sql.SQLException;
import java.util.List;

public interface MealDAO {
    public void insert(MealVO meal);

//    static void insert(MealVO meal) throws SQLException;

    public Integer update(MealVO meal);
    public Integer launch(Boolean launch);
    public MealVO findBymealName(String mealName);
    public MealVO findWithoutAllergen(String mealAllergen);
    public List<MealVO> getAll();
}
