CREATE TABLE IF NOT EXISTS recipes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    ingredients TEXT,
    instructions TEXT
);

-- Insert Moroccan recipes
INSERT INTO recipes (name, ingredients, instructions) VALUES
('Chicken Tagine with Olives and Lemons', 
 'Chicken, Olives, Preserved Lemons, Onion, Garlic, Ginger, Saffron, Turmeric, Cumin, Coriander, Olive Oil, Salt, Pepper', 
 '1. Marinate chicken with spices and olive oil.\n2. Sauté onions, garlic, and ginger in a tagine or pot.\n3. Add chicken and brown lightly.\n4. Add preserved lemons, olives, and a bit of water.\n5. Cover and simmer for 1 hour until chicken is tender.'),

('Lamb Couscous', 
 'Lamb, Couscous, Carrots, Zucchini, Turnips, Chickpeas, Onion, Garlic, Ginger, Turmeric, Cumin, Paprika, Olive Oil, Salt, Pepper', 
 '1. Cook lamb with spices, onions, and garlic in a large pot.\n2. Add chopped vegetables and chickpeas.\n3. Simmer until lamb is tender.\n4. Prepare couscous separately by steaming it.\n5. Serve lamb and vegetables over couscous.'),

('Harira Soup', 
 'Lamb or Beef, Tomatoes, Lentils, Chickpeas, Onion, Celery, Cilantro, Parsley, Ginger, Turmeric, Cinnamon, Saffron, Vermicelli, Flour, Lemon Juice, Salt, Pepper', 
 '1. Cook meat with onions, celery, and spices.\n2. Add tomatoes, lentils, and chickpeas.\n3. Simmer until lentils are tender.\n4. Add vermicelli and a flour-water mixture to thicken the soup.\n5. Finish with lemon juice and fresh herbs.'),

('Moroccan Mint Tea', 
 'Green Tea, Fresh Mint Leaves, Sugar, Water', 
 '1. Boil water and add green tea leaves.\n2. Let steep for 2-3 minutes.\n3. Add fresh mint leaves and sugar.\n4. Stir well and serve hot in small glasses.'),

('Pastilla (Moroccan Chicken Pie)', 
 'Chicken, Phyllo Dough, Almonds, Onion, Eggs, Cinnamon, Ginger, Saffron, Powdered Sugar, Butter, Salt, Pepper', 
 '1. Cook chicken with onions, spices, and a bit of water.\n2. Shred the chicken and mix with beaten eggs.\n3. Layer phyllo dough in a pie dish, brushing each layer with butter.\n4. Add the chicken mixture and a layer of ground almonds.\n5. Cover with more phyllo dough and bake until golden.\n6. Dust with powdered sugar and cinnamon before serving.'),

('Zaalouk (Moroccan Eggplant Salad)', 
 'Eggplant, Tomatoes, Garlic, Olive Oil, Paprika, Cumin, Cilantro, Lemon Juice, Salt, Pepper', 
 '1. Roast eggplant until soft.\n2. Sauté garlic, tomatoes, and spices in olive oil.\n3. Mash the roasted eggplant and mix with the tomato mixture.\n4. Cook until thick and flavorful.\n5. Garnish with cilantro and a squeeze of lemon juice.'),

('Moroccan Kefta Tagine', 
 'Ground Beef or Lamb, Onion, Garlic, Parsley, Cumin, Paprika, Cinnamon, Eggs, Tomato Sauce, Olive Oil, Salt, Pepper', 
 '1. Mix ground meat with spices, onions, garlic, and parsley.\n2. Shape into small meatballs.\n3. Cook meatballs in a tagine or pot with tomato sauce.\n4. Crack eggs into the sauce and cook until set.\n5. Serve with bread or couscous.');